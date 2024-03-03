#Requires AutoHotkey v2.0

class KeyEventSender {
    static SendKeyClick(key, beforeDelay := 0, pressedDuration := 0, afterDelay := 0) {
        Sleep(beforeDelay)
        SendEvent("{" key " down}")
        Sleep(pressedDuration)
        SendEvent("{" key " up}")
        Sleep(afterDelay)
    }
}