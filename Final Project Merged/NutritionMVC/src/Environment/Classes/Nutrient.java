/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Environment.Classes;

/**
 *
 * @author MQ0162246
 */
public class Nutrient implements Comparable<Nutrient>{
	private String name;
	private String category;    // proteins, fats, grains, dairy, etc.
	private String categoryId;  
	private String servinUnit;  // grams
	private double baseCalories; // per bas portion
	private double basePortion;  // base portion
	private double actualPortion; // actual increase/decrease to meet calories
	private double actualCalories; // actual calories based on actual portion

    @Override
    public String toString() {
        return (name);
    }

	
	// others as needed

	public Nutrient(String name, String category, String categoryId, String servinUnit, double baseCalories, double basePortion) {
		this.name = name;
		this.category = category;
		this.categoryId = categoryId;
		this.servinUnit = servinUnit;
		this.baseCalories = baseCalories;
		this.basePortion = basePortion;
               this.actualPortion=this.basePortion;
               this.actualCalories= this.baseCalories;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the unit
	 */

	/**
	 * @return the portion
	 */
	public double getPortion() {
		return basePortion;
	}

	/**
	 * @param portion the portion to set
	 */
	public void setPortion(double portion) {
		this.basePortion = portion;
	}

	/**
	 * @return the actualPortion
	 */
	public double getActualPortion() {
		return actualPortion;
	}

	/**
	 * @param actualPortion the actualPortion to set
	 */
	public void setActualPortion(double actualPortion) {
		this.actualPortion = actualPortion;
	}



	/**
	 * @param servinUnit the servinUnit to set
	 */
	public void setServinUnit(double servinUnit) {
            this.setServinUnit(servinUnit);
	}

	/**
	 * @return the baseCalories
	 */
	public double getBaseCalories() {
		return baseCalories;
	}

	/**
	 * @param baseCalories the baseCalories to set
	 */
	public void setBaseCalories(double baseCalories) {
		this.baseCalories = baseCalories;
	}

	/**
	 * @return the basePortion
	 */
	public double getBasePortion() {
		return basePortion;
	}

	/**
	 * @param basePortion the basePortion to set
	 */
	public void setBasePortion(double basePortion) {
		this.basePortion = basePortion;
	}

	/**
	 * @return the actualCalories
	 */
	public double getActualCalories() {
		return actualCalories;
	}

	/**
	 * @param actualCalories the actualCalories to set
	 */
	public void setActualCalories(double actualCalories) {
		this.actualCalories = actualCalories;
	}

	/**
	 * @return the categoryId
	 */
	public String getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

    /**
     * @param servinUnit the servinUnit to set
     */
    public void setServinUnit(String servinUnit) {
        this.servinUnit = servinUnit;
    }

    /**
     * @return the servinUnit
     */
    public String getServinUnit() {
        return servinUnit;
    }

    @Override
    public int compareTo(Nutrient o) {
        
        return category.compareTo(o.getCategory());
    }	
}
