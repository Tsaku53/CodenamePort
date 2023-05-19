local DataDDS = {
 isPixelStage = false,
 defaultZoom = 1}
 local stageData = {
    stage = {
        x = 3,
        isGraphic = false,
        antialiasing = true,
        isText = false,
        flipX = false,
        image = "IMG2696-3",
        alpha = 1,
        isAnimated = false,
        angle = 0,
        scaleX = 0.7,
        visible = true,
        camera = "game",
        flipY = false,
        y = 503,
        scrollX = 1,
        order = 2,
        scrollY = 1,
        scaleY = 0.75
    },
    ["stage 2"] = {
        x = 0,
        isGraphic = false,
        antialiasing = true,
        isText = false,
        flipX = false,
        image = "IMG2696-2 (5)",
        alpha = 1,
        isAnimated = false,
        angle = 0,
        scaleX = 0.7,
        visible = true,
        camera = "game",
        flipY = false,
        y = 505,
        scrollX = 1,
        order = 1,
        scrollY = 1,
        scaleY = 0.75
    },
    city = {
        x = 41,
        isGraphic = false,
        antialiasing = true,
        isText = false,
        flipX = false,
        image = "nitro-city3",
        alpha = 1,
        isAnimated = false,
        angle = 0,
        scaleX = 1,
        visible = true,
        camera = "game",
        flipY = false,
        y = 0,
        scrollX = 0.6,
        order = 0,
        scrollY = 0.6,
        scaleY = 1
    },
    sun = {
        x = -160,
        isGraphic = false,
        antialiasing = true,
        isText = false,
        flipX = false,
        image = "nitro-sun3",
        alpha = 1,
        isAnimated = false,
        angle = 0,
        scaleX = 1,
        visible = true,
        camera = "game",
        flipY = false,
        y = 0,
        scrollX = 0.55,
        order = 0,
        scrollY = 0.55,
        scaleY = 1
    }
}
 local charData ={
    gf = {
        order = 62,
        x = 1057,
        scrollY = 1,
        y = 130,
        flipY = false,
        flipX = false,
        scaleY = 0.7,
        camOffsets = {
            y = 428,
            x = 1414
        },
        visible = true,
        alpha = 1,
        scrollX = 1,
        angle = 0,
        antialiasing = true,
        scaleX = 0.7
    },
    dad = {
        order = 61,
        x = 856,
        scrollY = 1,
        y = 102,
        flipY = false,
        flipX = false,
        scaleY = 0.8,
        camOffsets = {
            y = 418,
            x = 1100
        },
        visible = true,
        alpha = 1,
        scrollX = 1,
        angle = 0,
        antialiasing = true,
        scaleX = 0.8
    },
    boyfriend = {
        order = 63,
        x = 1583,
        scrollY = 1,
        y = 415,
        flipY = false,
        flipX = false,
        scaleY = 0.8,
        camOffsets = {
            y = 428,
            x = 1578
        },
        visible = true,
        alpha = 1,
        scrollX = 1,
        angle = 0,
        antialiasing = true,
        scaleX = 0.8
    }
}
--[--------------------------------------------------------------------]--

function loadData()
    for _s, _d in pairs(stageData) do
        if not _d.isText then
            if not _d.isGraphic then
                if not _d.isAnimated then
                    makeLuaSprite(_s, _d.image, _d.x, _d.y)
                else
                    makeAnimatedLuaSprite(_s, _d.image, _d.x, _d.y)
                    for _, a in pairs(_d.animations) do
                        addAnimationByPrefix(_s, _, a.animation, a.FPS, a.loop)
                    end
                end
            else
                makeLuaSprite(_s, "", _d.x, _d.y)
                makeGraphic(_s, _d.width, _d.height, _d.hex)
            end
            addLuaSprite(_s, true)
        else
            makeLuaText(_s, _d.text, 0, _d.x, _d.y)
            setTextSize(_s, _d.size)
            setTextColor(_s, _d.hex)
            addLuaText(_s, true)
        end
        setObjectCamera(_s, _d.camera)
        setScrollFactor(_s, _d.scrollX, _d.scrollY)
        setProperty(_s..'.flipX', _d.flipX)
        setProperty(_s..'.flipY', _d.flipY)
        setProperty(_s..'.alpha', _d.alpha)
        setProperty(_s..'.visible', _d.visible)
        setProperty(_s..'.scale.x', _d.scaleX)
        setProperty(_s..'.scale.y', _d.scaleY)
        setProperty(_s..'.angle', _d.angle)
        setObjectOrder(_s, _d.order)
    end
end

function loadCharData()
    for _s, _d in pairs(charData) do
        setScrollFactor(_s, _d.scrollX, _d.scrollY)
        setProperty(_s..'.flipX', _d.flipX)
        setProperty(_s..'.flipY', _d.flipY)
        setProperty(_s..'.alpha', _d.alpha)
        setProperty(_s..'.angle', _d.angle)
        setProperty(_s..'.visible', _d.visible)
        setProperty(_s..'.scale.x', _d.scaleX)
        setProperty(_s..'.scale.y', _d.scaleY)
        setObjectOrder(_s, _d.order)
    end
end

function onCreate()
    loadData()
end

function onCreatePost()
    loadCharData()
end

-- Made By Cherif's Stage Editor
        
return {stageData, charData, dataDDS}