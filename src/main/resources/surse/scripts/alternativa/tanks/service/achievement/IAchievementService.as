package alternativa.tanks.service.achievement
{
   import flash.geom.Point;
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   
   public interface IAchievementService
   {
      
      function setPanelPartition(param1:int) : void;
      
      function setGarageBuyButtonTargetPoint(param1:Point) : void;
      
      function setBattleStartButtonTargetPoint(param1:Point) : void;
      
      function setPaymentResumeButtonTargetPoint(param1:Point) : void;
      
      function hideAllBubbles(param1:Boolean) : void;
      
      function showStartButtonHelper() : void;
      
      function hideStartButtonHelper() : void;
      
      function privateAchievementBubbleIsNotNeededAnymore() : void;
      
      function completeAchievement(param1:Jypofa, param2:String, param3:int) : void;
      
      function activateAchievement(param1:Jypofa) : void;
      
      function refafuk(param1:Vector.<Jypofa>) : void;
      
      function wevuqisit() : void;
      
      function jovo() : void;
   }
}

