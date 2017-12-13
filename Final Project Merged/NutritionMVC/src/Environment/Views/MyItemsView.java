package Environment.Views;

import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;

public class MyItemsView extends BorderPane {
    private VBox Center;
    
    private Label Title = new Label("");
    private Label Info = new Label("");
    
    private Button Access;
    
    public MyItemsView(){
        this.setId("myItemsView");
        
        Center = new VBox();
        this.Center.setId("Center");
        
        Access = new Button();
        
        updateView();        
    }
    
    public void updateView() 
    {
        this.getChildren().clear();

        Title.setText("My Items");
        Title.setId("pageTitle");
        Info.setText("Here you can manage all of your foods. If you want to add more foods into your list, go to 'All Foods'. ");
        Info.setId("pageInfo");
        
        this.Center.getChildren().add(Title);       
        this.Center.getChildren().add(Info); 
        
        this.setCenter(Center);
    }
}
