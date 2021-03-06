<!DOCTYPE HTML>
<%@page import="dao.SessionDao"%>
<%@page import="utils.XMLParser"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.VersionDao"%>
<%@page import="vo.Version"%>
<%@page import="dao.UpdateAppDao"%>
<%@page import="vo.UpdateApp"%>
<%@page import="vo.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메모가지 관리자</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		System.out.println(userID);
		System.out.println(userPassword);

		User user = new User();
		user.setUserID(userID);
		user.setUserPassword(userPassword);

		boolean isAdmin = UserDao.checkAdmin(user);
		System.out.println("select isAdmin : " + isAdmin);
		
		String userid = XMLParser.getXMLObject("SessionUserId");
		
		
		
		if (isAdmin == true) {
		
			boolean isResult = UserDao.checkUser(user);
			System.out.println("select isResult : " + isResult);
			
			//세션에 로그인 계정 값 추가
			SessionDao.addSessionValue(request, userid, userID);
			SessionDao.printSessionValues(request);
			
			if (isResult) {
				response.sendRedirect("/kikiMain.html");
			} else {
				response.sendRedirect("/index.html");
			}
		} else {
			
			//세션에 로그인 계정 값 추가
			SessionDao.addSessionValue(request, userid, "guest");
			SessionDao.printSessionValues(request);
			response.sendRedirect("/guestMain.html");
		}
	%>
</body>
</html>
