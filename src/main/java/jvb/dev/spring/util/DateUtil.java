package jvb.dev.spring.util;

import java.text.SimpleDateFormat;

public class DateUtil {
	public static String getDateString(String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.format(new java.util.Date());
	}
}
