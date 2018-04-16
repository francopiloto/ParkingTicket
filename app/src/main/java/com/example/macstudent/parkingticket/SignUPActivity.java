package com.example.macstudent.parkingticket;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.macstudent.parkingticket.db.AppDataBase;
import com.example.macstudent.parkingticket.model.User;

public class SignUPActivity extends AppCompatActivity
{
    private Button btnLoginPage;
    private Button btnCreateAccount;

    private EditText edtFullName;
    private EditText edtEmail;
    private EditText edtPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        btnLoginPage = findViewById(R.id.btnLoginPage);
        btnLoginPage.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(SignUPActivity.this, LoginActivity.class));
            }
        });

        btnCreateAccount = findViewById(R.id.btnCreateAccount);
        btnCreateAccount.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view) {
                createAccount();
            }
        });
    }

    /**
     * Create a new User information in the database
     */
    private void createAccount()
    {
        // check for blank or invalid inputs
        if (TextUtils.isEmpty(edtFullName.getText()) || edtFullName.getText().toString().length() == 0)
        {
            edtFullName.setError("Please enter your full name.");
            return;
        }

        if (TextUtils.isEmpty(edtEmail.getText()) || edtEmail.getText().toString().length() == 0)
        {
            edtEmail.setError("Please enter a valid email."); // TODO: call validate function for email
            return;
        }

        if (TextUtils.isEmpty(edtPassword.getText()) || edtPassword.getText().toString().length() == 0)
        {
            edtPassword.setError("Please enter a valid password.");
            return;
        }

        // check for existing user
        AppDataBase database = AppDataBase.getAppDataBase(this);
        User user = database.userDao().findByEmail(edtEmail.getText().toString());

        if (user != null)
        {
            edtEmail.setError("Email already registered.");
            return;
        }

        user = new User();
        user.setId(database.userDao().findMaxId() + 1);
        user.setFullName(edtFullName.getText().toString());
        user.setEmail(edtEmail.getText().toString());
        user.setPassword(edtPassword.getText().toString());

        database.userDao().insert(user);
    }
}
