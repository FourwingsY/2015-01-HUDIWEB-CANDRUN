<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>9bagi</title>
<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<nav>
	<div class="profile-wrapper">
		<div class="profile-picture"
			style='background-image: url("/img/pics/${user.picPath}")'></div>
		<div class="nick">${user.nickname}</div>
	</div>
	<!-- id로 되어있는 friend 부분은 DB에서 받아오면서 class로 바꾸어야 한다. -->
	<div id="goal-groups">
		<ul class="nav-goal-container">

			<c:forEach var="goalRelation" items="${goalRelations}">
				<li class="nav-goal"><span id="${goalRelation.myGoal.id}">${goalRelation.myGoal.contents}</span>
					<div class="nav-friends-container">
						<c:forEach var="relation" items="${goalRelation.relation}">
							<div class="friend-picture" id="${relation.value.id}"
								style='background-image: url("/img/pics/${relation.key.picPath}")'></div>
						</c:forEach>
					</div></li>
			</c:forEach>
		</ul>
	</div>
	</nav>

	<section id="show-goal">
	<div class="goal-wrapper">
		<div class="goal-title">${goalRelations[0].myGoal.contents}</div>
		<div class="startdate">${goalRelations[0].myGoal.startDate}</div>
	</div>
	<c:forEach items="${tasks}" var="task">
		<div class="task-wrapper">
			<form class="submit_nudge">
				<input type="submit" class="btn-nudge" value="${task.contents}" />
				<input type="hidden" class="tasksId" value="${task.id}" /> <input
					type="hidden" class="task-complete" value="${task.complete}" />
				<div class="nudge-number">${task.nudge}</div>
			</form>
		</div>
	</c:forEach> </section>

	<section id="make-goal">
	<form class="submit-form">
		<input class="goal-input" name="goal_contents" value="제목을 입력해주세요.">
			<div class="input-container">
				<input class="task-input" />
			</div>
			<div class="task-input-add">+</div>
			<div class="goal-form-submit">submit</div>
	</form>
	</section>
</body>
<script src="/js/template/handlebars-v3.0.3.js"></script>
<script src="/js/addGoal.js"></script>
<script src="/js/addNudge.js"></script>
<script src="/js/candrun.js"></script>
<script src="/js/home.js"></script>
</html>