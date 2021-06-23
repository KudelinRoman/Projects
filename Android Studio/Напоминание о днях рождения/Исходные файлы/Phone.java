package com.example.myapplication;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Comparator;

public class Phone implements Serializable {
    //имя
    private String name;
    //дата
    private Calendar company;
    //кнопки изменить и удалить
    private int Change;
    private int Deleted;

    public Phone(String name, Calendar company, int Chenge, int Deleted){

        this.name=name;
        this.company = company;
        this.Deleted=Deleted;
        this.Change=Chenge;
    }
    // компаратор сортирует список или массив объектов по возрастанию даты
    public static Comparator<Phone> DataComparator = new Comparator<Phone>() {
        @Override
        public int compare(Phone e1, Phone e2) {
            //переписываем дату в строку типа "ГОД_МЕСЯЦ_ЧИСЛО_ЧАСЫ_МИНУТЫ"
            //например если дата 15 апреля 2020 год 7 часов 30 минут
            //получается строка = "20200415730" далее две строки переводятся в int и сравниваются
            String str1 =""+ e1.getCompany().get(Calendar.YEAR)+e1.getCompany().get(Calendar.MONTH)+e1.getCompany().get(Calendar.DAY_OF_MONTH)+e1.getCompany().get(Calendar.HOUR)+e1.getCompany().get(Calendar.MINUTE);
            String str2 =""+ e2.getCompany().get(Calendar.YEAR)+e2.getCompany().get(Calendar.MONTH)+e2.getCompany().get(Calendar.DAY_OF_MONTH)+e2.getCompany().get(Calendar.HOUR)+e2.getCompany().get(Calendar.MINUTE);
            return Integer.parseInt(str1)-Integer.parseInt(str2);
        }
    };

    //методы чтобы задать/вернуть значение какого-лтбо поля
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Calendar getCompany() {
        return this.company;
    }

    public void setCompany(Calendar company) {
        this.company = company;
    }


    public int getChanget() {
        return this.Change;
    }
    public void setChange(int Change) {
        this.Change = Change;
    }

    public int getDeleted() {
        return this.Deleted;
    }
    public void setDeleted(int Deleted) {
        this.Deleted = Deleted;
    }

}
