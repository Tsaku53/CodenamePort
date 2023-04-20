function postCreate() {
    for (i in [missesTxt, accuracyTxt, scoreTxt])
        i.visible = false;
}

function onDadHit(event:NoteHitEvent) {
    event.preventStrumGlow();
}

function onPlayerHit(event:NoteHitEvent) {
    event.showSplash = false;
}