<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
</head>
<body>
    <form name="form1" action="board3Save">
        <table border="1" style="width:600px">
            <caption>게시판</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
                    <td><input type="text" name="brdwriter" size="20" maxlength="20" value="<c:out value="${boardInfo.brdwriter[0]}"/>"></td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><input type="text" name="brdtitle" size="70" maxlength="250"  value="<c:out value="${boardInfo.brdtitle[0]}"/>"></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><textarea name="brdmemo" rows="5" cols="60"><c:out value="${boardInfo.brdmemo[0]}"/></textarea></td> 
                </tr>
            </tbody>
        </table>    
        <a href="#" onclick="form1.submit()">저장</a>
        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.id}"/>">
        <input type="hidden" name="brddate" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${boardInfo.brddate[0]}" />">
    </form>    
</body>
</html>
