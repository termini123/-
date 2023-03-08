<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
</head>
<body>
	<table border="1" style="width: 90%">
		<caption>게시판</caption>
		<colgroup>
			<col width='15%' />
			<col width='300%' />
		</colgroup>
		<tr>
				<td align="center">제목</td>
				<td><c:out value="${boardInfo.invention_title}"  /></td>			
		</tr>
		<tr>
			<td>IPC정보</td>
			<td><c:out value="${boardInfo.KR_IPCInformation}" /></td>
		</tr>
		<tr>
			<td>CPC정보</td>
			<td><c:out value="${boardInfo.KR_CPCInformation}" /></td>
		</tr>
		<tr>
			<td>공개번호</td>
			<td><c:out value="${boardInfo.KR_OpenNumber}" /></td>
		</tr>
		<tr>
			<td>공개일자</td>
			<td><c:out value="${boardInfo.KR_OpenDate}" /></td>
		</tr>
		<tr>
			<td>출원번호</td>
			<td><c:out value="${boardInfo.KR_ApplicationNumber}" /></td>
		</tr>
		<tr>
			<td>출원일자</td>
			<td><c:out value="${boardInfo.KR_ApplicationDate}" /></td>
		</tr>
		<tr>
			<td>출원인</td>
			<td><c:out value="${boardInfo.KR_ApplicantInformation}" /></td>
		</tr>
		<tr>
			<td>발명자</td>
			<td><c:out value="${boardInfo.KR_Inventor}" /></td>
		</tr>
		<tr>
			<td>대리인</td>
			<td><c:out value="${boardInfo.KR_Agent}" /></td>
		</tr>
		<tr>
			<td>특허명칭</td>
			<td><c:out value="${boardInfo.invention_title}" /></td>
		</tr>
		<tr>
			<td>기술분야설명</td>
			<td><c:out value="${boardInfo.technical_field}" /></td>
		</tr>
		<tr>
			<td>배경기술</td>
			<td><pre><c:out value="${boardInfo.background_art}" /></pre></td>
		</tr>
		<tr>
			<td>청구항</td>
			<td><c:out value="${boardInfo.claim_text}" /></td>
		</tr>
		<tr>
			<td>요약</td>
			<td><c:out value="${boardInfo.summary}" /></td>
		</tr>
	</table>   
        <a href="#" onclick="history.back(-1)">돌아가기</a>
        <a href="board3Delete?brdno=<c:out value="${boardInfo.id}"/>">삭제</a>
        <a href="board3Form?brdno=<c:out value="${boardInfo.id}"/>">수정</a>
</body>
</html>
