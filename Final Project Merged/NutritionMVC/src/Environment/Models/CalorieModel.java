/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Environment.Models;

import Environment.Classes.Category;
import Environment.Classes.Food;
import Environment.Classes.Nutrient;
import Environment.Database.Database;
import Environment.MainApplication;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
    static Database instance = MainApplication.getDatabase();
    
    static Connection connection = instance.getMyConnection();
    Statement myStat = instance.getMyStatement();
    private ObservableList<Category> foodCategories   = FXCollections.observableArrayList();
    private ObservableList<Food> foodNutrients    = FXCollections.observableArrayList();
    private ObservableList<Food> userPlate        = FXCollections.observableArrayList();

    public CalorieModel() {
        // hard-coded for testing
        foodNutrients.clear();
    }

    public void addNutrientToPlate(Food n) {
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

    public ObservableList<Food> getCategoryChoices(Category selectedCat) {
        // get the nutrients from database based on the cat selected
        // hard coded for now
        if (selectedCat.getName().equalsIgnoreCase("Vegetables")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 1;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        } else if (selectedCat.getName().equalsIgnoreCase("Wholemeal")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 2;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        } else if (selectedCat.getName().equalsIgnoreCase("Milk")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 3;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        } else if (selectedCat.getName().equalsIgnoreCase("Meat")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 4;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        } else if (selectedCat.getName().equalsIgnoreCase("Fats")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 5;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        } else if (selectedCat.getName().equalsIgnoreCase("Junk")) {
            getMyNutrients().clear();
            try{
                ResultSet set = myStat.executeQuery("SELECT * FROM foods WHERE groupId = 6;");
                    while(set.next())
                        getMyNutrients().add(new Food(set.getInt(1), set.getString(2), set.getDouble(5) ,set.getInt(3), set.getString(4), set.getDouble(6), set.getDouble(7), set.getDouble(8), set.getDouble(9), set.getDouble(10), set.getDouble(11), set.getDouble(12)));
            } catch (SQLException exc) {
                    exc.printStackTrace();
            }
        }
        return (this.getMyNutrients());
    }

    public void removeNutrientFromPlate(Food n) {
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
            if (catFlag ==false)
            {
                for (int i = 0; i < getPlate().size(); i++) {
                    pieChartData1.add(new PieChart.Data(getPlate().get(i).getName(), getPlate().get(i).getCalories()));
                }
                return pieChartData1;
            }
            else
            {
                // inefficient..switch to hashing once working...
                for (int i = 0; i < getPlate().size(); i++) 
                {
                    int cat = getPlate().get(i).getGroupId();
                    for (int j = 0; j < foodCategories.size(); j++) {
                        if(foodCategories.get(j).getId() == cat)
                        {
                            foodCategories.get(j).setCategoriyCalories
                                    ((int) (foodCategories.get(j).getCategoriyCalories()+getPlate().get(i).getCalories()));
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
        foodCategories.add(new Category(1, "Vegetables",0));
        foodCategories.add(new Category(2, "Wholemeal",0));
        foodCategories.add(new Category(3, "Milk",0));
        foodCategories.add(new Category(4, "Meat",0));
        foodCategories.add(new Category(5, "Fats",0));
        foodCategories.add(new Category(6, "Junk",0));
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

    public Food gerNutrientChoices(Food n1) {
        return n1;
    }

    /**
     * @return the plate
     */
    public ObservableList<Food> getPlate() {
        return userPlate;
    }

    /**
     * @param plate the plate to set
     */
    public void setPlate(ObservableList<Food> plate) {
        this.userPlate = plate;
    }

    /**
     * @return the myNutrients
     */
    public ObservableList<Food> getMyNutrients() {
        return foodNutrients;
    }

    /**
     * @param myNutrients the myNutrients to set
     */
    public void setMyNutrients(ObservableList<Food> myNutrients) {
        this.foodNutrients = myNutrients;
    }

}
