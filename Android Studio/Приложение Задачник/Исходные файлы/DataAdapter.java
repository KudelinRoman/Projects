package com.example.myapplication;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Calendar;
import java.util.List;

//класс адаптера ждя RecyclerView
class DataAdapter extends RecyclerView.Adapter<DataAdapter.ViewHolder> {

    public static OnItemClickListener listener;
    private LayoutInflater inflater;
    //массив наших элементов
    private List<Phone> phones;
    //переменная необходимости выделения цветом
    public static   boolean kras= false;
    Context context;
    //конструктор класса
    DataAdapter(Context context, List<Phone> phones) {
        this.phones = phones;
        this.inflater = LayoutInflater.from(context);
        this.context=context;
    }
    @Override
    public DataAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = inflater.inflate(R.layout.list_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(final DataAdapter.ViewHolder holder, final int position) {
        final Phone phone = phones.get(position);
        holder.nameView.setText(phone.getName());
        holder.companyView.setText("Время:"+phone.getCompany().get(Calendar.HOUR)+":"+phone.getCompany().get(Calendar.MINUTE)+" Дата:"+ phone.getCompany().get(Calendar.DAY_OF_MONTH)+":"+
                phone.getCompany().get(Calendar.MONTH)+":"+phone.getCompany().get(Calendar.YEAR));
        // при необходимости выделяет цветом элемент. Значения цвета храниться в классе Phone в переменной prioritet
        if (kras) {holder.itemView.setBackgroundColor(phone.getProiritet());}

        // метод при нажатии на кнопку "удалить"
        holder.DeletedView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                phones.remove(position);
                notifyItemRemoved(position);
                notifyItemRangeChanged(position, phones.size());
            }
        });
        //метод при нажатии на кнопку "изменить".
        holder.ChangeView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, AddsClass.class);
                intent.putExtra("name", phone.getName());
                String data = ""+""+phone.getCompany().get(Calendar.HOUR)+":"+phone.getCompany().get(Calendar.MINUTE)+" - "+ phone.getCompany().get(Calendar.DAY_OF_MONTH)+":"+
                        phone.getCompany().get(Calendar.MONTH)+":"+phone.getCompany().get(Calendar.YEAR);
                intent.putExtra("note", phone.getNote());
                intent.putExtra("dateandtime", data);
                intent.putExtra("priority", phone.getProiritet());
                intent.putExtra("position",position);
                v.getContext().startActivity(intent);
                notifyItemChanged(position);
            }
        });

    }

    @Override
    public int getItemCount() {
        return phones.size();
    }

    //Изменим интерфейс OnItemClickListener, добавив параметр нажатого элемента
    public interface OnItemClickListener{
        void onItemClick(View itemView, int position, View view);
    }
    public void SetOnItemClickListener(final OnItemClickListener mItemClickListener) {
        this.listener = mItemClickListener;
    }

        public class ViewHolder extends RecyclerView.ViewHolder {
        final TextView nameView, companyView;
        final Button ChangeView, DeletedView;

            ViewHolder(View view){
            super(view);
            nameView = (TextView) view.findViewById(R.id.name);
            companyView = (TextView) view.findViewById(R.id.company);
            ChangeView=(Button) view.findViewById(R.id.button3);
            DeletedView=(Button) view.findViewById(R.id.button4);
            }

    }
}
