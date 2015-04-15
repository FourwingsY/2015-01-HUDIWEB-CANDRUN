package candrun.controller;

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

@RestController("/nudges")
public class NudgesController {
	private static final Logger LOGGER = LoggerFactory.getLogger(NudgesController.class);
	
	@Autowired
	TaskDAO taskDao;
	
	@Autowired
	GoalDAO goalDao;

	@RequestMapping(method = RequestMethod.POST)
	public String create(HttpServletRequest req, HttpServletResponse resp) {
		int tasksId = Integer.parseInt(req.getParameter("tasksId"));
		LOGGER.debug("taskId: {}", tasksId);	
		taskDao.addNudge(tasksId);

		return "showGoalAndTasks";
	}
}