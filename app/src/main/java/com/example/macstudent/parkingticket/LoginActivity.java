package com.example.macstudent.parkingticket;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import com.example.macstudent.parkingticket.db.AppDataBase;
import com.example.macstudent.parkingticket.model.Ticket;
import com.example.macstudent.parkingticket.model.User;
import com.example.macstudent.parkingticket.util.Utils;

/**
 * Created by C0724671/C0727631 on 2018-04-12.
 */
public class LoginActivity extends AppCompatActivity
{
    private EditText edtEmail;
    private EditText edtPassword;
    private Button btnLogin;
    private Button btnSignUp;
    private CheckBox chkRememberMe;

    private static User currentUser;

    public static User getAuthenticatedUser() {
        return currentUser;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        edtEmail = (EditText) findViewById(R.id.edtEmail);
        edtPassword = (EditText) findViewById(R.id.edtPassword);
        chkRememberMe = (CheckBox) findViewById(R.id.chkRememberMe);
        btnLogin = (Button) findViewById(R.id.btnLogin);
        btnSignUp = (Button)findViewById(R.id.btnSingUp);

        User user = getIntent().getParcelableExtra("user");

        if (user != null)
        {
            edtEmail.setText(user.getEmail());
            edtPassword.setText(user.getPassword());
        }
        else {
            checkSavedPreferences();
        }

        btnLogin.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                User user = userAuthentication();
                currentUser = user;

                if (user != null)
                {
                    updateSavedPreferences();
                    Intent intent = new Intent(LoginActivity.this, HomeActivity.class);
                    intent.putExtra("user", user);
                    startActivity(intent);
                }
            }
        });

        btnSignUp.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(LoginActivity.this, SignUPActivity.class));
            }
        });
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
    private User userAuthentication()
    {
        // check for blank or invalid inputs
        if (Utils.isEmpty(edtEmail) || !Utils.isValidEmail(edtEmail.getText().toString()))
        {
            edtEmail.setError("Please enter a valid email.");
            return null;
        }

        if (Utils.isEmpty(edtPassword))
        {
            edtPassword.setError("Please enter your password.");
            return null;
        }

        // check user credentials in the database
        AppDataBase database = AppDataBase.getAppDataBase(this);
        User user = database.userDao().findByEmail(edtEmail.getText().toString());

        if (user == null)
        {
            Toast.makeText(this, "User not found.", Toast.LENGTH_LONG).show();
            return null;
        }

        if (!user.getPassword().equals(edtPassword.getText().toString()))
        {
            Toast.makeText(this, "Invalid password.", Toast.LENGTH_LONG).show();
            return null;
        }

        return user;
    }
}
