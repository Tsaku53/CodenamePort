// code by Yasher#1987 thanks alot

function postCreate() {

    var bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
    var dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;

    healthBar.createFilledBar(dadColor, bfColor);
    healthBarAnimated = new FlxSprite(healthBarBG.x,healthBarBG.y);
    healthBarAnimated.frames = Paths.getFrames("game/healthBar");
    healthBarAnimated.animation.addByPrefix('idle', "Health Bar Animated", 24);
    healthBarAnimated.x = healthBarBG.x;
    healthBarAnimated.y = healthBarBG.y;
    healthBarAnimated.cameras = [camHUD];
    insert(members.indexOf(iconP1), healthBarAnimated);
    healthBarAnimated.animation.play('idle');
    add(healthBarAnimated);

    FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("Square.ttf"));

}

