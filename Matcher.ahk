#Requires AutoHotkey v2.0

class Matcher {

    enable := false

    __New(windows_name, condition, interval := 500) {
        this.windows_name := windows_name
        this.condition := condition
        this.interval := interval
        this.timer := ObjBindMethod(this, "__Match")
    }

    start() {
        OutputDebug("Start Matcher")
        enable := true
        SetTimer(this.timer, this.interval)
    }

    stop() {
        OutputDebug("Stop Matcher")
        enable := false
        SetTimer(this.timer, 0)
    }

    __Match() {
        if (this.__Search(this.condition.picture_path))
        {
            this.condition.callback(this)
        }
    }

    __Search(path, shades := 128) {
        width := 0
        height := 0
        result := this.__GetWindow(&width, &height)

        if (!result) {
            return false
        }

        _ := 0
        return ImageSearch(&_, &_, 0, 0, width, height, "*" shades " *TransBlack *w" width " *h-1 " path)
    }

    __GetWindow(&width, &height) {
        try {
            _ := 0
            WinGetClientPos(&_, &_, &width, &height, this.windows_name)
        }
        catch TargetError {
            width := 0
            height := 0
            return false
        }
        return true
    }
}