// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   picture.java

package mambalab.server;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JLabel;

public class picture
{

    public picture()
    {
    }

    private static String hexEncode(byte aInput[])
    {
        StringBuilder result = new StringBuilder();
        char digits[] = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
            'a', 'b', 'c', 'd', 'e', 'f'
        };
        for(int idx = 0; idx < aInput.length; idx++)
        {
            byte b = aInput[idx];
            result.append(digits[(b & 0xf0) >> 4]);
            result.append(digits[b & 0xf]);
        }

        return result.toString();
    }

    public static String getCache(String url)
    {
        try
        {
            url = URLEncoder.encode(url, "UTF-8");
        }
        catch(UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        String dir = (new StringBuilder(String.valueOf(System.getProperty("java.io.tmpdir")))).append(cachedir).toString();
        (new File(dir)).mkdir();
        try
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte result[] = md.digest(url.getBytes());
            String md5 = hexEncode(result);
            dir = (new StringBuilder(String.valueOf(dir))).append("/").append(md5).append(".png").toString();
        }
        catch(NoSuchAlgorithmException e)
        {
            e.printStackTrace();
            return null;
        }
        return dir;
    }

    static void delete(File f)
    {
        if(f.isDirectory())
        {
            File afile[];
            int j = (afile = f.listFiles()).length;
            for(int i = 0; i < j; i++)
            {
                File c = afile[i];
                delete(c);
            }

        }
        f.delete();
    }

    public static void clearcache(HttpServletResponse response)
    {
        String dir = (new StringBuilder(String.valueOf(System.getProperty("java.io.tmpdir")))).append(cachedir).toString();
        System.err.println((new StringBuilder("deleting ")).append(dir).toString());
        try
        {
            delete(new File(dir));
            response.getWriter().println("Cache cleared");
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

    public static BufferedImage generateImage(String target)
    {
        int width = 760;
        int height = 427;
        BufferedImage buffer = new BufferedImage(width, height, 1);
        Graphics g = buffer.createGraphics();
        g.setColor(new Color(0, 0, 0));
        g.fillRect(0, 0, width, height);
        try
        {
            String html = (new StringBuilder("<html><style rel=\"stylesheet\" type=\"text/css\"> body { margin:16px;color:#FFFFFF;font-size: 20px;width:")).append(width).append("} h1 {font-size:48px} h2 {font-size:32px}  h3 {font-size:24px}</style><center>").append(URLDecoder.decode(target, "UTF-8")).append("</center></html>").toString();
            JLabel label = new JLabel(html);
            label.setSize(width, height);
            label.paint(g);
        }
        catch(UnsupportedEncodingException e1)
        {
            e1.printStackTrace();
        }
        return buffer;
    }

    public static void handle(String text, String nocache, HttpServletResponse response)
    {
        response.setContentType("image/png");
        String cache = getCache(text);
        if(!(new File(cache)).exists() || nocache != null)
        {
            System.err.println((new StringBuilder("generating image ")).append(cache).toString());
            BufferedImage buffer = generateImage(text);
            try
            {
                FileOutputStream f = new FileOutputStream(cache);
                ImageIO.write(buffer, "PNG", f);
                f.close();
            }
            catch(IOException e)
            {
                e.printStackTrace();
            }
        }
        try
        {
            FileInputStream in = new FileInputStream(cache);
            ServletOutputStream out = response.getOutputStream();
            byte buf[] = new byte[1024];
            for(int count = 0; (count = in.read(buf)) >= 0;)
                out.write(buf, 0, count);

            in.close();
            out.close();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

    public static String cachedir = "esper";

}
