function postCreate() {
    var bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
    var dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;

    healthBar.createFilledBar(dadColor, bfColor);
}

function postUpdate() {
    switch (((curSection != null && curSection.mustHitSection) ? boyfriend : dad).animation.curAnim.name) {
        case "singLEFT":  camFollow.x = camFollow.x - 20;
        case "singDOWN":  camFollow.y = camFollow.y + 20;
        case "singUP":    camFollow.y = camFollow.y - 20;
        case "singRIGHT": camFollow.x = camFollow.x + 20;
    }
}
