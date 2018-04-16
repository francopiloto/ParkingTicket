package com.example.macstudent.parkingticket.util;

import android.text.Editable;
import android.text.TextUtils;
import android.widget.EditText;

/**
 * Created by macstudent on 2018-04-16.
 */

public class Utils
{
    public static boolean isEmpty(EditText editText)
    {
        Editable editable = editText.getText();
        return editable == null || TextUtils.isEmpty(editable) || editable.toString().trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {
        return email.matches(".+[@].+[.].+");
    }
}
