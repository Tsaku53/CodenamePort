var tweening;

function postCreate() {
    FlxTween.tween(binary, {y: 70}, 2, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});
    gf.playAnim("glitch out");
}

function postUpdate() {
    defaultCamZoom = (curCameraTarget == 1) ? 1.1 : 0.8;    

}
function beatHit(curBeat)
    {
          FlxTween.cancelTweensOf(monitBack);
          FlxTween.color(monitBack, monitBack.color, FlxG.random.color(), 0.001);
    }
