package com.company.util;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Converter {
    public static Date convertToDate(String dateStr,String format){

        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            long l = sdf.parse(dateStr).getTime();
            Date bd = new Date(l);
            return bd;

        } catch (Exception ex) {
            System.out.print("Houston, we have a problem");
        }

        return null;
    }
}
