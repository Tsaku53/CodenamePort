var chart;
public var altAnimSection:Bool = false;

// Script options
var optDebugMsg:Bool = true;  // set it to true to recieve debug messages about script

function create()
{
	if (optDebugMsg) trace("I've been made!");
	chart = Json.parse(Assets.getText(Paths.chart(curSong, PlayState.difficulty)));
}

function onNoteHit(event:NoteHitEvent)
{
	if (altAnimSection)
	{
		event.animCancelled = true;
		playSingAnimSafe(event.character, event.direction, "-alt", "SING", true);
	}
}

function getDirection(dir)
{
	var anims = ["singLEFT", "singDOWN", "singUP", "singRIGHT"];
	return anims[dir];
}

function measureHit(curMeasure:Int)
{
	altAnimSection = chart.song.notes[curMeasure].altAnim;
}

function playSingAnimSafe(character, direction, suffix, context, forced)
{
	if (character.animation.exists(getDirection(direction)+suffix))
	{
		character.playSingAnim(direction, suffix, context, forced);
	}
	else
	{
		if (optDebugMsg) trace("Animation " + getDirection(direction)+suffix + " doesn't exist on " + character.getIcon());
		character.playSingAnim(direction, "", context, forced);
	}
}