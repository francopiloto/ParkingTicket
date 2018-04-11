package com.example.macstudent.parkingticket;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;



public abstract class LoginActivity extends AppCompatActivity {

    EditText edtuser;
    EditText edtpass;
    Button btnlogin;
    //Button btnSignUp;
    CheckBox chkremember;
    SharedPreferences myPref;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //1 - Create Shared Preferences Object
        myPref = getSharedPreferences("mypref", MODE_PRIVATE);

        edtuser = (EditText) findViewById(R.id.edtuser);
        //edtUserId.setTooltipText("Please enter User ID");
        edtpass = (EditText) findViewById(R.id.edtpass);
        chkremember = (CheckBox) findViewById(R.id.chkremember);


        //2 - Get saved values from shared preferences
        String userid = myPref.getString("userid", null);
        String pwd = myPref.getString("password", null);

        //3 - Set values to Edit text
        if (userid != null && pwd != null) {
            edtuser.setText(userid);
            edtpass.setText(pwd);
            chkremember.setChecked(true);
        } else {
            chkremember.setChecked(false);
        }

        btnlogin = (Button) findViewById(R.id.btnlogin);
        //btnSignUp = (Button)findViewById(R.id.btnSignUp);


        btnlogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (TextUtils.isEmpty(edtuser.getText()) || edtuser.getText().toString().length() == 0) {
                    edtuser.setError("Please Enter User Name");
                } else {

                    //DBUser dbUser = new DBUser(LoginActivity.this);
                    //if (dbUser.isValidUser(edtUserId.getText().toString(), edtPassword.getText().toString()))
                    if (edtuser.getText().toString().equals("admin") && edtpass.getText().toString().equals("admin")) {
                        Toast.makeText(LoginActivity.this, "User Successfully logged in ", Toast.LENGTH_LONG).show();

                        //4 - Get editor object
                        SharedPreferences.Editor editor = myPref.edit();
                        if (chkremember.isChecked()) {
                            //5 - Save value to Shared Preferences using editor object
                            editor.putString("userid", edtuser.getText().toString());
                            editor.putString("password", edtpass.getText().toString());
                        } else {
                            //6 - Remove values from shared preferences
                            editor.remove("userid");
                            editor.remove("password");
                        }
                        //7 - Save changes permanently to shared preferences
                        editor.apply();

                        Intent intent = new Intent(LoginActivity.this, HomeActivity.class);
                        startActivity(intent);
                    } else {
                        //Intent intent = new Intent(LoginActivity.this, StudentEntryActivity.class);
                        //startActivity(intent);
                        Toast.makeText(LoginActivity.this, "UserID/passwords invalid", Toast.LENGTH_LONG).show();

                    }
                }
            }
        });
    }
}
