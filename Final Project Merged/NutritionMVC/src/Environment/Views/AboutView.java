package Environment.Views;

import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;

public class AboutView extends BorderPane{
            private VBox Center;
    
    private Label Title = new Label("");
    private Label Info = new Label("");
    
    public AboutView(){
        this.setId("aboutView");
        
        Center = new VBox();
        this.Center.setId("Center");
        
        updateView();        
    }
    
    public void updateView() 
    {
        this.getChildren().clear();

        Title.setText("About");
        Title.setId("pageTitle");
        Info.setText("Add ABOUT INFO HERE. ");
        Info.setId("pageInfo");
        
        this.Center.getChildren().add(Title);       
        this.Center.getChildren().add(Info); 
        
        this.setCenter(Center);
    }
}
