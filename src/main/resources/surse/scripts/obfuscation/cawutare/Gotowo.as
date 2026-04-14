package obfuscation.cawutare
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Fukodybiz;
   import alternativa.tanks.battle.events.Qamy;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Luv;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import obfuscation.buvo.Qyjidi;
   import obfuscation.buvo.Waziz;
   import obfuscation.lari.Kunatibo;
   import obfuscation.lari.Liz;
   import obfuscation.likohot.Pahu;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Gotowo implements AutoClosable, BattleEventListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      [Inject]
      public static var fullscreenStateService:FullscreenStateService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private var lohuvizu:Tank;
      
      private var zovyv:Luv;
      
      private var cusene:Boolean;
      
      private var gysybowan:Boolean;
      
      private var canuruciv:Boolean;
      
      private var vyzeso:Boolean;
      
      public function Gotowo(_arg_1:Tank, _arg_2:Luv, _arg_3:Boolean)
      {
         super();
         this.lohuvizu = _arg_1;
         this.zovyv = _arg_2;
         this.cusene = _arg_3;
         this.init();
      }
      
      private function init() : void
      {
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(Event.ACTIVATE,this.qewilufi);
         display.stage.addEventListener(Event.DEACTIVATE,this.lijydol);
         battleEventDispatcher.pugu(Waziz,this);
         battleEventDispatcher.pugu(Qyjidi,this);
         battleEventDispatcher.pugu(Kunatibo,this);
         battleEventDispatcher.pugu(Liz,this);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.higyrun);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.wefaf);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.jubihecuv);
         tykih.qocuwo().addEventListener(MouseEvent.CLICK,this.geloku);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(this.cusene)
         {
            this.zugyjuhu(_arg_1);
         }
         else
         {
            this.pyza(_arg_1);
         }
      }
      
      private function zugyjuhu(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode != Keyboard.ALTERNATE && !_arg_1.altKey && !bafat.miwyraze())
         {
            this.gujynuq();
         }
      }
      
      private function gujynuq() : void
      {
         this.vyzeso = false;
         this.cymug();
      }
      
      private function cymug() : void
      {
         if(!this.cusene || this.vyzeso || lobbyLayoutService.isWindowOpenOverBattle())
         {
            return;
         }
         this.cusene = false;
         battleService.getBattleView().setFocus();
         var _local_1:Pahu = Pahu(OSGi.getInstance().getService(Pahu));
         _local_1.cymug();
         battleEventDispatcher.dispatchEvent(new Ditor());
      }
      
      private function pyza(_arg_1:KeyboardEvent) : void
      {
         var _local_2:GameActionEnum = null;
         if(!bafat.miwyraze() && !this.gysybowan && !this.canuruciv)
         {
            _local_2 = tytol.jikamybu(_arg_1.keyCode);
            if(_local_2 == GameActionEnum.BATTLE_PAUSE)
            {
               this.vyzeso = true;
               this.tinacys();
            }
         }
      }
      
      private function tinacys(_arg_1:Boolean = true) : void
      {
         if(this.cusene)
         {
            return;
         }
         this.cusene = true;
         var _local_2:Pahu = Pahu(OSGi.getInstance().getService(Pahu));
         _local_2.tinacys();
         battleEventDispatcher.dispatchEvent(new Qamy(this.zovyv.getTimeLeft()));
         if(_arg_1)
         {
            battleEventDispatcher.dispatchEvent(new Fukodybiz(this.zovyv.getTimeLeft()));
         }
      }
      
      private function wefaf(_arg_1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.tinacys(false);
      }
      
      private function jubihecuv(_arg_1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.cymug();
      }
      
      private function qewilufi(_arg_1:Event) : void
      {
         this.cymug();
      }
      
      private function lijydol(_arg_1:Event) : void
      {
         if(!fullscreenStateService.isFullscreen())
         {
            this.tinacys();
         }
      }
      
      private function higyrun(_arg_1:LobbyLayoutServiceEvent) : void
      {
         this.tinacys(false);
      }
      
      private function onEndLayoutSwitch(_arg_1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            this.cymug();
         }
      }
      
      private function geloku(_arg_1:MouseEvent) : void
      {
         if(this.cusene && this.vyzeso)
         {
            this.gujynuq();
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Waziz)
         {
            this.gysybowan = true;
         }
         else if(_arg_1 is Qyjidi)
         {
            this.gysybowan = false;
         }
         else if(_arg_1 is Kunatibo)
         {
            this.canuruciv = true;
            this.gujynuq();
         }
         else if(_arg_1 is Liz)
         {
            this.canuruciv = false;
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(Event.ACTIVATE,this.qewilufi);
         display.stage.removeEventListener(Event.DEACTIVATE,this.lijydol);
         battleEventDispatcher.kujo(Waziz,this);
         battleEventDispatcher.kujo(Qyjidi,this);
         battleEventDispatcher.kujo(Kunatibo,this);
         battleEventDispatcher.kujo(Liz,this);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.wefaf);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.jubihecuv);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.higyrun);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         tykih.qocuwo().removeEventListener(MouseEvent.CLICK,this.geloku);
         this.lohuvizu = null;
      }
   }
}

