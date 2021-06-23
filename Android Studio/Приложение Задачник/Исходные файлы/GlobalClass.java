package com.example.myapplication;

import android.app.Application;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class GlobalClass extends Application implements Serializable {
    //лист со всеми существующими элементами
    private List<Phone> phones= new ArrayList<>();

    //метод возвращающий список всех элементов
    public List<Phone> getName() {
        return phones;
    }
    //метод изменяющий значение списка элементов
    public void setName(List<Phone> a_phones) {
        phones = a_phones;
    }
}