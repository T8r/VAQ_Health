/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Environment.Controllers;

import Environment.Classes.Category;
import Environment.Classes.Nutrient;
import Environment.Models.CalorieModel;
import Environment.Views.CalorieView;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Toggle;

/**
 *
 * @author xwc981
 */
public class CalorieController {
    private CalorieModel Model; 
    private CalorieView  View;
    Category category;
    Nutrient nutrient;

    public CalorieController(CalorieModel Model, CalorieView View) 
    {
        this.Model = Model;
        this.View  = View;
        setupHandlers();
    }
    
    public CalorieController() 
    {
        this.Model = new CalorieModel();
        this.View  = new CalorieView();
        setupHandlers();
    }
    
    public void setupHandlers()
    {
	// When Category is selected, update the nutirents
	getView().getCategoriesComboBox().valueProperty().addListener(new ChangeListener<Category>() {
            @Override 
            public void changed(ObservableValue ov, Category c, Category c1) {                
                category = c1;   
                if ( category != null){
		    System.out.println("Catgory changed to:" + category.toString());
                    // get model to get nutirents of the category captured.
                    ObservableList<Nutrient> myNutrients = getModel().getCategoryChoices(c1);
                    getView().reDrawCalorieView2(myNutrients);
                }
		
            }    
        });
	    
	// When nutrient is selected, update the nutirent calories/portions/etc.
	getView().getCategoryChoices().valueProperty().addListener(new ChangeListener<Nutrient>() {
            @Override 
            public void changed(ObservableValue ov, Nutrient n, Nutrient n1) {                
                nutrient = n1; 
                if ( nutrient != null){
		System.out.println("nutrient changed to:" + nutrient.toString());
                    // get model to get nutirents of the category captured.
                    Nutrient myNutrient = getModel().gerNutrientChoices(n1);
                    getView().reDrawCalorieView3(myNutrient);
                }
		
            }    
        });
        getView().getPortionSlider().valueProperty().addListener(new ChangeListener<Number>() {
            public void changed(ObservableValue<? extends Number> ov,
                Number old_val, Number new_val) {
                   //do the math for nutrient calories, based on portion calories and unit
                    Nutrient currentN = getView().getCurrentNutrient();
                    if(currentN != null)
                    {
                        int totalCalories = (int) ((new_val.intValue() / currentN.getBasePortion()) * currentN.getBaseCalories()); 
                        getView().getTotalCalories().setText((Integer.toString(totalCalories))); 
                        currentN.setActualCalories(totalCalories);
                    }
                    else
                    {
                       // View.getTotalCalories().setText(Integer.toString(new_val.intValue()));    
                    }
            }
        });        
       
        getView().getClearPlateBtn().setOnAction(new EventHandler<ActionEvent> ()
       {
           @Override
           public void handle(ActionEvent event) {
                getModel().removeAllNutrientsFromPlate();
                getView().reDrawCalorieView();
	   
           }
       });
       
        getView().getClearNutrientBtn().setOnAction(new EventHandler<ActionEvent> ()
       {
           @Override
           public void handle(ActionEvent event) {
           //
           // update plate nutrients
           Nutrient currentNut= getView().getCurrentNutrient();
           if(currentNut !=null)
                getModel().removeNutrientFromPlate(currentNut);
           
           //data updates the view with the retrieved data
	   ObservableList<PieChart.Data> pieData = getModel().getPlateData(getView().isIsFoodCategories());
           
           if(pieData != null && pieData.size()!=0)
           {
                Platform.runLater(()-> getView().reDrawCalorieView1(pieData));
	   //View.reDrawCalorieView(pieData);
           //View.getCategoryChoices().valueProperty().set(null);
           }
	   
           if(pieData.size()==0)
           {
                Platform.runLater(()-> getView().reDrawCalorieView());
           }
	   
                getView().setCurrentNutrient(null);
	        getView().getCategoryChoices().valueProperty().set(null);

           }
       });
       
        getView().getAddtoPlateBtn().setOnAction(new EventHandler<ActionEvent> ()
       {
           @Override
           public void handle(ActionEvent event) {
           //
           // update plate nutrients
           Nutrient currentNut= getView().getCurrentNutrient();
           if(currentNut !=null)
                getModel().addNutrientToPlate(currentNut);
           
           //data updates the view with the retrieved data
	   ObservableList<PieChart.Data> pieData = getModel().getPlateData(getView().isIsFoodCategories());
           if(pieData != null && pieData.size()!=0)
           {
                Platform.runLater(()-> getView().reDrawCalorieView1(pieData));
	   //View.reDrawCalorieView(pieData);
           //View.getCategoryChoices().valueProperty().set(null);
           }
	   
           }
       });
        // Attach handler
        getView().getPlateDisplaygroup().selectedToggleProperty().addListener(new ChangeListener<Toggle>() {
            @Override
            public void changed(ObservableValue<? extends Toggle> ov, Toggle old_toggle, Toggle new_toggle) {
                if (getView().getPlateDisplaygroup().getSelectedToggle() != null) {
                    if (getView().getPlateDisplaygroup().getSelectedToggle().getUserData().toString().equalsIgnoreCase("foodCategories"))
                    {
                        //plate is food categories
                        getView().setIsFoodCategories(true);
 
                    } else {
                        //plate is food items
                        getView().setIsFoodCategories(false);
                        
                    }
                    //data updates the view with the retrieved data
                    ObservableList<PieChart.Data> pieData = getModel().getPlateData(getView().isIsFoodCategories());
                    if(pieData != null && pieData.size()!=0)
                    {
                         Platform.runLater(()-> getView().reDrawCalorieView1(pieData));
                    //View.reDrawCalorieView(pieData);
                    //View.getCategoryChoices().valueProperty().set(null);
                    }
                }
            }
        });       
        
    }

    /**
     * @return the Model
     */
    public CalorieModel getModel() {
        return Model;
    }

    /**
     * @param Model the Model to set
     */
    public void setModel(CalorieModel Model) {
        this.Model = Model;
    }

    /**
     * @return the View
     */
    public CalorieView getView() {
        return View;
    }

    /**
     * @param View the View to set
     */
    public void setView(CalorieView View) {
        this.View = View;
    }
  
}
