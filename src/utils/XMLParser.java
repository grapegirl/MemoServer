package utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * XML �뙆�떛 �쑀�떥 �겢�옒�뒪
 * 
 * @author grapegirl
 */
public class XMLParser {

	/**
	 * �꽌踰� �솚寃쎌꽕�젙 �봽濡쒗띁�떚瑜� 媛��졇�삤湲� �쐞�븳 硫붿냼�뱶
	 * 
	 * @param keyName
	 * @return KeyValue
	 */
	public static String getXMLObject(String keyName) {
		Properties properties = new Properties();

		try {
			String url = "/Users/mhkim/Documents/Dev/MemoServer/WebContent/property.xml"; //local
			//String url = "/home/hosting_users/kikiplus/www/WEB-INF/property.xml"; // real
			properties.loadFromXML(new FileInputStream(url));

			return (String) properties.get(keyName);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 吏덉쓽臾몄쓣 媛��졇�삤湲� �쐞�븳 硫붿냼�뱶
	 * 
	 * @param 吏덉쓽臾�
	 *            �씠由�
	 * @return �빐�떦 吏덉쓽臾�
	 */
	public static String getSqlFromXML(String sqlName) {
		Properties properties = new Properties();

		try {
			String url = "/Users/mhkim/Documents/Dev/MemoServer/WebContent/sql.xml"; //local
			//String url = "/home/hosting_users/kikiplus/www/WEB-INF/sql.xml"; // real 
			properties.loadFromXML(new FileInputStream(url));

			return (String) properties.get(sqlName);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
