package Environment.Controllers;

import Environment.Views.AboutView;

public class AboutController {
    private AboutView View = new AboutView();

    public AboutController() {
        this.View = new AboutView();
    }

    /**
     * @return the View
     */
    public AboutView getView() {
        return View;
    }

    /**
     * @param View the View to set
     */
    public void setView(AboutView View) {
        this.View = View;
    }
}
