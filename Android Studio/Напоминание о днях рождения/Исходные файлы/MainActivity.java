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
        intent.putExtra("dateandtime", "");
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
        //запускаем службу для уведомлений
        Intent intentMyIntentService = new Intent(this, MyIntentService.class);
        startService(intentMyIntentService);
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
