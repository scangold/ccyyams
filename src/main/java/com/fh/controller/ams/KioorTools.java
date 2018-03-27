package com.fh.controller.ams;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.fh.util.DateUtil;

public class KioorTools {

	public static Timestamp TimeStringToDatatime(String timestring) throws ParseException{
		 java.util.Date dateTime;
		 
		 timestring = DateUtil.getSdfTimes();  
		 DateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");
		 dateTime = fmt.parse(timestring);
		 java.sql.Timestamp sqlDateTime = new java.sql.Timestamp(dateTime.getTime());
		return sqlDateTime;
	}
}
