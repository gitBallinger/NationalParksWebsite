package com.techelevator.npgeek.model;

import java.util.List;

public interface DayOfWeatherDao {
	
	public List<DayOfWeather> getAllDaysFromParkCode(String parkCode);

}
