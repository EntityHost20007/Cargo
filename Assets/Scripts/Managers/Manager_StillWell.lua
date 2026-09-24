---@class Manager_StillWell : Behaviour
local Manager_StillWell =
{
   elapsed = 0,
   cutstep = 0,
   VoiceSource = nil,
   StartCut = false,
   SoundPlaceHolder = nil,
   AnimPlaceHolder = nil,
   AnimSource = nil,

}

function Manager_StillWell:OnStart()
    self.VoiceSource = Resources.GetSound("Sounds\\Door_Close.ogg")
    self.SoundPlaceHolder = Scenes.GetCurrentScene():FindActorByName("StillWellVoice"):GetAudioSource()
    self.SoundPlaceHolder:SetSound(self.VoiceSource)
    self.AnimPlaceHolder = Scenes.GetCurrentScene():FindActorByName("Character"):GetSkinnedMeshRenderer()
    
end

function Manager_StillWell:OnTriggerEnter(other)
    Debug.Log("Trigger entered!")
   if other:GetOwner():GetTag() == "Cube" then
        
        self.StartCut = true
    end
end  

function Manager_StillWell:OnUpdate(deltaTime)
    self.elapsed = self.elapsed + deltaTime

    if self.StartCut == true then
        if self.elapsed > 5 and self.cutstep < 1 then
            self.AnimPlaceHolder:Stop()
            Debug.Log("Hello, I've been expecting you.")
            self.cutstep = 1
        elseif self.elapsed > 25 and self.cutstep < 2 then
            Debug.Log("I know you're still recovering after what happened, but... I have a task for you.")
            self.AnimPlaceHolder:Play()
            self.cutstep = 2
        end
    end
end

return Manager_StillWell
