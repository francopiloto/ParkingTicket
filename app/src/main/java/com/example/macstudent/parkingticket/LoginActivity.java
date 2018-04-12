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

import com.example.macstudent.parkingticket.db.AppDataBase;
import com.example.macstudent.parkingticket.model.User;

/**
 * Created by C0724671/C0727631 on 2018-04-12.
 */
public class LoginActivity extends AppCompatActivity
{
    private EditText edtEmail;
    private EditText edtPassword;
    private Button btnLogin;
    //Button btnSignUp;
    private CheckBox chkRememberMe;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        edtEmail = (EditText) findViewById(R.id.edtuser);
        //edtUserId.setTooltipText("Please enter User ID");
        edtPassword = (EditText) findViewById(R.id.edtpass);
        chkRememberMe = (CheckBox) findViewById(R.id.chkremember);
        btnLogin = (Button) findViewById(R.id.btnlogin);
        //btnSignUp = (Button)findViewById(R.id.btnSignUp);


        btnLogin.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                checkSavedPreferences();

                if (userAuthentication())
                {
                    updateSavedPreferences();
                    startActivity(new Intent(LoginActivity.this, HomeActivity.class));
                }
            }
        });

        // FIXME: hard coded insertion of a User credentials in the database for testing
        User user = new User();
        user.setEmail("admin");
        user.setPassword("123");
        user.setFullName("Mr. Admin");

        AppDataBase database = AppDataBase.getAppDataBase(this);
        database.userDao().insert(user);
    }


    /**
     * Check if the 'Remember Me' option is selected and fetch the email and password from
     * the preferences object.
     */
    private void checkSavedPreferences()
    {
        // create shared preferences object.
        SharedPreferences preferences = getSharedPreferences("parking-ticket-prefs", MODE_PRIVATE);

        // get saved values from shared preferences.
        String email = preferences.getString("user-email", null);
        String password = preferences.getString("user-password", null);

        // set values to the edit text
        if (email != null && password != null)
        {
            edtEmail.setText(email);
            edtPassword.setText(password);

            chkRememberMe.setChecked(true);
        }
        else {
            chkRememberMe.setChecked(false);
        }
    }


    private void updateSavedPreferences()
    {
        // create shared preferences object.
        SharedPreferences preferences = getSharedPreferences("parking-ticket-prefs", MODE_PRIVATE);

        // get editor object.
        SharedPreferences.Editor editor = preferences.edit();

        if (chkRememberMe.isChecked())
        {
            // save value to shared preferences using editor object.
            editor.putString("user-email", edtEmail.getText().toString());
            editor.putString("user-password", edtPassword.getText().toString());
        }
        else
        {
            // remove values from shared preferences.
            editor.remove("user-email");
            editor.remove("user-password");
        }

        // save changes permanently into shared preferences.
        editor.apply();
    }


    /**
     * Perform the user authentication process.
     */
    private boolean userAuthentication()
    {
        // check for blank or invalid inputs
        if (TextUtils.isEmpty(edtEmail.getText()) || edtEmail.getText().toString().length() == 0)
        {
            edtEmail.setError("Please enter a valid email."); // TODO: call validate function for email
            return false;
        }

        if (TextUtils.isEmpty(edtPassword.getText()) || edtPassword.getText().toString().length() == 0)
        {
            edtPassword.setError("Please enter your password.");
            return false;
        }

        // check user credentials in the database
        AppDataBase database = AppDataBase.getAppDataBase(this);
        User user = database.userDao().findByEmail(edtEmail.getText().toString());

        if (user == null)
        {
            Toast.makeText(this, "User not found.", Toast.LENGTH_LONG).show();
            return false;
        }

        if (!user.getPassword().equals(edtPassword.getText().toString()))
        {
            Toast.makeText(this, "Invalid password.", Toast.LENGTH_LONG).show();
            return false;
        }

        return true;
    }
}
