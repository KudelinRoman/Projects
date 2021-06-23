package com.example.myapplication;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.Context;

import androidx.core.app.NotificationCompat;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.Calendar;
import java.util.List;

public class MyIntentService extends IntentService {
    List<Phone> phones;
    public MyIntentService() {
        super("MyIntentService");
    }

    @Override
    protected void onHandleIntent(Intent intent) {
        new Thread(new Runnable() {
            public void run() {
                while(true) {
                    try {
                        read();
                        Calendar cal = Calendar.getInstance();
                        //записываем текущую дату в число ПРИМЕР 2020415858
                        int dataTek = Integer.parseInt(""+cal.get(Calendar.MONTH)+cal.get(Calendar.DAY_OF_MONTH));
                        //в цикле дату каждой записи сравниваем с текущей датой, если есть совпадение вызываем метод создания уведомленияи передаем туда название задачи и описание
                        for (Phone p:
                                phones ) {
                            int dataZapis = Integer.parseInt(""+p.getCompany().get(Calendar.MONTH)+p.getCompany().get(Calendar.DAY_OF_MONTH)
                                   );
                            if (dataTek==dataZapis) notifik("Сегодня день рождения у "+p.getName(),"Не забудьте поздравить");
                        }
                        Thread.sleep(60000*60*12); //60000*60*12 - 12 часов
                    } catch (InterruptedException ex) {
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();
    }
    // метод создает и отправляет уведомление
    public void notifik (String name, String note){
        NotificationCompat.Builder builder =
                new NotificationCompat.Builder(this)
                        .setSmallIcon(R.mipmap.ic_launcher)
                        .setContentTitle(name)
                        .setContentText(note);

        Notification notification = builder.build();
        //включаем уведомлению вибрацию и звук поумолчанию
        notification.defaults = Notification.DEFAULT_SOUND |
                Notification.DEFAULT_VIBRATE;
        NotificationManager notificationManager =
                (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        notificationManager.notify(1, notification);
    }
    //метод считывающий записи из файла
    public  void read() throws IOException, ClassNotFoundException {
        FileInputStream fis = openFileInput("sohr.txt");
        ObjectInputStream oin = new ObjectInputStream(fis);
        //создаем экземпляр класса задаем ему значение считанное из файла
        final GlobalClass globalClass=(GlobalClass) getApplicationContext();
        GlobalClass gl =  (GlobalClass) oin.readObject();
        globalClass.setName(gl.getName());
        phones=globalClass.getName();
        oin.close();
        fis.close();
    }
}
