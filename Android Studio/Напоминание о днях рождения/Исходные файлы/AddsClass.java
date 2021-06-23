package com.example.myapplication;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class AddsClass extends Activity {
    private Button mGo;
    Calendar dateAndTime=Calendar.getInstance();
    TextView currentTime;
    TextView currentDate;
    TextView currentName;
    TextView currentNote;
    Spinner currentPrioritet;
    //позиция необходима для того чтобы понять нужно ли создавать новую запись или необходимо изменить существующую
    private int position;
    List<Phone> phones = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.adds);
        currentName=(TextView)findViewById(R.id.editText);
        currentDate=(TextView)findViewById(R.id.editText3);
        setInitialDate();
        mGo = (Button) findViewById(R.id.button);
        final GlobalClass globalClass = (GlobalClass)getApplicationContext();
        phones=globalClass.getName();
        //записывает значения в поля
        currentName.setText(getIntent().getStringExtra("name"));
        position = getIntent().getIntExtra("position", -1);
        String data =getIntent().getStringExtra("dateandtime");
        //Разбиваем строку data на две строки Дата и Время
        String[] data2 = new String[2];
        try {
             data2=data.split(" - ");

          //задем дату и время
            currentDate.setText(data2[1]);
            currentTime.setText(data2[0]);
        }
        //если в ходе разбиения строки произошла ошибка, то задаем текущие дату и время
        catch (Exception e) {
            setInitialDate();
        }
    }
    // метод сохраняет запись
    public void BackSaved(View view) throws ParseException {
        //добавляет новую запись
        if (position==-1) {
            phones.add(new Phone(currentName.getText().toString(), dateAndTime,  R.id.button3, R.id.button4));
            final GlobalClass globalClass = (GlobalClass) getApplicationContext();
            globalClass.setName(phones);
        }
        //перезаписывает существующую
        else{
            Phone phone = new Phone(currentName.getText().toString(), dateAndTime,  R.id.button3, R.id.button4);
            phones.set(position, phone);
        }
        //перед тем как перейти к главной активности
        //необходимо записать изменения в файл,
        //это необходимо для того чтобы изменения отобразились в главной активноси
        try{
            write();
        }
        catch (IOException e){

        }

        Intent intent = new Intent(AddsClass.this, MainActivity.class);
        //Запускаем переход:
        startActivity(intent);
    }
    //выбирается дата
    public void onDate(View view) {
        new DatePickerDialog(AddsClass.this, d,
                dateAndTime.get(Calendar.YEAR),
                dateAndTime.get(Calendar.MONTH),
                dateAndTime.get(Calendar.DAY_OF_MONTH))
                .show();
    }
    // установка начальной даты
    private void setInitialDate() {

        currentDate.setText(DateUtils.formatDateTime(this,
                dateAndTime.getTimeInMillis(),
                DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_YEAR));

    }

    public void write() throws IOException {
        FileOutputStream fos = openFileOutput("sohr.txt", Context.MODE_PRIVATE);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        GlobalClass gl = new GlobalClass();
        final GlobalClass globalClass=(GlobalClass) getApplicationContext();
        gl.setName(globalClass.getName());
        oos.writeObject(gl);
        oos.flush();
        oos.close();
    }


    // установка обработчика выбора даты
    DatePickerDialog.OnDateSetListener d=new DatePickerDialog.OnDateSetListener() {
        public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
            dateAndTime.set(Calendar.YEAR, year);
            dateAndTime.set(Calendar.MONTH, monthOfYear);
            dateAndTime.set(Calendar.DAY_OF_MONTH, dayOfMonth);
            setInitialDate();
        }
    };
}
