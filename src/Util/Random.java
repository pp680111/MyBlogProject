package Util;

/**
 * Created by qq578 on 2017/5/27.
 */
public class Random {
    public static String getRandomString(){
        String str = "abcdefghijklmnopqrstuvwxyz1234567890QWERTYUIOPLKJHGFDSAZXCVBNM";
        StringBuffer stringBuffer = new StringBuffer();
        java.util.Random random = new java.util.Random();
        for(int i=0 ; i < 15 ; i++)
        {
            stringBuffer.append(str.charAt(random.nextInt(str.length() - 1)));
        }

        return stringBuffer.toString();
    }
}
