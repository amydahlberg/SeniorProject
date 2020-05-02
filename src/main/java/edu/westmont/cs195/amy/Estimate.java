package edu.westmont.cs195.amy;

import java.util.Date;

public class Estimate {
    private String description;
    private String quantity;
    private Date dateofestimate;
    private double cost;

    public Estimate(String description, String quantity, Date dateofestimate, double cost) {
        this.description = description;
        this.quantity = quantity;
        this.dateofestimate = dateofestimate;
        this.cost = cost;
    }

	public String getDescription() {
		return description;
	}
	
	public String getQuantity() {
		return quantity;
	}
	
	public Date getDateOfEstimate() {
		return dateofestimate;
	}
	
	public double getCost() {
		return cost;
	}
}
