package com.cs336.pkg;

public class Auction {
	private int id,highestBidderID;
	private String startDate,endDate, isAvailable;
	private double initialBidPrice, incrementBidPrice, minBid, currentBidPrice;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	public double getInitialBidPrice() {
		return initialBidPrice;
	}
	public void setInitialBidPrice(double initialBidPrice) {
		this.initialBidPrice = initialBidPrice;
	}
	public double getIncrementBidPrice() {
		return incrementBidPrice;
	}
	public void setIncrementBidPrice(double incrementBidPrice) {
		this.incrementBidPrice = incrementBidPrice;
	}
	public double getMinBid() {
		return minBid;
	}
	public void setMinBid(double minBid) {
		this.minBid = minBid;
	}
	public double getCurrentBidPrice() {
		return currentBidPrice;
	}
	public void setCurrentBidPrice(double currentBidPrice) {
		this.currentBidPrice = currentBidPrice;
	}
	public int getHighestBidderID() {
		return highestBidderID;
	}
	public void setHighestBidderID(int highestBidderID) {
		this.highestBidderID = highestBidderID;
	}
	
	
}
