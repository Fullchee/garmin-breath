import Toybox.Lang;
import Toybox.WatchUi;

class BreathDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}