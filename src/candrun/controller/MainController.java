package candrun.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import candrun.dao.GoalDAO;
import candrun.dao.TaskDAO;
import candrun.dao.UserDAO;
import candrun.model.Goal;
import candrun.model.Task;
import candrun.user.User;

@RequestMapping("/")
@Controller
public class MainController {
	private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);


	@Autowired
	GoalDAO goalDao;

	@Autowired
	TaskDAO taskDao;
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		email = "requester@email.com";
		Goal topGoal = goalDao.findRecentGoal();
		List<Task> tasks = taskDao.findTasksByGoalId(topGoal.getId());
		List<User> friends = userDao.findFriendsAsRequester(email);
		
			
		model.addAttribute("goal", topGoal);
		model.addAttribute("tasks", tasks);
		model.addAttribute("friends", friends);
		System.out.println(friends.toString());
		for(User user: friends){
			LOGGER.info(user.getNickname());
		}
	
		

//		모델을 이용하여 attribute 더해준다. 아래는 이전 코드
//		req.setAttribute("goal", topGoal);
//		req.setAttribute("tasks", taskDao.findTasksByGoalId(topGoal.getId()));

		return "home";
	}
}
