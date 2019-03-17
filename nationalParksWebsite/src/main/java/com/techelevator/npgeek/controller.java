package com.techelevator.npgeek;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.DayOfWeatherDao;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;

/**
 * Welcome to the National Parks Website Application!
 * 
 * The purpose of this java application is to demonstrate interactive web content fundamentals and form validation
 *  using Spring MVC.
 * 
 * On the National Parks Website, a user will be able to view all available parks within a database, an individual park's
 * details, and a 5 day weather forecast that pulls from weather data within the database. Additionally, this website allows users
 * to submit a fitness survey for their desired park and review all submitted surveys for other parks.
 * 
 * Enjoy!
 * 
 */

@Controller
public class controller {

	@Autowired 
	private ParkDao parkDao;
	@Autowired 
	private SurveyDao surveyDao;
	@Autowired 
	private DayOfWeatherDao dayOfWeatherDao;
	
	/*
	 * The home page lists all parks and their descriptions as pulled from the database. 
	 */
	
	@RequestMapping(path= {"/", "/home"}, method = RequestMethod.GET)
	public String displayHomePage(ModelMap modelMap) {
		
		modelMap.put("parks", parkDao.getAllParks());
		
		return "home";
	}
	
	/*
	 * If the user is interested in learning more about a park, they can select a park from the home page to see its individual details listed on the 'parkDetails" page. 
	 * In addition to seeing each park's individual information, the 'parkDetails' page will also pull this park's 5-day weather forecast from the database. 
	 */
	
	@RequestMapping(path="/parkDetails", method = RequestMethod.GET)
	public String displayParkDetails(@RequestParam String parkCode, @RequestParam(required = false) String temperature, ModelMap modelmap, HttpSession session) {
		
		if (temperature != null) {
			session.setAttribute("temperature", temperature);
		}
		
		else if (session.getAttribute("temperature") == null) {
			session.setAttribute("temperature", "fahrenheit");	
		}
		
		modelmap.put("park", parkDao.getParkByParkCode(parkCode));
		modelmap.put("weather", dayOfWeatherDao.getAllDaysFromParkCode(parkCode));
		
		return "parkDetails";
	}
	
	/*
	 * Users can submit a short survey on the 'survey' page that will will validate all information is correct before being sent to the 'surveyResults' page, 
	 * which shows the total surveys submitted by park. 
	 */
	
	@RequestMapping(path="/survey", method = RequestMethod.GET)
	public String displaySurvey(ModelMap modelMap) {
		
		modelMap.put("parks", parkDao.getAllParks());
		
		if(modelMap.containsAttribute("survey") == false) {
			Survey survey = new Survey();
			modelMap.put("survey", survey);
		}
		
		return "survey";
	}
	
	@RequestMapping(path="/survey", method = RequestMethod.POST)
	public String submitSurvey(@Valid @ModelAttribute Survey survey, BindingResult result, RedirectAttributes flash) {
		
		flash.addFlashAttribute("survey", survey);
		
		if(result.hasErrors()) {
			
			for(ObjectError error : result.getAllErrors()) {
				System.out.print(error);
			}
			
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			return "redirect:/survey";
		}
		
		surveyDao.save(survey);
		
		return "redirect:/surveyResults";
	}
	
	@RequestMapping(path="/surveyResults", method = RequestMethod.GET)
	public String displaySurveyResults(ModelMap modelmap) {
		
		if(modelmap.containsAttribute("survey") == true) {
			String confirmationMessage = "Survey Received. Thank you!";
			modelmap.put("confirmation", confirmationMessage);
		}
		
		modelmap.put("parkMap", surveyDao.getTotalSurveysByPark());
		modelmap.put("parks", parkDao.getAllParks());
		
		return "surveyResults";
	}

}
