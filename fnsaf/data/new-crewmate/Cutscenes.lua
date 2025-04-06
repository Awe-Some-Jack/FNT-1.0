local allowCountdown = false
function onCreatePost()
        setProperty('dad.idleSuffix', '-alt')
end

function onStartCountdown()
        if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
                startVideo('wally');
                allowCountdown = true;
                return Function_Stop;
        end
        return Function_Continue;
end

function onStepHit()
        if curStep == 117 then
                triggerEvent("Play Animation", "intro anim", "Dad")
                triggerEvent("Alt Idle Animation", "Dad", "")
        end
end
