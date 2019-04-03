package kr.co.function;

import java.util.Random;

public class CheckNumberGenerator {
	public static void main(String[] args) {
		Random rnd=new Random();
		StringBuffer buf=new StringBuffer();
		for(int i=0; i<8; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char)(int)((rnd.nextInt(26))+97));
			}else {
				buf.append((rnd.nextInt(10)));
			}
		}
		System.out.println(buf);
	}
	public static String checknumber() {
		Random rnd=new Random();
		StringBuffer buf=new StringBuffer();
		for(int i=0; i<6; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char)(int)((rnd.nextInt(26))+97));
			}else {
				buf.append((rnd.nextInt(10)));
			}
		}
		
		return buf.toString();
		
	}
	/*public static String checknumber() {
		Random rand=new Random();
		String numStr="";
		int dupCd=2;
		for(int i=0; i<6; i++) {
			String ran=Integer.toString(rand.nextInt(10));
			
			if(dupCd==1) {
				numStr+=ran;
			}else if (dupCd==2) {
				if (!numStr.contains(ran)) {
					numStr+=ran;
				}else {
					i-=1;
				}
			}
		}
		return numStr;
	}
	*/
}
	

