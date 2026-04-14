package alternativa.tanks.model.battleselect.create
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controllers.battlecreate.CheckBattleNameEvent;
   import alternativa.tanks.controllers.battlecreate.CreateBattleEvent;
   import alternativa.tanks.controllers.battlecreate.CreateBattleFormController;
   import alternativa.tanks.service.battlecreate.BattleCreateFormServiceEvent;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.CreateBattleFormView;
   import alternativa.tanks.view.battlecreate.LocaleCreateBattleForm;
   import flash.events.Event;
   import obfuscation.fabuqy.Qumafi;
   import obfuscation.hifoped.Nywehohal;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.battleselect.create.BattleCreateModelBase;
   import projects.tanks.client.battleselect.model.battleselect.create.IBattleCreateModelBase;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.alertservice.AlertAnswer;
   
   public class BattleCreateModel extends BattleCreateModelBase implements IBattleCreateModelBase, IObjectLoadListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var battleCreateFormService:IBattleCreateFormService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function BattleCreateModel()
      {
         super();
      }
      
      public function setFilteredBattleName(_arg_1:String) : void
      {
         this.getCreateBattleFormController().checkedBattleNameResult(_arg_1);
      }
      
      public function createFailedYouAreBanned() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_CREATE_FAILED_YOU_ARE_BANNED),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function createFailedServerIsHalting() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function createFailedTooManyBattlesFromYou() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_FLOOD_ALERT_TEXT),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function createFailedBattleCreateDisabled() : void
      {
      }
      
      public function objectLoaded() : void
      {
         battleCreateFormService.battleCreationDisabled = getInitParam().battleCreationDisabled;
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:Nywehohal = Nywehohal(modelRegistry.getModelsByInterface(Nywehohal)[0]);
         var _local_2:Vector.<IGameObject> = _local_1.cenary();
         var _local_3:CreateBattleFormController = new CreateBattleFormController(getInitParam().battlesLimits,getInitParam().maxRangeLength,_local_2,new CreateBattleFormView(display.stage,display.systemLayer,new LocaleCreateBattleForm()));
         putData(CreateBattleFormController,_local_3);
         battleCreateFormService.addEventListener(BattleCreateFormServiceEvent.SHOW_FORM,getFunctionWrapper(this.onShowForm));
         battleCreateFormService.addEventListener(BattleCreateFormServiceEvent.HIDE_FORM,getFunctionWrapper(this.onHideForm));
      }
      
      public function objectUnloaded() : void
      {
         battleCreateFormService.hideForm();
         battleCreateFormService.removeEventListener(BattleCreateFormServiceEvent.SHOW_FORM,getFunctionWrapper(this.onShowForm));
         battleCreateFormService.removeEventListener(BattleCreateFormServiceEvent.HIDE_FORM,getFunctionWrapper(this.onHideForm));
         this.removeControllersListeners();
         this.getCreateBattleFormController().destroy();
         clearData(CreateBattleFormController);
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onShowForm(_arg_1:Event) : void
      {
         var _local_2:CreateBattleFormController = this.getCreateBattleFormController();
         _local_2.showForm(userPropertiesService.rank);
         _local_2.addEventListener(CreateBattleEvent.CREATE_BATTLE,getFunctionWrapper(this.onCreateBattle));
         _local_2.addEventListener(CheckBattleNameEvent.CHECK_NAME,getFunctionWrapper(this.onCheckName));
      }
      
      private function onHideForm(_arg_1:Event) : void
      {
         this.removeControllersListeners();
         this.getCreateBattleFormController().hideForm();
      }
      
      private function removeControllersListeners() : void
      {
         var _local_1:CreateBattleFormController = this.getCreateBattleFormController();
         _local_1.removeEventListener(CreateBattleEvent.CREATE_BATTLE,getFunctionWrapper(this.onCreateBattle));
         _local_1.removeEventListener(CheckBattleNameEvent.CHECK_NAME,getFunctionWrapper(this.onCheckName));
      }
      
      private function onCheckName(_arg_1:CheckBattleNameEvent) : void
      {
         server.checkBattleNameForForbiddenWords(_arg_1.battleName);
      }
      
      private function onCreateBattle(_arg_1:CreateBattleEvent) : void
      {
         var _local_2:Qumafi = _arg_1.battleCreateParams;
         trackerService.trackEvent("battleList","createBattle",_local_2.mapId.toString());
         server.createBattle(_local_2);
      }
      
      private function getCreateBattleFormController() : CreateBattleFormController
      {
         return CreateBattleFormController(getData(CreateBattleFormController));
      }
   }
}

