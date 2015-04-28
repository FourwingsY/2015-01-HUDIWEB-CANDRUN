<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ tagliburi="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>9bagi</title>
	<meta charset = "utf-8">
	<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<header>
	</header>
			<nav>
		<div class="profile_wrapper">
			<div class="profile_picture"></div>
			<div class="nick">nickname</div>
		</div>
		<div id="goal_groups">
		<div class="label">List of goals & people in group</div>
			<ul class="nav_goal_container">
				<li class="nav_goal">살빼기</li>
				<li class="nav_goal">밥먹기</li>
				<li class="nav_goal">잠자기</li>
			</ul>	
		</div>
	</nav>
	<section id="makeGoal">
		<div class="form_wrapper">
			<form class ="submit_form" >
				<input class="goal_contents" name="goal_contents">
				<div class="input_container">
					<input class="task_contents">
				</div>
				<div class="add_input_btn"> + </div>
				<div id = "btnAddGoal" class ="submit_btn">확인</div>
				<div>
					<c:forEach items="${friends}" var="friends">
						<div>${friends.nickname}</div>
					</c:forEach>			
				</div>
				<section id="showGoal">
		</div>
	</section>
			</form> 
		</div>
	</section>
	<footer></footer>
</body>
<script src="/js/addGoal.js"></script>
<script src="/js/candrun.js"></script>
</html>