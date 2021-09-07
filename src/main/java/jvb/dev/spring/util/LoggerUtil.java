package jvb.dev.spring.util;

public class LoggerUtil {
	public static void logConsole(String messenger) {
		System.out.println(DateUtil.getDateString("yyyy/MM/dd HH:mm:ss") + " " + messenger);
	}
}
