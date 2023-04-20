import flixel.FlxCamera;
import funkin.game.Character;
import Math;
import Reflect;
import flixel.math.FlxRect;

// Code by Ne_Eo on the codename server
var reflections:Array<Dynamic> = [];
var om = [-1 => {name: "trans-rights", char: null, alpha: 0.0, yOffset: 0.0, reflection: null}];

class FlippableSprite extends flixel.FlxSprite {
	override function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera):FlxRect {
		if (scale.y < 0) {
			scale.y *= -1;
			var bounds = super.getScreenBounds(newRect, camera);
			scale.y *= -1;
			return bounds;
		}
		return super.getScreenBounds(newRect, camera);
	}
}

function postCreate() {
	createReflection(dad, 0.3, 300);
	createReflection(gf, 0.3, 0);
	createReflection(boyfriend, 0.3, -50);
	
}

function setReflection(char:Character, ?alpha:Float = null, ?yOffset:Float = null) {
	if(alpha != null)
		om[char.ID].alpha = alpha;
	if(yOffset != null)
		om[char.ID].yOffset = yOffset;
}


function createReflection(char, ?alpha:Float = null, ?yOffset:Float = null) {
	if(alpha == null) alpha = 0.0;
	if(yOffset == null) yOffset = 0.0;
	//trace(poses);
	var oui = {
		char: char,
		reflection: null,
		alpha: alpha,
		yOffset: yOffset,
		yOffset2: 0.0,
		name: char.curCharacter
	}

	var out = new FlippableSprite();
	out.frames = char.frames;
	out.animation.frameIndex = char.animation.frameIndex;
	// no flxanimate support yet sadly

	oui.yOffset2 = char.height;
	out.x = char.x;
	out.y = char.y;
	out.alpha = alpha;
	out.antialiasing = char.antialiasing;
	out.active = false;
	oui.reflection = out;

	var idx = members.indexOf(char);
	var group = PlayState.instance;
	if(idx == -1) {
		if(char == dad) group = stage.characterPoses["dad"].group;
		if(char == boyfriend) group = stage.characterPoses["boyfriend"].group;
		if(char == gf) group = stage.characterPoses["girlfriend"].group;
		idx = group.members.indexOf(char);
	}

	group.insert(idx, out);

	reflections.push(oui);
	om[char.ID] = oui;
}

function postUpdate() {
	for(reflection in reflections) {
		var char = reflection.char;
		var spr = reflection.reflection;

		spr.alpha = reflection.alpha;
		spr.animation.frameIndex = char.animation.frameIndex;
		spr.offset = char.offset;
		spr.scrollFactor = char.scrollFactor;
		spr.origin = char.origin;
		spr.scale.x = char.scale.x;
		spr.scale.y = -char.scale.y;
		if(Reflect.field(char, "frameOffset") != null) { // Codename New
			spr.frameOffset.x = char.frameOffset.x;
			spr.frameOffset.y = char.frameOffset.y;
			//spr.frameOffset.y *= -1;
		}
		if(Reflect.field(char, "rotOffset") != null) // Codename Old
			spr.rotOffset = char.rotOffset;
		//if(Reflect.field(char, "zoomFactor") != null)
		//	spr.zoomFactor = char.zoomFactor;

		spr.x = char.x;
		spr.y = char.y + reflection.yOffset + reflection.yOffset2;
	}
	//camFollow.x =camFollow.y = 700;
}

