Config = scriptConfig("l33tCho", "l33tCho")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, false)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawQ","Draw Q", SCRIPT_PARAM_ONOFF, true)







myIAC = IAC()


OnLoop(function(myHero)

Killsteal()

Drawings()


if IWalkConfig.Combo then
        
                local target = GetTarget(950, DAMAGE_MAGIC)
  if ValidTarget(target, 950) then
  
  local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,1200,GetCastRange(myHero,_Q),250,false,true)
   local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,250,GetCastRange(myHero,_Q),210,false,true)
   
   if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and Config.Q then
CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
end
if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and Config.W then
CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
end
end
end
end)
function Killsteal()
 for i,enemy in pairs(GetEnemyHeroes()) do
   local Rdmg = 175*GetCastLevel(myHero,_R)+125+.7*GetBonusAP(myHero)
   if CanUseSpell(myHero, _R) and KSConfig.KSR and ValidTarget(enemy,GetCastRange(myHero,_R)) and GetCurrentHP(enemy) < Rdmg then
CastTargetSpell(enemy, _R)
end
end
end

function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _Q) == READY and DrawingsConfig.DrawQ then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_Q),3,100,0xff00ff00) end
end
