package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcDayOfWeatherDao implements DayOfWeatherDao{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcDayOfWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	/*
	 * Returns list of weather (i.e. dayOfWeather) objects according to park code. This list is used to provide a 5-day forecast on 'parkResults' web page. 
	 * Each weather object contains a high temperature, low temperature, day of week, and weather forecast for that day. 
	 */
	
	@Override
	public List<DayOfWeather> getAllDaysFromParkCode(String parkCode) {
		List<DayOfWeather> allDays = new ArrayList<>();
		String sqlSelectAllDays = "SELECT * FROM weather WHERE parkcode = ? ORDER BY fivedayforecastvalue";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllDays, parkCode);
		while(results.next()) {
			allDays.add(mapRowToDayOfWeather(results));
		}
		return allDays;
	}
	
	/*
	 * Populates a weather object according to a SQL query. 
	 */
	
	private DayOfWeather mapRowToDayOfWeather(SqlRowSet results) {
		
		DayOfWeather day = new DayOfWeather();
		day.setParkCode(results.getString("parkcode"));
		day.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
		day.setLowInF(results.getInt("low"));
		day.setHighInF(results.getInt("high"));
		day.setLowInC(results.getInt("low"));
		day.setHighInC(results.getInt("high"));
		day.setForecast(results.getString("forecast"));
		
		return day;
		
	}

}
