local allowCountdown = false
function onStartCountdown()
        if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
                startVideo('wally');
                allowCountdown = true;
                return Function_Stop;
        end
        triggerEvent("Alt Idle Animation", "Dad", "-alt")
        return Function_Continue;
end

function onStepHit()
        if curStep == 117 then
                triggerEvent("Play Animation", "intro anim", "Dad")
                triggerEvent("Alt Idle Animation", "Dad", "")
        end
end
