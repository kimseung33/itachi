import java.sql.Date;
import java.text.SimpleDateFormat;

public class test01 {
	public static void main(String[] args) {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
		String format_time1 = format1.format (System.currentTimeMillis());
		String format_time2 = format2.format (System.currentTimeMillis());
		        				 		
		 System.out.println(format_time1);
		 System.out.println(format_time2);
		
	}
}
