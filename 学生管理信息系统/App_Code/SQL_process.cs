using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// SQL_process 的摘要说明
/// </summary>
public class SQL_process
{
    public SQL_process()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static int char_int(char src)
    {
        if (src <= 'z' && src >= 'a')
        {
            return src - 'a';
        }
        else
        {
            if (src <= 'Z' && src >= 'A')
            {
                return src - 'A' + 'z';
            }
            else
            {
                return src - '0' + 'z' + 26;
            }
        }
    }
    public static char int_char(int src)
    {
        if (src < 26)
        {
            return (char)(src + 'a');
        }
        else
        {
            if (src < 52 && src >= 26)
            {
                return (char)(src + 'A' - 26);
            }
            else
            {
                return (char)(src + '0' - 52);
            }
        }
    }
    public static String encrypt(String src,int key_e)
    {
        String res = "";
        int src_int = int.Parse(src);
        for(int i = 0; i < src.Length; i++)
        {
            res += (Math.Pow(char_int(src[i]), key_e) % 62).ToString();
        }
        return res;
    }
    public static String decipher(String src, int key_d)
    {
        String res = "";
        int src_int = int.Parse(src);
        for (int i = 0; i < src.Length; i++)
        {
            res += int_char((int)(Math.Pow(int.Parse(src[i] + ""), key_d) % 62));
        }
        return res;
    }

}