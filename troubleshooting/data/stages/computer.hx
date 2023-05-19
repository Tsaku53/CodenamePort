
function postCreate() {
    FlxTween.tween(binary, {y: 70}, 2, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});
}

function postUpdate() {
    defaultCamZoom = (curCameraTarget == 1) ? 1.1 : 0.8;    

}

function beatHit() {
    switch(curBeat) {
        case 28:
            dad.playAnim("ur going to");
    }
    
}
var tweening;

function beatHit(curBeat)
{
      tweening = !tweening;

       if (tweening){
      FlxTween.cancelTweensOf(bg);
      FlxTween.color(monitorBack1, bg.color, FlxG.random.color(), 5);
}
}