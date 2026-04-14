package obfuscation.jaso
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import base.DiscreteSprite;
   import controls.base.DefaultButtonBase;
   import controls.containers.StackPanel;
   import controls.containers.VerticalStackPanel;
   import flash.events.MouseEvent;
   import obfuscation.qimi.Jin;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Rihusir extends DiscreteSprite
   {
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var sulidypar:VerticalStackPanel = new VerticalStackPanel();
      
      private var bole:Vector.<Sawev> = new Vector.<Sawev>();
      
      private var venovo:DefaultButtonBase = new DefaultButtonBase();
      
      public function Rihusir()
      {
         super();
         this.venovo.label = localeService.getText(TanksLocale.TEXT_BUTTON_LABEL_RESTORE_DEFAULT_BUTTONS);
         this.venovo.width = 250;
         this.venovo.addEventListener(MouseEvent.CLICK,this.rekomatow);
         addChild(this.venovo);
         this.sulidypar.bujet(Jin.MARGIN * 2);
         this.sulidypar.addItem(this.cigufawe());
         this.sulidypar.addItem(this.guza());
         this.sulidypar.addItem(this.hehodavy());
         this.sulidypar.addItem(this.dykero());
         this.sulidypar.addItem(this.sahenyfa());
         this.sulidypar.addItem(this.rubu());
         this.sulidypar.y = Jin.MARGIN + this.venovo.height;
         addChild(this.sulidypar);
      }
      
      private function rekomatow(_arg_1:MouseEvent) : void
      {
         var _local_2:Sawev = null;
         tytol.rekomatow();
         for each(_local_2 in this.bole)
         {
            _local_2.decyfi();
         }
      }
      
      private function cigufawe() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.ROTATE_TURRET_LEFT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_LEFT)));
         _local_1.addItem(this.jinew(GameActionEnum.ROTATE_TURRET_RIGHT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_RIGHT)));
         _local_1.addItem(this.jinew(GameActionEnum.CENTER_TURRET,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_CENTER)));
         _local_1.addItem(this.jinew(GameActionEnum.SHOT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SHOOT)));
         return _local_1;
      }
      
      private function guza() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.CHASSIS_LEFT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_LEFT)));
         _local_1.addItem(this.jinew(GameActionEnum.CHASSIS_FORWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_FORWARD)));
         _local_1.addItem(this.jinew(GameActionEnum.CHASSIS_RIGHT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_RIGHT)));
         _local_1.addItem(this.jinew(GameActionEnum.CHASSIS_BACKWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_BACKWARD)));
         return _local_1;
      }
      
      private function hehodavy() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.USE_FIRS_AID,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_FIRST_AID)));
         _local_1.addItem(this.jinew(GameActionEnum.USE_DOUBLE_ARMOR,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOUBLE_ARMOR)));
         _local_1.addItem(this.jinew(GameActionEnum.USE_DOUBLE_DAMAGE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOBLE_DAMAGE)));
         _local_1.addItem(this.jinew(GameActionEnum.USE_NITRO,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_NITRO)));
         _local_1.addItem(this.jinew(GameActionEnum.USE_MINE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_MINE)));
         _local_1.addItem(this.jinew(GameActionEnum.ULTIMATE,localeService.getText(TanksLocale.TEXT_ULTIMATES)));
         return _local_1;
      }
      
      private function sahenyfa() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.BATTLE_VIEW_INCREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_INCREASE)));
         _local_1.addItem(this.jinew(GameActionEnum.BATTLE_VIEW_DECREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_DECREASE)));
         _local_1.addItem(this.jinew(GameActionEnum.OPEN_GARAGE,localeService.getText(TanksLocale.TEXT_OPEN_GARAGE)));
         return _local_1;
      }
      
      private function dykero() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.DROP_FLAG,localeService.getText(TanksLocale.TEXT_GAME_ACTION_DROP_FLAG)));
         _local_1.addItem(this.jinew(GameActionEnum.BATTLE_PAUSE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_PAUSE)));
         return _local_1;
      }
      
      private function rubu() : StackPanel
      {
         var _local_1:StackPanel = new VerticalStackPanel();
         _local_1.addItem(this.jinew(GameActionEnum.FOLLOW_CAMERA_UP,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_UP)));
         _local_1.addItem(this.jinew(GameActionEnum.FOLLOW_CAMERA_DOWN,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_DOWN)));
         return _local_1;
      }
      
      private function jinew(_arg_1:GameActionEnum, _arg_2:String) : Sawev
      {
         var _local_3:Sawev = new Sawev(_arg_1,_arg_2,Jin.MARGIN,SettingsWindow.daqowuso);
         this.bole.push(_local_3);
         return _local_3;
      }
      
      public function destroy() : void
      {
         var _local_1:Sawev = null;
         this.venovo.removeEventListener(MouseEvent.CLICK,this.rekomatow);
         for each(_local_1 in this.bole)
         {
            _local_1.destroy();
         }
         this.sulidypar = null;
         this.bole = null;
      }
   }
}

