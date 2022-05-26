package com.cs336.pkg;

public class Pants {
	private int itemID;
	private int pantWaist;
	private double bidPrice;
	private String pantType, pantGender, color;
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public int getPantWaist() {
		return pantWaist;
	}
	public void setPantWaist(int pantWaist) {
		this.pantWaist = pantWaist;
	}
	public double getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(double bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getPantType() {
		return pantType;
	}
	public void setPantType(String pantType) {
		this.pantType = pantType;
	}
	public String getPantGender() {
		return pantGender;
	}
	public void setPantGender(String pantGender) {
		this.pantGender = pantGender;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
