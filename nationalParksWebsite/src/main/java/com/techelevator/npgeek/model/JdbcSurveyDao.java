package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcSurveyDao implements SurveyDao{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcSurveyDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	/*
	 * Pulls all completed surveys from the survey table. 
	 */
	
	@Override
	public List<Survey> getAllSurveys() {
		List<Survey> allSurveys = new ArrayList<>();
		String sqlSelectAllsurveys = "SELECT COUNT(surveyid), parkcode FROM survey_result GROUP BY parkcode ORDER BY COUNT(surveyid) DESC, parkcode";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllsurveys);
		while(results.next()) {
			allSurveys.add(mapRowToSurvey(results));
		}
		return allSurveys;
	}

	
	/*
	 * Saves new survey to the database. 
	 */
	
	@Override
	public void save(Survey survey) {
		Integer id = getNextId();
		String sqlInsertSurvey = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertSurvey, id, survey.getParkCode(), survey.getEmailAddress(), survey.getState(), survey.getActivityLevel());
		survey.setSurveyId(id);
	}
	
	
	/*
	 * Count all surveys by park code and return integer. 
	 */
	
	@Override
	public Integer getSurveyCountByParkCode(String parkCode) {
		List<Survey> parkSurveys = new ArrayList<>();
		String sqlSelectSurveys = "SELECT * from survey_result WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectSurveys, parkCode);
		while(results.next()) {
			parkSurveys.add(mapRowToSurvey(results));
		}
		return parkSurveys.size();
		
	}

	/*
	 * Returns a map that contains the park code abbreviation in the key slot and the count of surveys for that park in the value slot. 
	 */
		
	@Override
	public Map<String, Integer> getTotalSurveysByPark() {
		Map<String, Integer> parkMap = new HashMap<String, Integer>();
		String sqlSelectAllSurveys = "SELECT COUNT(surveyid) AS totalcount, parkcode FROM survey_result GROUP BY parkcode ORDER BY COUNT(surveyid) DESC, parkcode";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveys);
		while(results.next()) {
			parkMap.put(results.getString("parkcode"), results.getInt("totalcount"));
		}
		
		return parkMap;
	}

	/*
	 * Finds serial ID for next survey in survey table. This method is used when adding a new survey to the database. 
	 */
	private Integer getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyid')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Integer id = null;
		if(results.next()) {
			id = results.getInt(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next survey post id from sequence");
		}
		return id;
	}
	
	/*
	 * Populates new survey object according to the search query.
	 */
	
	private Survey mapRowToSurvey(SqlRowSet results) {
		
		Survey survey = new Survey();
		survey.setParkCode(results.getString("parkcode"));
		survey.setSurveyId(results.getInt("surveyid"));
		survey.setState(results.getString("state"));
		survey.setEmailAddress(results.getString("emailaddress"));
		survey.setActivityLevel(results.getString("activitylevel"));
		
		return survey;
		
	}



}
