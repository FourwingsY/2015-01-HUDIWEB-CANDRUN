<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header></header>
	<nav></nav>
	<section id = "signUp">
		<div class= "main">
			<form name = "signUpForm" action="/form_action.jsp" method = "post">
				<table>
					<tr>
						<td width="80"> 
							이메일
						</td>
						<td>
							<input type="text" name = "email">
						</td>
					</tr>
					<tr>
						<td width="80"> 
							닉네임 
						</td>
						<td>
							<input type="text" name = "nickName">
						</td>
					</tr>
					<tr>
						<td width="80"> 
							비밀번호 	
						</td>
						<td>
							<input type="text" name = "password">
						</td>
					</tr>
				</table>
				<input type="submit" value="회원가입"/>	
			</form>	
		</div>
	</section>
	<footer></footer>
</body>
</html>