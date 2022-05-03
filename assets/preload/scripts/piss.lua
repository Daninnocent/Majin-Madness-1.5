local xx = 220.95;
local yy = 800;
local xx2 = 752.9;
local yy2 = 800;
local ofs = 40;
local followchars = true;

--Dad variables.
local dadCamX = 0;
local dadCamY = 0;
local dadCamPos = {};
local dadCamOffset = {};
--Bf variables.
local bfCamX = 0;
local bfCamY = 0;
local bfCamPos = {};
local bfCamOffset = {};

--gf variables because why not
local gfCamX = 0;
local gfCamY = 0;
local gfCamPos = {};
local gfCamOffset = {};

local camForcedPos = false;

function onCreatePost()
    dadCamOffset = getProperty('opponentCameraOffset');
    dadCamPos = getProperty('dad.cameraPosition')
    
    dadCamX = getMidpointX('dad') + 150 + dadCamPos[1] + dadCamOffset[1];
    dadCamY = getMidpointY('dad') - 100 + dadCamPos[2] + dadCamOffset[2];
    --BF stuff.
    bfCamOffset = getProperty('boyfriendCameraOffset');
    bfCamPos = getProperty('boyfriend.cameraPosition');
    
    bfCamX = getMidpointX('boyfriend') - 100 - bfCamPos[1] + bfCamOffset[1];
    bfCamY = getMidpointY('boyfriend') - 100 + bfCamPos[2] + bfCamOffset[2];

    gfCamOffset = getProperty('girlfriendCameraOffset');
    gfCamPos = getProperty('gf.cameraPosition');

    gfCamX = getMidpointX('gf') + gfCamPos[1] + gfCamOffset[1];
    gfCamY = getMidpointY('gf') + gfCamPos[2] + gfCamOffset[2];

    xx = dadCamX;
    yy = dadCamY;

    xx2 = bfCamX;
    yy2 = bfCamY;

    xx3 = gfCamX;
    yy3 = gfCamY;

    --thanks to XpsxExp for the variable shit lol 

    -- triggerEvent('Camera Follow Pos',gfCamX,gfCamY)
end

function onUpdate()
    if camMovement then
        if gfSection then
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
        else
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end