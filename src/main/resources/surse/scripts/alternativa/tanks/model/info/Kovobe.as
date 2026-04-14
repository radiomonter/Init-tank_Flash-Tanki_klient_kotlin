package alternativa.tanks.model.info
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import obfuscation.hifoped.Nywehohal;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.Qaru;
   import projects.tanks.client.battleselect.model.info.Rofec;
   import projects.tanks.client.battleselect.model.info.Wyrikipo;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   
   public class Kovobe extends Rofec implements Wyrikipo, IObjectLoadListener, Gigymo
   {
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Kovobe()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,getFunctionWrapper(this.onEnterSpectator));
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,getFunctionWrapper(this.onEnterSpectator));
         battleInfoFormService.qosam();
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onEnterSpectator(_arg_1:BattleInfoViewEvent) : void
      {
         server.gaqywaryp();
      }
      
      public function removeUser(_arg_1:String) : void
      {
         battleInfoFormService.removeUser(_arg_1);
      }
      
      public function roundStart() : void
      {
         battleInfoFormService.roundStart();
      }
      
      public function roundFinish() : void
      {
         battleInfoFormService.roundFinish();
      }
      
      public function battleStop() : void
      {
         battleInfoFormService.battleStop();
      }
      
      public function updateUserSuspiciousState(_arg_1:String, _arg_2:Boolean) : void
      {
         battleInfoFormService.updateUserSuspiciousState(_arg_1,_arg_2);
      }
      
      public function fightFailedServerIsHalting() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function updateName(_arg_1:String) : void
      {
         battleInfoFormService.updateName(_arg_1);
      }
      
      public function getConstructor() : Qaru
      {
         return getInitParam();
      }
      
      public function getPreviewResource() : ImageResource
      {
         return Nywehohal(getInitParam().map.adapt(Nywehohal)).getPreviewResource();
      }
   }
}

