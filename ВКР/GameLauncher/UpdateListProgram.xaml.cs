﻿using System;
using System.Drawing;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace GameLauncher
{
	/// <summary>
	/// Логика взаимодействия для UpdateListProgram.xaml
	/// </summary>
	public partial class UpdateListProgram : Window
	{
		/// <summary>
		/// Сетка используемая для отображения добавленных программ
		/// </summary>
		Grid grid = new Grid();
		/// <summary>
		/// Конструктор класса, добавляющий сетку на форму
		/// </summary>
		public UpdateListProgram()
		{
			InitializeComponent();	
			grid.Width = BoxProg.Width;
			grid.Height = BoxProg.Height;
			grid.Margin = new Thickness(0);
			BoxProg.Content = grid;
			ColumnDefinition oneColumn = new ColumnDefinition();
			oneColumn.Width = new GridLength(30);
			//oneColumn.MinWidth = 16;
			grid.ColumnDefinitions.Add(oneColumn);
			ColumnDefinition twoColumn = new ColumnDefinition();
			twoColumn.Width = new GridLength(150);
			//twoColumn.MinWidth = 150;
			grid.ColumnDefinitions.Add(twoColumn);
			ColumnDefinition thriColumn = new ColumnDefinition();
			thriColumn.Width = new GridLength(50);
			//thriColumn.MinWidth = 50;
			grid.ColumnDefinitions.Add(thriColumn);
			ColumnDefinition fourColumn = new ColumnDefinition();
			fourColumn.Width = new GridLength(50);
			//fourColumn.MinWidth = 50;
			grid.ColumnDefinitions.Add(fourColumn);
			ColumnDefinition fColumn = new ColumnDefinition();
			fColumn.Width = GridLength.Auto;
			grid.ColumnDefinitions.Add(fColumn);
			Updat();
		}
		/// <summary>
		/// Метод срабатывающий при клике на кнопку "Выбрать приложение". Открывает окно для создания нового объекта.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Button_Click(object sender, RoutedEventArgs e)
		{
			InformProgram informProgram = new InformProgram();
			informProgram.ShowDialog();
			Updat();
		}
		/// <summary>
		/// Метод, выводящий все объекты в бокс для отображения.
		/// </summary>
		public void Updat()
		{
			try
			{
				//Удаляем все объекты находящиеся на сетке
				grid.Children.Clear();
				//Удаляем все созданные ранее строки
				grid.RowDefinitions.Clear();
				int i = 0;
				RowDefinition f = new RowDefinition();
				f.MinHeight = 35;
				f.MaxHeight = 35;
				grid.RowDefinitions.Add(f);
				//Цикл в котором выводятся все объекты в бокс для отображения
				if (GlobalParam.GlobalInfoProg != null)
				{
					foreach (InformationProgramm infr in GlobalParam.GlobalInfoProg)
					{

						//Добавляем строку в которую будем добавлять элементы
						RowDefinition row = new RowDefinition();
						row.MinHeight = 35;
						row.MaxHeight = 35;
						grid.RowDefinitions.Add(row);
						//Создание картинки для отображения иконки
						System.Windows.Controls.Image img = new System.Windows.Controls.Image();
						img.Source = new BitmapImage(new Uri(infr.IconsProg, UriKind.Relative));
						img.IsEnabled = true;
						img.Visibility = Visibility.Visible;
						img.Width = 30;
						img.Height = 30;
						img.Stretch = Stretch.Fill;
						Grid.SetRow(img, i);
						Grid.SetColumn(img, 0);
						//Создание лейбла для названия программы
						Label nameProg = new Label();
						nameProg.Content = infr.NameProgramm;
						nameProg.HorizontalAlignment = HorizontalAlignment.Left;
						grid.Children.Add(nameProg);
						Grid.SetRow(nameProg, i);
						Grid.SetColumn(nameProg, 1);
						//Создание кнопки для удаления объекта из списка
						Button buttonDelete = new Button();
						buttonDelete.Content = "Delet";
						buttonDelete.Margin = new Thickness(4);
						buttonDelete.Click += ButtonDelete_Click;
						//записываем в тег индекс объекта в листе, для дальнейшей работы с ним
						buttonDelete.Tag = i;
						grid.Children.Add(buttonDelete);
						Grid.SetRow(buttonDelete, i);
						Grid.SetColumn(buttonDelete, 2);
						//Создание кнопки для редактирования объекта 
						Button buttonUpdate = new Button();
						buttonUpdate.Content = "Updat";
						buttonUpdate.Margin = new Thickness(4);
						buttonUpdate.Click += ButtonUpdate_Click;
						//записываем в тег индекс объекта в листе, для дальнейшей работы с ним
						buttonUpdate.Tag = i;
						grid.Children.Add(buttonUpdate);
						Grid.SetRow(buttonUpdate, i);
						Grid.SetColumn(buttonUpdate, 3);
						i++;
					}
				}
			}
			catch (Exception)
			{

			}
		}
		/// <summary>
		/// Метод, удаляющий программу из списка
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void ButtonDelete_Click(object sender, RoutedEventArgs e)
		{
			Button button = (Button)sender;
			GlobalParam.GlobalInfoProg.RemoveAt((int)button.Tag);
			Updat();
		}
		/// <summary>
		/// Метод, открывающий форму для редактирования
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void ButtonUpdate_Click(object sender, RoutedEventArgs e)
		{
			Button button = (Button)sender;
			InformProgram inf = new InformProgram(GlobalParam.GlobalInfoProg[(int)button.Tag]);
			inf.ShowDialog();
		}
		/// <summary>
		/// Метод срабатывающий при клике на кнопку "Выбрать папку с приложениями". Создает объекты согласно ярлыыкам в выбранной папке.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Button_Click_1(object sender, RoutedEventArgs e)
		{
			using (var fldrDlg = new System.Windows.Forms.FolderBrowserDialog())
			{
				if (fldrDlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
				{
					string[] dirs = Directory.GetFiles(fldrDlg.SelectedPath, "*.lnk");
					foreach(string s in dirs)
					{
						SeriesWrite(s);
					}
				}
			}
			Updat();
		}
		/// <summary>
		/// Метод создания объекта InformationProgramm исходя из его пути
		/// </summary>
		/// <param name="path">Путь к ярлыку</param>
		private void SeriesWrite (string path)
		{
			BitmapSource imaging;
			string[] split = Regex.Split(path, @"\\");
			string nameProg = split[split.Length-1];
			nameProg=nameProg.Replace(".lnk", "");
			//создание ярлыка
			using (Icon ico = System.Drawing.Icon.ExtractAssociatedIcon(path))
			{
				imaging = Imaging.CreateBitmapSourceFromHIcon(ico.Handle, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
			}
			//копирование ярлыка в папку
			String filePath = AppDomain.CurrentDomain.BaseDirectory + @"ProgImage\" + nameProg + ".jpg";
			var encoder = new PngBitmapEncoder();
			encoder.Frames.Add(BitmapFrame.Create((BitmapSource)imaging));
			using (FileStream stream = new FileStream(filePath, FileMode.Create))
				encoder.Save(stream);
			//создание объекта
			InformationProgramm informationProgramm = new InformationProgramm(nameProg, path, filePath, "");
			GlobalParam.GlobalInfoProg.Add(informationProgramm);
		}
		
	}
}
