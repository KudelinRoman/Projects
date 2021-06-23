package com.example.myapplication;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;



public class MainActivity extends AppCompatActivity {
    private Button mGo;
    DataAdapter adapter;
    LinearLayout list_item;
    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            read();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        setContentView(R.layout.activity_main);
        list_item = (LinearLayout) findViewById(R.id.zepha);
        recyclerView= (RecyclerView) findViewById(R.id.list);
        // создаем адаптер
        final GlobalClass globalClass= (GlobalClass) getApplicationContext();
        adapter = new DataAdapter(this, globalClass.getName());
        // устанавливаем для списка адаптер
        recyclerView.setAdapter(adapter);
        mGo=(Button)findViewById(R.id.button);
        //создаем новый поток для проверки на совпадения даты
        new Thread(new Runnable() {
            public void run() {
                while(true) {
                    try {
                        matchCheck();
                        Thread.sleep(60000); //60000 - 1 мин
                    } catch (InterruptedException ex) {
                    }
                }
            }
        }).start();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return true;
    }

    // метод открывает активность для добавления записи
    public void NewZaps(View view) {
        Intent intent=new Intent(MainActivity.this,AddsClass.class);
        intent.putExtra("name", "");
        intent.putExtra("note", "");
        intent.putExtra("dateandtime", "");
        intent.putExtra("priority", 0);
        intent.putExtra("position", -1);
        startActivity(intent);
    }
    // выход из приложения
    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN)
    public void Zakrit(MenuItem item) {
        try {
            write();
        }
        catch (IOException e){
        }
        finishAffinity();
    }

    //кнопка очистить. Удаляет все записи
    public void SpisokClear(MenuItem item) throws IOException {
        final GlobalClass globalClass= (GlobalClass) getApplicationContext();
        List<Phone> phones;
        phones= globalClass.getName();
        phones.clear();
        globalClass.setName(phones);
        write();
        this.recreate();
    }
    //кнопка выделить по приоритету
    public void FillPriority(MenuItem item) {
        if (adapter.kras) adapter.kras = false;
        else adapter.kras= true;
       this.recreate();
    }
    //Кнопка "сортровать по дате"
    public void sortData(MenuItem item) throws IOException {
        final GlobalClass globalClass= (GlobalClass)getApplicationContext();
        List<Phone> phones = globalClass.getName();
        //создаем массив наших элементов и переписываем их из листа в этот массив
        Phone[] ph = new Phone[phones.size()];
        int i=0;
        for (Phone phone :  globalClass.getName()) {
            ph[i]=phone;
            i++;
        }
        //сортировка
        Arrays.sort(ph, Phone.DataComparator);
        //очищаем лист от элементов и записываем в этот лист элементы из отсортированного массива наших элементов
        phones.clear();
        for (Phone phone: ph){
            phones.add(phone);
        }
        globalClass.setName(phones);
        write();
        this.recreate();
    }
    //метод проверяющий совпадение текущей даты с датой заметки
    public void matchCheck (){
        Calendar cal = Calendar.getInstance();
        //записываем текущую дату в число ПРИМЕР 2020415858
        int dataTek = Integer.parseInt(""+ cal.get(Calendar.YEAR)+cal.get(Calendar.MONTH)+cal.get(Calendar.DAY_OF_MONTH)+cal.get(Calendar.HOUR)+cal.get(Calendar.MINUTE));
        final GlobalClass globalClass= (GlobalClass)getApplicationContext();
        List<Phone> phones = globalClass.getName();
        //в цикле дату каждой записи сравниваем с текущей датой, если есть совпадение вызываем метод создания уведомленияи передаем туда название задачи и описание
        for (Phone p:
            phones ) {
            int dataZapis = Integer.parseInt(""+ p.getCompany().get(Calendar.YEAR)+p.getCompany().get(Calendar.MONTH)+p.getCompany().get(Calendar.DAY_OF_MONTH)
                    +p.getCompany().get(Calendar.HOUR)+p.getCompany().get(Calendar.MINUTE));
            if (dataTek==dataZapis) notifik(p.getName(),p.getNote());
        }
    }
    // метод создает и отправляет уведомление
    public void notifik (String name, String note){
        NotificationCompat.Builder builder =
                new NotificationCompat.Builder(this)
                        .setSmallIcon(R.mipmap.ic_launcher)
                        .setContentTitle(name)
                        .setContentText(note);

        Notification notification = builder.build();

        NotificationManager notificationManager =
                (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        notificationManager.notify(1, notification);
    }
    //метод создающий экземпляр класса GlobalClass, записывает его в файл.
    public void write() throws IOException {
        FileOutputStream fos = openFileOutput("sohr.txt", Context.MODE_PRIVATE);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        //для записи создаем экземпляр класса GlobalClass
        //задаем ему значение и записываем в файл
        GlobalClass gl = new GlobalClass();
        final GlobalClass globalClass=(GlobalClass) getApplicationContext();
        gl.setName(globalClass.getName());
        oos.writeObject(gl);
        oos.flush();
        oos.close();
    }
    //метод считывающий экземпляр класса GlobalClass из файла
    public  void read() throws IOException, ClassNotFoundException {
        FileInputStream fis = openFileInput("sohr.txt");
        ObjectInputStream oin = new ObjectInputStream(fis);
        //создаем экземпляр класса задаем ему значение считанное из файла
        final GlobalClass globalClass=(GlobalClass) getApplicationContext();
        GlobalClass gl =  (GlobalClass) oin.readObject();
        globalClass.setName(gl.getName());
        oin.close();
        fis.close();
    }

}
