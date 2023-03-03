<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
<body>
	<form name="form1" action="board1Save">
		<table border="1" style="width: 600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='100%' />
			</colgroup>
			
				<tr>
					<td>제목</td>
					<td><input type="text" name="invention_title" size="200"
						maxlength="300"
						value="<c:out value="${boardInfo.invention_title}"/>"></td>
				</tr>
				<tr>
					<td>IPC정보</td>
					<td><input type="text" name="KR_IPCInformation" size="70" maxlength="250"><c:out
								value="${boardInfo.KR_IPCInformation}" /></td>
				</tr>
				<tr>
					<td>CPC정보</td>
					<td><input type="text" name="KR_CPCInformation" size="70" maxlength="250"><c:out
								value="${boardInfo.KR_CPCInformation}" /></td>
				</tr>
				<tr>
					<td>공개번호</td>
					<td><input type="text" name="KR_OpenNumber" size="70" maxlength="250"><c:out
								value="${boardInfo.KR_OpenNumber}" /></td>
				</tr>
				<tr>
					<td>공개일자</td>
					<td><textarea name="KR_OpenDate" rows="5" cols="10"><c:out
								value="${boardInfo.KR_OpenDate}" /></textarea></td>
				</tr>
				<tr>
					<td>출원번호</td>
					<td><textarea name="KR_ApplicationNumber" rows="5" cols="10"><c:out
								value="${boardInfo.KR_ApplicationNumber}" /></textarea></td>
				</tr>
				<tr>
					<td>출원일자</td>
					<td><textarea name="KR_ApplicationDate" rows="5" cols="10"><c:out
								value="${boardInfo.KR_ApplicationDate}" /></textarea></td>
				</tr>
				<tr>
					<td>출원인</td>
					<td><textarea name="KR_ApplicantInformation" rows="5"
							cols="10"><c:out
								value="${boardInfo.KR_ApplicantInformation}" /></textarea></td>
				</tr>
				<tr>
					<td>발명자</td>
					<td><textarea name="KR_Inventor" rows="5" cols="10"><c:out
								value="${boardInfo.KR_Inventor}" /></textarea></td>
				</tr>
				<tr>
					<td>대리인</td>
					<td><textarea name="KR_Agent" rows="5" cols="10"><c:out
								value="${boardInfo.KR_Agent}" /></textarea></td>
				</tr>
				<tr>
					<td>특허명칭</td>
					<td><textarea name="invention_title" rows="5" cols="10"><c:out
								value="${boardInfo.invention_title}" /></textarea></td>
				</tr>
				<tr>
					<td>기술분야설명</td>
					<td><textarea name="technical_field" rows="5" cols="10"><c:out
								value="${boardInfo.technical_field}" /></textarea></td>
				</tr>
				<tr>
					<td>배경기술</td>
					<td><textarea name="background_art" rows="20" cols="10"><c:out
								value="${boardInfo.background_art}" /></textarea></td>
				</tr>
				<tr>
					<td>청구항</td>
					<td><textarea name="claim_text" rows="10" cols="100"><c:out
								value="${boardInfo.claim_text}" /></textarea></td>
				</tr>
				<tr>
					<td>요약</td>
					<td><textarea name="summary" rows="5" cols="10"><c:out
								value="${boardInfo.summary}" /></textarea></td>
				</tr>
			
		</table>
		<a href="#" onclick="form1.submit()">저장</a> <input type="hidden"
			name="brdno" value="<c:out value="${boardInfo.id}"/>"> <input
			type="hidden" name="brddate"
			value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${boardInfo.brddate[0]}" />">
	</form>
</body>
</html>
