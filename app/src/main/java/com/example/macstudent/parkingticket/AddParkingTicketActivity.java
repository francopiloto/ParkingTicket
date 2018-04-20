package com.example.macstudent.parkingticket;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.RadioButton;
import android.widget.TextView;

import com.example.macstudent.parkingticket.model.User;
import com.example.macstudent.parkingticket.util.Utils;

import java.util.Date;

public class AddParkingTicketActivity extends AppCompatActivity
{
    private TextView txtCurrentDate;
    private TextView txtTotalCost;
    private TextView txtVehicleNumber;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_parking_ticket);

        txtCurrentDate = findViewById(R.id.txtCurrentDate);
        txtCurrentDate.setText(Utils.formatDate(new Date()));

        User user = LoginActivity.getAuthenticatedUser();
        txtVehicleNumber = findViewById(R.id.txtVehicleNumber);
        txtVehicleNumber.setText(user != null ? user.getVehicleNumber() : "");

        txtTotalCost = findViewById(R.id.txtTotalCost);
        txtTotalCost.setText(String.format("$ %.02f", 5.0));
    }

    public void onRadioButtonClicked(View view)
    {
        if (!((RadioButton)view).isChecked()) {
            return;
        }

        double price = 0;

        switch(view.getId())
        {
            case R.id.rbHalfHour: price = 5.00; break;
            case R.id.rbOneHour:  price = 7.25; break;
            case R.id.rbTwoHours:  price = 8.50; break;
            case R.id.rbThreeHours:  price = 10.00; break;
            case R.id.rbDayEnds:  price = 15.00; break;
        }

        txtTotalCost.setText(String.format("$ %.02f", price));
    }
}
