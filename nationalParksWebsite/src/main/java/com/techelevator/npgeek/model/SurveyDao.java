package com.techelevator.npgeek.model;

import java.util.List;
import java.util.Map;

public interface SurveyDao {
	
	public List<Survey> getAllSurveys();
	
	public void save(Survey survey);
	
	public Integer getSurveyCountByParkCode(String parkCode);
	
	public Map<String, Integer> getTotalSurveysByPark();

}
