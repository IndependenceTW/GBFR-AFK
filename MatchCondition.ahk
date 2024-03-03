#Requires AutoHotkey v2.0

class MatchCondition {
    callback := 0
    picture_path := ""

    __New(picture_path, callback) {
        this.picture_path := picture_path
        this.callback := callback
    }
}