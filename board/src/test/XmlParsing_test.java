package test;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
/*
 * XML 10000건 실행시간 19초 ->줄이기
 * DOM 방식->SAX방식으로 실행시간 줄이기
 * optional클래스 활용해서 null 예외처리-함수형
 * @Nullable 어노테이션 활용해서 null 체크
 * try,catch 함수처리
 * 오라클에 No 무작위로 뜨는거 수정
 * 여러 줄짜리 붙는거 구분자로 나누기 ex), | \t
 * 카멜or파스칼 표기법으로 클래스, 메서드, 변수 수정
 * 변수명 직관적으로 알 수 있게 수정
 */

public class XmlParsing_test {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int file_num = 1;
		String a, b, c, d, e, f, g, h, i, j, k, l, m, n;
		String path = "C:\\eclipse\\board\\xml_list";
		File folder = new File(path);
		File[] fileList = folder.listFiles();
		try {
			String driverClassName = "oracle.jdbc.driver.OracleDriver"; 
			String url = "jdbc:oracle:thin:@localhost:1521:orcl"; //DB 연결 객체인 Connection 생성
			String id = "abc";
			String pw = "1234";
			Class.forName(driverClassName); //JDBC 드라이버 로드
			conn = DriverManager.getConnection(url, id, pw);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			String sql = "INSERT INTO XML_LIST VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			for (File file : fileList) {			
				Document document = db.parse(file);
				document.getDocumentElement().normalize();
				NodeList nList = document.getElementsByTagName("KR_OpenPatent");
				pstmt.setInt(1, file_num);
				file_num += 1;
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					Element eElement = (Element) nNode;				
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
						a = eElement.getElementsByTagName("KR_IPCInformation").item(0).getTextContent();
						try {b = eElement.getElementsByTagName("KR_CPCInformation").item(0).getTextContent();} 
						catch (NullPointerException z) {b = "None";}
						c = eElement.getElementsByTagName("KR_OpenNumber").item(0).getTextContent();
						d = eElement.getElementsByTagName("KR_OpenDate").item(0).getTextContent();
						e = eElement.getElementsByTagName("KR_ApplicationNumber").item(0).getTextContent();
						f = eElement.getElementsByTagName("KR_ApplicationDate").item(0).getTextContent();
						g = eElement.getElementsByTagName("KR_ApplicantInformation").item(0).getTextContent();
						h = eElement.getElementsByTagName("KR_Inventor").item(0).getTextContent();						
						try {i = eElement.getElementsByTagName("KR_Agent").item(0).getTextContent();} 
						catch (NullPointerException z) {i = "None";}
						try {j = eElement.getElementsByTagName("invention-title").item(0).getTextContent();} 
						catch (NullPointerException z) {j = "None";}
						try {k = eElement.getElementsByTagName("technical-field").item(0).getTextContent();}
						catch (NullPointerException z) {k = "None";}
						try {l = eElement.getElementsByTagName("background-art").item(0).getTextContent();} 
						catch (NullPointerException z) {l = "None";}
						try {m = eElement.getElementsByTagName("claim-text").item(0).getTextContent();} 
						catch (NullPointerException z) {m = "None";}					
						try {n = eElement.getElementsByTagName("summary").item(0).getTextContent();} 
						catch (NullPointerException z) {n = "None";}
						pstmt.setString(2, a);
						pstmt.setString(3, b);
						pstmt.setString(4, c);
						pstmt.setString(5, d);
						pstmt.setString(6, e);
						pstmt.setString(7, f);
						pstmt.setString(8, g);
						pstmt.setString(9, h);
						pstmt.setString(10, i);
						pstmt.setString(11, j);
						pstmt.setString(12, k);
						pstmt.setString(13, l);
						pstmt.setString(14, m);
						pstmt.setString(15, n);
						pstmt.executeUpdate();
					}
				}
			}
			pstmt.close();
			conn.close();
		} catch (SQLException z) {
			z.printStackTrace();
		} catch (IOException z) {
			z.printStackTrace();
		} catch (ClassNotFoundException z) {
			z.printStackTrace();
		}
	}
}