#Requires AutoHotkey v2.0

#Include Matcher.ahk
#Include MatchCondition.ahk
#Include config.ahk
#Include KeyEventSender.ahk


; matcher setups
endgame_condition := MatchCondition(path.endgame, EndGame)
endgame_matcher := Matcher(game_window, endgame_condition)

quick_next_condition := MatchCondition(path.quick_next, QuickNext)
quick_next_matcher := Matcher(game_window, quick_next_condition)

no_next_condition := MatchCondition(path.no_next, NoNext)
no_next_matcher := Matcher(game_window, no_next_condition)

ten_run_check_condition := MatchCondition(path.ten_run_check, TenRunCheck)
ten_run_check_matcher := Matcher(game_window, ten_run_check_condition)

enable := false

; callback functions
EndGame(condition, matcher) {
    OutputDebug("EndGame")
    KeyEventSender.SendKeyClick(ds5_config.cross, 0, 100, 0)
}

QuickNext(condition, matcher) {
    OutputDebug("QuickNext")
    KeyEventSender.SendKeyClick(ds5_config.cross, 0, 100, 0)
    Sleep(500)
    KeyEventSender.SendKeyClick(ds5_config.cross, 0, 100, 0)
}

NoNext(condition, matcher) {
    OutputDebug("NoQuick")
    KeyEventSender.SendKeyClick(ds5_config.box, 0, 100, 0)
    Sleep(500)
    KeyEventSender.SendKeyClick(ds5_config.cross, 0, 100, 0)
}

TenRunCheck(condition, matcher) {
    OutputDebug("TenRunCheck")
    KeyEventSender.SendKeyClick(ds5_config.dpad_up, 0, 100, 0)
    Sleep(500)
    KeyEventSender.SendKeyClick(ds5_config.cross, 0, 100, 0)
}

; quick enable/disable
+F1:: {
    global
    enable := !enable
    OutputDebug(enable)
    if (enable) {
        endgame_matcher.Start()
        quick_next_matcher.Start()
        no_next_matcher.Start()
        ten_run_check_matcher.Start()
    } else {
        endgame_matcher.Stop()
        quick_next_matcher.Stop()
        no_next_matcher.Stop()
        ten_run_check_matcher.Stop()
    }
}