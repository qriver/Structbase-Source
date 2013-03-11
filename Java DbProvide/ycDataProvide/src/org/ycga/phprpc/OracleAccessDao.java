package org.ycga.phprpc;

import java.io.DataOutputStream;
import java.io.*;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;

import org.apache.log4j.*;
import org.apache.log4j.xml.Log4jEntityResolver;

import java.io.InputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;
import java.sql.*;
import java.text.SimpleDateFormat;
import org.phprpc.util.*;
import oracle.jdbc.rowset.OracleCachedRowSet;
import oracle.sql.ROWID;
import oracle.sql.BLOB;

public class OracleAccessDao {
	// public String openSQL(String sql, int maxSize)
	// {
	// return "SUCCESS";
	// }
	static Logger logger = Logger.getLogger(OracleAccessDao.class.getName());

	public String openSQL(String sql, String jndiName, String authCode) {
		return openSQL(sql, jndiName);
	}

	public String executeSQL(String sql, String jndiName) {
		logger.debug("excutesql: sql:" + sql);
		logger.debug("excutesql: jndiname:" + jndiName);
		String result = "";
		Connection conn;
		try {
			conn = ConnManager.getConnection(jndiName);
			try {
				Statement localStatement = conn.createStatement();
				localStatement.execute(sql);
				localStatement.close();
			} finally {
				if (conn != null)
					conn.close();
			}
		} catch (Exception localSQLException) {

			result = localSQLException.getMessage();
			System.err.println(localSQLException);
		}
		logger.debug("return result:" + result);

		return result;
	}

	public String openSQL(String sql, String jndiName) {
		logger.debug("OPENSQL: sql:" + sql);
		logger.debug("OPENSQL: jndiname:" + jndiName);
		String result = "";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;

		try {
			Connection conn;
			conn = ConnManager.getConnection(jndiName);
			try {
				Statement localStatement = conn.createStatement();
				if ((sql != null) && (sql.length() != 0)) {
					rs = localStatement.executeQuery(sql);
					ResultSetMetaData rmd = rs.getMetaData();

					sb.append("<?xml version=\"1.0\" standalone=\"yes\"?>  <DATAPACKET Version=\"2.0\"><METADATA><FIELDS>");
					for (int i = 1; i <= rmd.getColumnCount(); i++) {
						sb.append("<FIELD");
						sb.append(" attrname=\""
								+ rmd.getColumnName(i)
								+ "\""
								+ " "
								+ typeToString(rmd.getColumnType(i),
										rmd.getScale(i),
										rmd.getColumnDisplaySize(i)) + " ");
					}
					sb.append("</FIELDS><PARAMS/></METADATA><ROWDATA>");
					int ms = 0;
					for (; rs.next(); sb.append("/>")) {

						// if (ms >= maxSize && maxSize != 0) break;
						sb.append(" <ROW ");
						for (int i = 1; i <= rmd.getColumnCount(); i++) {
							sb.append(rmd.getColumnName(i) + "=" + "\""
									+ getCol(rs, rmd.getColumnType(i), i)
									+ "\"" + " ");
						}
						ms++;
					}
					sb.append("</ROWDATA></DATAPACKET>");
					result = sb.toString();
					logger.debug("output: " + sb.toString());
					// createSelectData(localResultSet);
					if (rs != null)
						rs.close();
					if (localStatement != null)
						localStatement.close();
				}

			} finally {
				if (conn != null)
					conn.close();
			}
		} catch (SQLException localSQLException) {
			result = "ERROR:" + localSQLException.toString();
			System.err.println(localSQLException);
		} catch (Exception localException) {
			System.err.println(localException);
			result = "ERROR:" + localException.toString();
		}

		return result;
	}

	public String getBolbField(String sql, String jndiName, String authCode) {
		String result = "";
		byte[] arrayOfByte = new byte[1];
		try {
			Connection conn;
			conn = ConnManager.getConnection(jndiName);

			try {
				Statement localStatement = conn.createStatement();
				ResultSet localResultSet = localStatement.executeQuery(sql);
				if (localResultSet.next()) {
					BLOB localBLOB = (BLOB) localResultSet.getBlob(1);
					int filesize=localResultSet.getInt(2);
					InputStream localInputStream = localBLOB.getBinaryStream();
					
					int i = localBLOB.getBufferSize();
					logger.debug("filesize size: " + filesize);
					arrayOfByte = new byte[filesize];
					localInputStream.read(arrayOfByte,0,filesize);
					 
				}

				if (localStatement != null)
					localStatement.close();
			} finally {
				if (conn != null)
					conn.close();
			}
		} catch (Exception localSQLException) {
			System.err.println(localSQLException);
		}
 
		result = Base64.encode(arrayOfByte);
		return result;
		

	}

	public String putBolbField(String tablename, String Blobfield,
			String LocateSql, String data, String jndiName, String authCode) {
		
		String result = "-1"; 
		int at=LocateSql.indexOf("=");
		String st1=LocateSql.substring(0,at);
		String st2=LocateSql.substring(at+1);
		String insertSql= "insert into " + tablename +"("+st1+","+Blobfield+") values ("
		                  + st2+","+"empty_blob() )";
		String FindSql = "select " + Blobfield + " from " + tablename
				+ " where " + LocateSql + " for update";
		String UpdateSql = "update " + tablename + " set " + Blobfield
				+ "=empty_blob() where " + LocateSql;
		// String insertSql = "insert into " + tablename +
		// "( "+ LocateSql+","+Blobfield+"=empty_blob()";

		// logger.debug("output Data: " + data);

		try {
			Connection conn;
			conn = ConnManager.getConnection(jndiName);

			try {
			    //byte[] arrayOfByte = new byte[Base64.decode(data).length];
				byte[] arrayOfByte = Base64.decode(data);
				 
				/* 测试代码
				 * File file = new File("c:\\quanjtest.jpg");
				FileOutputStream fo = new FileOutputStream(file);
				BufferedOutputStream st = new BufferedOutputStream(fo);
				st.write(arrayOfByte);
				st.close();
				
			   logger.debug("output FindSql: " + FindSql);
		       logger.debug("output UpdateSql: " + UpdateSql);
				
				*/

				conn.setAutoCommit(false);
				Statement localStatement = conn.createStatement();

				try {
					ResultSet localResultSet = localStatement
							  .executeQuery(FindSql);
					if ( ! localResultSet.next()) {   //没有记录,先插一条
						localStatement.executeQuery(insertSql);
						localResultSet.close();
						localResultSet = localStatement
						     .executeQuery(FindSql);
					} 
					//if ( localResultSet.next()) {

						BLOB localBLOB = (BLOB) localResultSet
								.getBlob(Blobfield);
						if (localBLOB == null) {
							// BLOB 字段为空,不能做更新,先插入一个empty_blob();
							localResultSet.close();
							localStatement.executeQuery(UpdateSql);
							localResultSet = localStatement
									.executeQuery(FindSql);
							localResultSet.next();
							localBLOB = (BLOB) localResultSet
									.getBlob(Blobfield);
						}
						 OutputStream localOutputStream = localBLOB
						 	.getBinaryOutputStream();
						 localOutputStream.write(arrayOfByte, 0,
								arrayOfByte.length);
						
						 localOutputStream.close();

						conn.commit();
						conn.setAutoCommit(true);
						result = "0";
					//}
				} catch (Exception localSQLException) {
					result = localSQLException.toString();
					conn.rollback();
				}

				if (localStatement != null)
					localStatement.close();

			} finally {
				if (conn != null)
					conn.close();
			}
		} catch (Exception localSQLException) {
			result = localSQLException.toString();
			System.err.println(localSQLException);
			return result;
		}
		// result = Base64.encode(arrayOfByte);

		return result;
	}

	public static String typeToString(int rsType, int scale, int size) {
		String rest = "";
		switch (rsType) {
		default:
			rest = "fieldtype=\"string\" WIDTH=\"" + String.valueOf(size)
					+ "\"/>";
			break;

		case 1: // '\001'
			rest = "fieldtype=\"string\" WIDTH=\"" + String.valueOf(size)
					+ "\"/>";
			break;

		case 12: // '\f'
			rest = "fieldtype=\"string\" WIDTH=\"" + String.valueOf(size)
					+ "\"/>";
			break;

		case 91: // '['
			rest = "fieldtype=\"dateTime\"/>";
			break;

		case 92: // '\\'
			rest = "fieldtype=\"dateTime\"/>";
			break;

		case 93: // ']'
			rest = "fieldtype=\"dateTime\"/>";
			break;

		case -5:
			rest = "fieldtype=\"fixed\" WIDTH=\"" + String.valueOf(size)
					+ "\"/>";
			break;

		case 3: // '\003'
			rest = "fieldtype=\"fixed\" DECIMALS=\"" + String.valueOf(scale)
					+ "\" WIDTH=\"" + String.valueOf(size) + "\"/>";
			break;

		case 8: // '\b'
			rest = "fieldtype=\"fixed\" DECIMALS=\"" + String.valueOf(scale)
					+ "\" WIDTH=\"" + String.valueOf(size) + "\"/>";
			break;

		case 6: // '\006'
			rest = "fieldtype=\"fixed\" DECIMALS=\"" + String.valueOf(scale)
					+ "\" WIDTH=\"" + String.valueOf(size) + "\"/>";
			break;

		case 4: // '\004'
			rest = "fieldtype=\"i4\"/>";
			break;

		case 2: // '\002'
			if (scale > 0)
				rest = "fieldtype=\"fixed\" DECIMALS=\""
						+ String.valueOf(scale) + "\" WIDTH=\""
						+ String.valueOf(size) + "\"/>";
			else
				rest = "fieldtype=\"fixed\" WIDTH=\"" + String.valueOf(size)
						+ "\"/>";
			break;

		case 7: // '\007'
			if (scale > 0)
				rest = "fieldtype=\"fixed\" DECIMALS=\""
						+ String.valueOf(scale) + "\" WIDTH=\""
						+ String.valueOf(size) + "\"/>";
			else
				rest = "fieldtype=\"fixed\" WIDTH=\"" + String.valueOf(size)
						+ "\"/>";
			break;

		case 5: // '\005'
			rest = "fieldtype=\"fixed\" WIDTH=\"" + String.valueOf(size)
					+ "\"/>";
			break;
		case -8: // '\005'
			rest = "fieldtype=\"string\" WIDTH=\"" + String.valueOf(20)
					+ "\"/>";
			break;
		}

		return rest;
	}

	public String formatDateTime(Timestamp ts) {
		String s = "";
		if (ts == null) {
			s = "";
		} else {
			s = (new SimpleDateFormat("yyyyMMdd HH:mm:ss")).format(ts)
					.replaceAll(" ", "T");
		}
		return (s);
	}

	public String getCol(ResultSet rst, int type, int colNum) throws Exception,
			SQLException {
		String ret = "";
		switch (type) {
		case 1: // '\001'
			ret = rst.getString(colNum);
			break;

		case 12: // '\f'
			ret = rst.getString(colNum);
			break;

		case 91: // '['
			ret = formatDateTime(rst.getTimestamp(colNum));
			break;

		case 92: // '\\'
			ret = formatDateTime(rst.getTimestamp(colNum));
			break;

		case 93: // ']'
			ret = formatDateTime(rst.getTimestamp(colNum));
			break;

		case -5:
			ret = rst.getString(colNum);
			break;

		case 3: // '\003'
			ret = rst.getString(colNum);
			break;

		case 8: // '\b'
			ret = rst.getString(colNum);
			break;

		case 6: // '\006'
			ret = rst.getString(colNum);
			break;

		case 4: // '\004'
			ret = rst.getString(colNum);
			break;

		case 2: // '\002'
			ret = rst.getString(colNum);
			break;

		case 7: // '\007'
			ret = rst.getString(colNum);
			break;

		case 5: // '\005'
			ret = rst.getString(colNum);
			break;
		default:
			if (rst.getObject(colNum) instanceof ROWID) {
				ret = String.valueOf(rst.getObject(colNum));
				oracle.sql.ROWID rid = (oracle.sql.ROWID) rst.getObject(colNum);
				ret = rid.stringValue();
			} else
				ret = rst.getString(colNum);
		}
		if (ret == null)
			ret = "";
		return ret;
	}

}
