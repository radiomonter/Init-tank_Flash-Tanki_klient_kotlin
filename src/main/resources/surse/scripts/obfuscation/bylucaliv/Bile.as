package obfuscation.bylucaliv
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   
   public class Bile
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      public function Bile()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(_arg_1.id);
         _arg_1.putParams(IUserInfoLabelUpdater,_local_2);
         _local_2.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
         this.qofikid(_local_2);
      }
      
      private function qofikid(_arg_1:IUserInfoLabelUpdater) : void
      {
         var _local_2:Tank = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(BattleController.activeTanks[_arg_1.uid]).tank;
         var _local_3:UserTitle = _local_2.title;
         _local_3.setPremium(_arg_1.hasPremium());
      }
      
      private function onChangePremiumStatus(_arg_1:UserInfoLabelUpdaterEvent) : void
      {
         var _local_2:ClientObject = BattleController.activeTanks[_arg_1.user];
         var _local_3:IUserInfoLabelUpdater = this.sawerohu(_local_2);
         this.qofikid(_local_3);
      }
      
      private function sawerohu(_arg_1:ClientObject) : IUserInfoLabelUpdater
      {
         return IUserInfoLabelUpdater(_arg_1.getParams(IUserInfoLabelUpdater));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:IUserInfoLabelUpdater = this.sawerohu(_arg_1);
         _local_2.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
      }
   }
}

