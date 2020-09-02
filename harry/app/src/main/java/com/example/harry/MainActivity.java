package com.example.harry;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;


public class MainActivity extends AppCompatActivity {
    public static final String MY_TAG = "the_custom_message";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void onButtonClick(View v){
       EditText e1= (EditText)findViewById(R.id.editText) ;

       EditText  e2=(EditText)findViewById(R.id.editText2);
       TextView t1 =(TextView)findViewById(R.id.textView);
       int num1=Integer.parseInt(e1.getText().toString());
        int num2=Integer.parseInt(e2.getText().toString());
        int sum=num1 +num2;

        t1.setText(Integer.toString(sum));

    }





}







