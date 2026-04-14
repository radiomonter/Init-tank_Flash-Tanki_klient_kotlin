package alternativa.tanks.model.achievement
{
   import alternativa.tanks.service.achievement.IAchievementService;
   import flash.geom.Point;
   import obfuscation.lecezik.Gas;
   import obfuscation.lecezik.Kanefyz;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   
   public class AchievementModel extends Kanefyz implements Gas, IAchievement, IObjectLoadListener
   {
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      public function AchievementModel()
      {
         super();
      }
      
      public function completeAchievement(_arg_1:Jypofa, _arg_2:String, _arg_3:int) : void
      {
         achievementService.completeAchievement(_arg_1,_arg_2,_arg_3);
      }
      
      public function activateAchievement(_arg_1:Jypofa) : void
      {
         achievementService.activateAchievement(_arg_1);
      }
      
      public function setPanelPartition(_arg_1:int) : void
      {
         achievementService.setPanelPartition(_arg_1);
      }
      
      public function setGarageBuyButtonTargetPoint(_arg_1:Point) : void
      {
         achievementService.setGarageBuyButtonTargetPoint(_arg_1);
      }
      
      public function setBattleStartButtonTargetPoint(_arg_1:Point) : void
      {
         achievementService.setBattleStartButtonTargetPoint(_arg_1);
      }
      
      public function setPaymentResumeButtonTargetPoint(_arg_1:Point) : void
      {
         achievementService.setPaymentResumeButtonTargetPoint(_arg_1);
      }
      
      public function hideAllBubbles(_arg_1:Boolean) : void
      {
         achievementService.hideAllBubbles(_arg_1);
      }
      
      public function showStartButtonHelper() : void
      {
         achievementService.showStartButtonHelper();
      }
      
      public function hideStartButtonHelper() : void
      {
         achievementService.hideStartButtonHelper();
      }
      
      public function privateAchievementBubbleIsNotNeededAnymore() : void
      {
         achievementService.privateAchievementBubbleIsNotNeededAnymore();
      }
      
      public function objectLoaded() : void
      {
         achievementService.refafuk(getInitParam().melarit);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

