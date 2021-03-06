<%@page import="dao.ServerDao"%>
<%@page import="vo.IP"%>
<%@page import="dao.UpdateAppDao"%>
<%@page import="vo.UpdateApp"%>
<%@page import="utils.XMLParser"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="CheckSession.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.onvisible.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<link rel="stylesheet" href="/MemoServer/css/style.css" />
<link rel="stylesheet" href="/MemoServer/css/style.css" />
<link rel="stylesheet" href="/MemoServer/css/style-desktop.css" />
<link rel="stylesheet" href="/MemoServer/css/style-noscript.css" />
<script>
	function pass(url) {
		location.href = url;
	}
	function passForm(url) {
		var f = document.board;
		f.action = url;
		f.submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메모가지 관리자</title>
</head>
<body class="homepage">
	<div class="inner">
		<b>서버 IP관리 페이지</b>
		<form name=board method=post>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="5">
					<td width="5"></td>
				</tr>
				<tr align="center">
					<td width="100">버전코드</td>
					<td width="379">IP주소</td>
				</tr>
				<tr height="20" align="center">
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="6" width="752"></td>
				</tr>
				<%
					//게시판 목록 불러오기
					String sql = XMLParser.getSqlFromXML("selectIP");
					ArrayList<IP> ipList = (ArrayList<IP>) ServerDao.selectIP(sql);
					for (int i = 0; i < ipList.size(); i++) {
				%>
				<tr align="center" height="30">
					<td width="100"><input name="idx" type="radio"
						value="<%=ipList.get(i).getVersionCode()%>"> <%=ipList.get(i).getVersionCode()%></td>
					<td width="379" align="left"><%=ipList.get(i).getVersionName()%></a></td>
				</tr>
				<%
					}
				%>
			</table>

			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="4" height="30"></td>
				</tr>
				<tr align="center">
					<td><input type=button value="홈"
						Onclick="javascript:pass('/kikiMain.html')"> <input
						type=button value="등록"
						Onclick="javascript:pass('/jsp/InsertIP.jsp')">
						<input type=button value="수정"
						Onclick="javascript:passForm('/jsp/ModifyIP.jsp')">
						<input type=button value="삭제"
						Onclick="javascript:passForm('/jsp/DeleteIP.jsp')">
					</td>
				</tr>
				<tr height="100">
					<td colspan="6"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
