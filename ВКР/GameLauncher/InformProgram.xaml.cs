﻿using System;
using System.Drawing;
using System.IO;
using System.Windows;
using System.Windows.Interop;
using System.Windows.Media.Imaging;

namespace GameLauncher
{
	/// <summary>
	/// Логика взаимодействия для InformProgram.xaml
	/// </summary>
	public partial class InformProgram : Window
	{
		/// <summary>
		/// Переменная используемая для записи пути к ярлыку исполняемого файла
		/// </summary>
		string filename = "";
		/// <summary>
		/// Переменная используемая для записи пути к изображению используемого в качестве иконки
		/// </summary>
		string filenameImage = "";
		/// <summary>
		/// переменная хранящая сведения о программе
		/// </summary>
		InformationProgramm information;
		private bool flag = true;
		public InformProgram()
		{
			InitializeComponent();
		}
		/// <summary>
		/// Конструктор класса, заполняет объекты контентом в соответствии с полученным объектом класса InformationProgramm
		/// </summary>
		/// <param name="information"> Информация о программе</param>
		public InformProgram(InformationProgramm information)
		{
			InitializeComponent();
			flag = false;
			this.information = information;
			NameProg.Text = information.NameProgramm;
			DescriotionsProg.Text = information.DescriptionProgram;
			PatchProg.Text = information.LocationExeFile;
			ImgProg.Source = BitmapFrame.Create(new Uri(information.IconsProg));
		}
		/// <summary>
		/// Метод обрабатывающий нажатие по кнопке "Обзор", открывает проводник для выбора ярлыка к исполняемому файлу нужного приложения.
		/// </summary>
		/// <paramп name="sender"></param>
		/// <param name="e"></param>
		private void Button_Click(object sender, RoutedEventArgs e)
		{
			Microsoft.Win32.OpenFileDialog dialog = new Microsoft.Win32.OpenFileDialog();
			dialog.Filter = "Исполняемый файл (*.lnk)|*.lnk";
			dialog.FilterIndex = 1;
			bool? result = dialog.ShowDialog();

			if (result == true)
			{
				// Open document
				filename = dialog.FileName;
				try
				{
					PatchProg.Text = filename;
					using (Icon ico = System.Drawing.Icon.ExtractAssociatedIcon(filename))
					{
						ImgProg.Source = Imaging.CreateBitmapSourceFromHIcon(ico.Handle, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
					}
				}
				catch (Exception)
				{
					MessageBox.Show("Неверный формат");
					filename = "";
				}
			}
		}
		/// <summary>
		/// Метод обрабатывающий нажатие по кнопке "Обзор", открывает проводник для выбора изображения которое будет являться иконкой для приложения
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Button_Click_1(object sender, RoutedEventArgs e)
		{
			Microsoft.Win32.OpenFileDialog dialog = new Microsoft.Win32.OpenFileDialog();
			dialog.Filter = "Изображения (*.png)|*.png|Иконки (*.ico)|*.ico|Всё (*.*)|*.*";
			dialog.FilterIndex = 1;
			bool? result = dialog.ShowDialog();

			if (result == true)
			{
				// Open document
				filenameImage = dialog.FileName;
				try
				{
					ImgProg.Source = BitmapFrame.Create(new Uri(filenameImage));
				}
				catch (Exception)
				{
					MessageBox.Show("Неверный формат изображения");
					filenameImage = "";
				}
			}
		}

		private void Button_Click_2(object sender, RoutedEventArgs e)
		{
			if(NameProg.Text.Replace(" ", "") != ""&& PatchProg.Text.Replace(" ", "") != ""&& ImgProg.Source!=null)
			{
				if (flag == true)
				{
					InformationProgramm informationProgramm = new InformationProgramm(NameProg.Text, PatchProg.Text, CopyImg(), DescriotionsProg.Text);
					GlobalParam.GlobalInfoProg.Add(informationProgramm);
				}
				else
				{
					foreach (InformationProgramm inf in GlobalParam.GlobalInfoProg)
					{
						if (inf == information)
						{
							inf.DescriptionProgram = DescriotionsProg.Text;
							inf.IconsProg = CopyImg();
							inf.LocationExeFile = PatchProg.Text;
							inf.NameProgramm = NameProg.Text;
						}
					}
				}
				this.Close();
			}
			else
			{
				MessageBox.Show("Проверьте правильность заполнения всех полей!");
			}
		}
		/// <summary>
		/// Метод копирующий картинку в каталог программы
		/// </summary>
		/// <returns> Полный путь к картинке</returns>
		private string CopyImg()
		{
			String filePath = AppDomain.CurrentDomain.BaseDirectory + @"ProgImage\" + NameProg.Text + ".jpg";
			if (!Directory.Exists(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "ProgImage")))
			{
				Directory.CreateDirectory(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "ProgImage"));
			}
			var encoder = new PngBitmapEncoder();
			encoder.Frames.Add(BitmapFrame.Create((BitmapSource)ImgProg.Source));
			try
			{
				using (FileStream stream = new FileStream(filePath, FileMode.Create))
					encoder.Save(stream);
			}
			catch (Exception)
			{
				filePath = filePath + "1";
				using (FileStream stream = new FileStream(filePath, FileMode.Create))
					encoder.Save(stream);
			}
			return filePath;
		}
	}
}
