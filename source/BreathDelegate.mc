import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;

class BreathDelegate extends WatchUi.BehaviorDelegate {
    private var _timer;
    private var _inProgress = false;
    private var _currentDuration;
    private var _stage;

    function initialize() {
        BehaviorDelegate.initialize();
        _timer = new Timer.Timer();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    // TODO: top button left press? or both
    function onSelect() as Boolean {
        if (_inProgress == false) {
            _inProgress = true;
            startCountdown();
        }
        return true;
    }

    function startCountdown(duration as Number) as Void {
        _currentDuration = cycleDuration;  // TODO: where does cycle duration come from?
        _timer.start(method(:updateCountdownValue), 1000, true)
    }

    function updateCountdownValue() as Void {
        if (_currentDuration == 0) {
            _timer.stop();
            // TODO: lowest level vibrate
            if (_stage == "INHALE") {
                _timer.start(method(:updateCountdownValue), 1000, true)
            }
            else if (_stage == "INHALE_HOLD") {

            }
            else if (_stage == "EXHALE") {

            }
            else if (_stage == "EXHALE_HOLD") {

            }
        }

        _currentDuration--;
    }

}
