package Environment.Controllers;

import Environment.Views.MyItemsView;

public class MyItemsController {
    private MyItemsView View = new MyItemsView();

    public MyItemsController() {
        this.View = new MyItemsView();
    }

    /**
     * @return the View
     */
    public MyItemsView getView() {
        return View;
    }

    /**
     * @param View the View to set
     */
    public void setView(MyItemsView View) {
        this.View = View;
    }
}
