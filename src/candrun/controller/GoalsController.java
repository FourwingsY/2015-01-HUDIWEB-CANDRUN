package candrun.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import candrun.dao.GoalDAO;
import candrun.dao.TaskDAO;
import candrun.model.Goal;
import candrun.model.Task;

@RequestMapping("/goals")
@RestController
public class GoalsController {
	private static final Logger LOGGER = LoggerFactory.getLogger(NudgesController.class);

	@Autowired
	GoalDAO goalDao;

	@Autowired
	TaskDAO taskDao;

	@RequestMapping(method = RequestMethod.POST)
	public Object create(HttpServletRequest req, HttpServletResponse resp){

		String goalContents = req.getParameter("goal_contents");
		
		ArrayList<String> arrTaskContents = new ArrayList<String>();
		
		for(int i=0;i<5;i++){
			String taskContents = req.getParameter("task_contents_"+i);
			if(taskContents==null){
				break;
			}
			arrTaskContents.add(taskContents);
		}
		
		Goal goal = new Goal(goalContents, "email");
		int returnedId = goalDao.addGoal(goal);
	
		for (int i = 0; i < arrTaskContents.size(); i++) {
			taskDao.addTask(new Task(arrTaskContents.get(i), returnedId));
		}	
		return goal;
	}
}
