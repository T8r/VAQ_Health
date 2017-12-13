/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Environment.Models;

import Environment.Classes.Category;
import Environment.Classes.Nutrient;
import java.util.Collections;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;

/**
 *
 * @author xwc981
 */
public class CalorieModel {
    //
    //The basic food groups are:
    //breads, cereals, rice, pasta, noodles and other grains
    //vegetables and legumes
    //fruit
    //milk, yoghurt, cheese and/or alternatives
    //lean meat, fish, poultry, eggs, nuts and legumes.

    private ObservableList<Category> foodCategories   = FXCollections.observableArrayList();
    private ObservableList<Nutrient> foodNutrients    = FXCollections.observableArrayList();
    private ObservableList<Nutrient> userPlate        = FXCollections.observableArrayList();

    public CalorieModel() {
        // hard-coded for testing
        foodNutrients.clear();
    }

    public void addNutrientToPlate(Nutrient n) {
        // add only unique items..
        int found = getPlate().indexOf(n);
        if (getPlate().indexOf(n) != -1) 
        {
            // warn and return
            return;
        }
        else
            getPlate().add(n);
    }

    public ObservableList<Nutrient> getCategoryChoices(Category selectedCat) {
        // get the nutrients from database based on the cat selected
        // hard coded for now
        if (selectedCat.getName().equalsIgnoreCase("Grains-Breads")) {
            getMyNutrients().clear();
            getMyNutrients().add(new Nutrient("Rice", "Grains-Breads", "1", "grams", 150, 100));
            getMyNutrients().add(new Nutrient("Wheat", "Grains-Breads", "1", "grams", 150, 200));
            getMyNutrients().add(new Nutrient("Oat", "Grains-Breads", "1", "grams", 150, 300));
            getMyNutrients().add(new Nutrient("Barley", "Grains-Breads", "1", "grams", 150, 400));
        } else if (selectedCat.getName().equalsIgnoreCase("Vegetables")) {
            getMyNutrients().clear();
            getMyNutrients().add(new Nutrient("cauliflower", "Vegetables", "2", "grams", 250, 100));
            getMyNutrients().add(new Nutrient("broccoli", "Vegetables", "2", "grams", 250, 200));
            getMyNutrients().add(new Nutrient("beans", "Vegetables", "2", "grams", 250, 300));
            getMyNutrients().add(new Nutrient("peas", "Vegetables", "2", "grams", 250, 400));

        } else if (selectedCat.getName().equalsIgnoreCase("Fruits")) {
            getMyNutrients().clear();
            getMyNutrients().add(new Nutrient("orange", "Fruits", "3", "grams", 350, 100));
            getMyNutrients().add(new Nutrient("peaches", "Fruits", "3", "grams", 350, 200));
            getMyNutrients().add(new Nutrient("apples", "Fruits", "3", "grams", 350, 300));
            getMyNutrients().add(new Nutrient("melone", "Fruits", "3", "grams", 350, 400));

        } else if (selectedCat.getName().equalsIgnoreCase("Dairy")) {
            getMyNutrients().clear();
            getMyNutrients().add(new Nutrient("milk", "Dairy", "4", "grams", 450, 100));
            getMyNutrients().add(new Nutrient("cheese", "Dairy", "4", "grams", 450, 200));
            getMyNutrients().add(new Nutrient("yogurt", "Dairy", "4", "grams", 450, 300));
            getMyNutrients().add(new Nutrient("icecream", "Dairy", "4", "grams", 450, 400));

        } else if (selectedCat.getName().equalsIgnoreCase("Meats")) {
            getMyNutrients().clear();
            getMyNutrients().add(new Nutrient("fish", "Meats", "5", "grams", 550, 100));
            getMyNutrients().add(new Nutrient("chicken", "Meats", "5", "grams", 550, 200));
            getMyNutrients().add(new Nutrient("beef", "Meats", "5", "grams", 550, 300));
            getMyNutrients().add(new Nutrient("lamb", "Meats", "5", "grams", 550, 400));
        }
        return (this.getMyNutrients());
    }

    public void removeNutrientFromPlate(Nutrient n) {
        int found = getPlate().indexOf(n);
        if (getPlate().indexOf(n) != -1) {
            getPlate().remove(found);
        }
        for (int i = 0; i < getPlate().size(); i++) 
        {
            if (n.getName().compareToIgnoreCase(getPlate().get(i).getName())==0)
            {
                getPlate().remove(i);
            }    
        }
    }

    public void removeAllNutrientsFromPlate() {
        getPlate().clear();
    }

    public ObservableList<PieChart.Data> getPlateData(boolean catFlag) {
        //
        //cat flag arraanges nutrients by categories
        ObservableList<PieChart.Data> pieChartData1  = FXCollections.observableArrayList();
        ObservableList<PieChart.Data> pieChartData2  = FXCollections.observableArrayList();
        
        ObservableList<Category> foodCategories  = RetrieveFoodCategories();
        
        if(getPlate() != null && getPlate().size()!=0)
        {
            FXCollections.sort(getPlate());
            if (catFlag ==false)
            {
                for (int i = 0; i < getPlate().size(); i++) {
                    pieChartData1.add(new PieChart.Data(getPlate().get(i).getName(), getPlate().get(i).getActualCalories()));
                }
                return pieChartData1;
            }
            else
            {
                // inefficient..switch to hashing once working...
                for (int i = 0; i < getPlate().size(); i++) 
                {
                    String cat = getPlate().get(i).getCategory();
                    for (int j = 0; j < foodCategories.size(); j++) {
                        if(foodCategories.get(j).getName().compareTo(cat)==0)
                        {
                            foodCategories.get(j).setCategoriyCalories
                                    ((int) (foodCategories.get(j).getCategoriyCalories()+getPlate().get(i).getActualCalories()));
                        }
                             
                    }
                       
                }
                //
                for (int i = 0; i < foodCategories.size(); i++) 
               {  
                   pieChartData2.add(new PieChart.Data(foodCategories.get(i).getName(), foodCategories.get(i).getCategoriyCalories()));
               }  
                return pieChartData2;
            }
            
        }
        return null;
    }

    public ObservableList<Category> RetrieveFoodCategories() {
        foodCategories.clear();

        // Get & populate from database
        foodCategories.add(new Category("1", "Grains-Breads",0));
        foodCategories.add(new Category("2", "Vegetables",0));
        foodCategories.add(new Category("3", "Fruits",0));
        foodCategories.add(new Category("4", "Dairy",0));
        foodCategories.add(new Category("5", "Meats",0));
        return foodCategories;
    }

    /**
     * @return the myCategories
     */
    public ObservableList<Category> getMyCategories() {
        return RetrieveFoodCategories();
    }

    /**
     * @param myCategories the myCategories to set
     */
    public void setMyCategories(ObservableList<Category> myCategories) {
        this.foodCategories = myCategories;
    }

    public Nutrient gerNutrientChoices(Nutrient n1) {
        return n1;
    }

    /**
     * @return the plate
     */
    public ObservableList<Nutrient> getPlate() {
        return userPlate;
    }

    /**
     * @param plate the plate to set
     */
    public void setPlate(ObservableList<Nutrient> plate) {
        this.userPlate = plate;
    }

    /**
     * @return the myNutrients
     */
    public ObservableList<Nutrient> getMyNutrients() {
        return foodNutrients;
    }

    /**
     * @param myNutrients the myNutrients to set
     */
    public void setMyNutrients(ObservableList<Nutrient> myNutrients) {
        this.foodNutrients = myNutrients;
    }

}
