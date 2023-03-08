<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>

<style type="text/css">
#c {
  margin:auto;
  text-align:center;
}
</style>
</head>
<body style="white-space:pre;">
	<table border="1" style="width: 90%" class="table table-striped table-bordered" >
		<caption>목록</caption>
		<colgroup>
			<col width='11%' />
			<col width='100%' />
		</colgroup>
		<tr>
			<td id="c">제목</td>
			<td><c:out value="${boardInfo.invention_title}"  /></td>			
		</tr>
		<tr>
			<td id="c">IPC정보</td>
			<td><c:out value="${boardInfo.KR_IPCInformation}" /></td>
		</tr>
		<tr>
			<td id="c">CPC정보</td>
			<td><c:out value="${boardInfo.KR_CPCInformation}" /></td>
		</tr>
		<tr>
			<td id="c">공개번호</td>
			<td><c:out value="${boardInfo.KR_OpenNumber}" /></td>
		</tr>
		<tr>
			<td id="c">공개일자</td>
			<td><c:out value="${boardInfo.KR_OpenDate}" /></td>
		</tr>
		<tr>
			<td id="c">출원번호</td>
			<td><c:out value="${boardInfo.KR_ApplicationNumber}" /></td>
		</tr>
		<tr>
			<td id="c">출원일자</td>
			<td><c:out value="${boardInfo.KR_ApplicationDate}" /></td>
		</tr>
		<tr>
			<td id="c">출원인</td>
			<td><c:out value="${boardInfo.KR_ApplicantInformation}" /></td>
		</tr>
		<tr>
			<td id="c">발명자</td>
			<td><c:out value="${boardInfo.KR_Inventor}" /></td>
		</tr>
		<tr>
			<td id="c">대리인</td>
			<td><c:out value="${boardInfo.KR_Agent}" /></td>
		</tr>
		<tr>
			<td id="c">특허명칭</td>
			<td><c:out value="${boardInfo.invention_title}" /></td>
		</tr>
		<tr>
			<td id="c">기술분야설명</td>
			<td><c:out value="${boardInfo.technical_field}" /></td>
		</tr>
		<tr>
			<td id="c">배경기술</td>
			<td><c:out value="${boardInfo.background_art}" /></td>
		</tr>
		<tr>
			<td id="c">청구항</td>
			<td><c:out value="${boardInfo.claim_text}" /></td>
		</tr>
		<tr>
			<td id="c">요약</td>
			<td><c:out value="${boardInfo.summary}" /></td>
		</tr>
	</table>   
        <a href="#" onclick="history.back(-1)">돌아가기</a>
        <a href="board3Delete?brdno=<c:out value="${boardInfo.id}"/>">삭제</a>
        <a href="board3Form?brdno=<c:out value="${boardInfo.id}"/>">수정</a>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
