<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">

a {
  text-decoration-line: none;  
  font-family: 'Nanum Gothic', sans-serif;
}

body {
	display: block;
    width: 700px;
    margin-left: auto;
    margin-right: auto;
    font-family: 'Nanum Gothic', sans-serif;
}

form {
	text-align: center;
	width:600px;
	margin: auto; 
	font-family: 'Nanum Gothic', sans-serif;
}

table {
	width:600px;
    margin-left:auto; 
    margin-right:auto;
    text-align: center;
    table-layout:fixed;
    font-family: 'Nanum Gothic', sans-serif;
}

td { 
	width:600px;
 	text-overflow:ellipsis; 
 	overflow:hidden; 
 	white-space:nowrap;
 	font-family: 'Nanum Gothic', sans-serif;
}

h2 {
font-family: 'Nanum Gothic', sans-serif;
}
</style>

<title>board3</title>
<script>
	function fn_formSubmit() {
		document.form1.submit();
	}
</script>
</head>
<body>
 <h2><img src="resources/image/Visual_logo_negative.png" alt="None"> 특허정보검색서비스</h2>
	<table class="table table-striped table-bordered">		
		<thead>
			<tr>
				<th width="100px">번호</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">
				<c:url var="link" value="board3Read">
					<c:param name="brdno" value="${listview.id}" />
				</c:url>
				<tr>
					<td><c:out value="${pageVO.totRow-((pageVO.page-1)*pageVO.displayRowCount + status.index)}" /></td>
					<td><a href="${link}"><c:out value="${listview.invention_title}" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="form1" name="form1" method="get" accept-charset="utf-8">
		<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
		<div>
			<input type="checkbox" name="searchType" value="invention_title" 
			<c:if test="${fn:indexOf(searchVO.searchType, 'invention_title')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType">제목</label> 
			
			<input type="checkbox" name="searchType" value="KR_OpenNumber"
			<c:if test="${fn:indexOf(searchVO.searchType, 'KR_OpenNumber')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType2">공개번호</label>
			
			<input type="checkbox" name="searchType" value="KR_Agent"
			<c:if test="${fn:indexOf(searchVO.searchType, 'KR_Agent')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType3">대리인</label>
			
			 <input type="text" name="searchKeyword" style="width: 150px;"
				maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"> <input
				name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_formSubmit()" />
		</div>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
