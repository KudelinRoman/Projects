   M S B A M L   `   `   `  ����   GameLauncher    GameLauncher.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     �Name$  MyWindow�� � Title$ UnrealWindow��$	��598��$	��899�� � WindowStartupLocation$ CenterScreen=� � AllowsTransparency . 
������  � WindowStyle$
 None=� � ShowInTaskbar .  $	��899��$	��597�� � 	Resources  
  NoGlow �� 
TargetType  contextMenuTassk m� CommandParameter	 �� RelativeSource
 �� Path  contextMenuGroupProgramm��%Z  &	        &	 K     &	 �     �� " ��.R�� #��z��$��1q�.+��� $��Center=�$��Center=�$��1q��� .@�m� -   $��Закрыть�� �� 	 �� *Self+$
 Parent��� .@�m� -   $ ��Редактировать�� �� 	 �� *Self+$
 Parent�m� -   $��Удалить�� �� 	 �� *Self+$
 Parent�.��� .+��� $
��auto��$
��auto�����	#FF747474$��5q� �� CornerRadius$ 30,30,30,30�� J� RenderTransformOrigin$ 0.5,0&����� ��� �  � Color$ 	#FF313232�� � Offset$	 0.0Q�� $ 	#FF2C2C2C��$	 0.5Q�._��  � RowDefinitions �� $
��auto ��� �� $��35 �.+��� $��GAME-SPORTS CLUB�� �� Padding$ 5q�$��Center=�$��	10,0,10,0q�$
��Bold"����	#FF8F9093$��MV Boli)�$��14(� J� Effect 3  -System.Windows.Media.Effects.DropShadowEffect  �� -    ��Name$ min_max��$�� ��$��Right=�$��Stretch=�$��	10,5,20,5q�$��25��$��25��   ����  �� ImageSource$ Resources/Icons/max.png������  �� Color$ 	#00D40000�� �� Opacity$
 0.02Q�� $��1�����	#FF575656 � ColumnDefinitions �� $��70��$	��40* ��� $
��849* �.+�� -    �Name$ 
PanelGroup��$��0�����	#FF3C3B3B �� $
��236* ��� $	��23* �.+��� -   $ AddGroup��$��3,0,3,7q� � ToolTip$ Добавить��$��34��$��34��$��44��$��44��$��Center=�$��Bottom=�$��Center=�$��Center=����	#00000000$��1��$��34��$��34������  �� 
TargetType" ��.���  �� Property � �� �� Value
 ���� ��  � �� �� " ��.R��� #��z��._��� $��Center=�$��Center=� �� Triggers P�  P� Property �@J�IsMouseOver P� Value . . ���  � ��
 ���� ����    ���� $ Resources/Icons/Plus.png���� $��1��$
��Auto=�$��Disabled=�.���� -    ��Name$ 
CanvasProg��� -	   $ 
PanelTasks��$��2��$
��21,0q� �� .+�o� -
     o�Name$  MenuPusk��$
��Left=�$��33��$��1,1,0,0q�$	��Top=�$��33�����	#00F0F0F0���� .@�m� $��33��$��33�����	#FF0C0C0C$
 Menu��   ���� $ Resources/Icons/menu.png��.@�m� $��Справка�����	#FF787676
������ $��Times New Roman)�$
��Bold"�$��14(�m� $��Настройки�����	#FF787676$��Times New Roman)�$��14(�$
��Bold"�.@�m� $��Приложения�����	#FF787676m� $(��"Администрирование�����	#FF787676�� ���	#FF787676���	#FF787676m� -   $ ��Перезагрузить�����	#FF787676$
��Bold"�$��Times New Roman)�$��14(�m� -   $��Выключить�����	#FF787676$
��Bold"�$��Times New Roman)�$��14(�]� -   ! ]�Name$! ApplicationDock��$
��Left=�$	��558����.  $	��Top=�$	��899��