<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	table-layout: fixed;
	word-break: keep-all;
	white-space: pre-line;
	font-family: 'Nanum Gothic', sans-serif;
}

form {
	text-align: center;
	width: 90%;
	margin: auto;
	font-family: 'Nanum Gothic', sans-serif;
}

input {
	width: 100%;
	height: 100%;
	font-family: 'Nanum Gothic', sans-serif;
}

.c {
	margin: auto;
	text-align: center;
	width: 15%;
	font-family: 'Nanum Gothic', sans-serif;
}

td {
	width: inherit;
	height: 100%;
	white-space: nowrap;
	font-family: 'Nanum Gothic', sans-serif;
}

textarea {
	width: 100%;
    height: 100%;
    border: none;
    resize: none;
    font-family: 'Nanum Gothic', sans-serif;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
<body style="white-space: pre;">
	<form name="form1" action="board1Save">
		<table class="table table-striped table-bordered">

			<tr>
				<td class="c">IPC정보</td>
				<td><textarea><c:out value="${boardInfo.KR_IPCInformation}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">CPC정보</td>
				<td><textarea><c:out value="${boardInfo.KR_CPCInformation}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">공개번호</td>
				<td><textarea><c:out value="${boardInfo.KR_OpenNumber}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">공개일자</td>
				<td><textarea><c:out value="${boardInfo.KR_OpenDate}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">출원번호</td>
				<td><textarea><c:out value="${boardInfo.KR_ApplicationNumber}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">출원일자</td>
				<td><textarea><c:out value="${boardInfo.KR_ApplicationDate}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">출원인</td>
				<td><textarea><c:out value="${boardInfo.KR_ApplicantInformation}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">발명자</td>
				<td><textarea><c:out value="${boardInfo.KR_Inventor}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">대리인</td>
				<td><textarea><c:out value="${boardInfo.KR_Agent}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">특허명칭</td>
				<td><textarea><c:out value="${boardInfo.invention_title}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">기술분야설명</td>
				<td><textarea><c:out value="${boardInfo.technical_field}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">배경기술</td>
				<td><textarea><c:out value="${boardInfo.background_art}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">청구항</td>
				<td><textarea><c:out value="${boardInfo.claim_text}" /></textarea></td>
			</tr>
			<tr>
				<td class="c">요약</td>
				<td><textarea><c:out value="${boardInfo.summary}" /></textarea></td>
			</tr>

		</table>
		<a href="#" onclick="form1.submit()">저장</a>
		<input type="hidden" name="brdno" value="<c:out value="${boardInfo.id}"/>">
        <input type="hidden" name="brddate" value="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${boardInfo.brddate[0]}" />">
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
