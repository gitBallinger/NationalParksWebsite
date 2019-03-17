package com.techelevator.npgeek.model;

import java.util.List;

public interface ParkDao {
	
	public List<Park> getAllParks();
	
	public Park getParkByParkCode(String parkCode);

}
