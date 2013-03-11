package org.ycga.phprpc;


import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnManager
{

    private static String gENV = "java:comp/env/";

    public ConnManager()
    {
    }

    public static Connection getConnection(String dsName)
        throws Exception
    {
    	try {
        Connection conn;
        Context ctx = new InitialContext();
        DataSource ds = (DataSource)ctx.lookup(gENV + dsName);
        conn = ds.getConnection();
        
        ctx.close();
         return conn;
    	}
	   catch (Exception e)
	    {
		   return null;
	    }
    }

}