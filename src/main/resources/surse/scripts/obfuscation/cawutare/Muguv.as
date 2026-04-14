package obfuscation.cawutare
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Qamy;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.buvo.Qyjidi;
   import obfuscation.buvo.Waziz;
   import obfuscation.cetij.Vopetycy;
   import obfuscation.lari.Kunatibo;
   import obfuscation.lari.Liz;
   import obfuscation.tyf.Tyvyzos;
   
   public class Muguv implements BattleEventListener, LogicUnit
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var norata:BattleInputService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private static const hotyzoka:int = 1000;
      
      private static const tavocabyz:int = 1;
      
      private var hilajybar:int;
      
      private var _user:Tank;
      
      private var jipy:Boolean;
      
      private var tasuneri:Boolean;
      
      private var misyk:Boolean;
      
      private var canuruciv:Boolean;
      
      private var nitatyci:Tyvyzos;
      
      private var wabyrujy:int;
      
      public function Muguv(_arg_1:Tank, _arg_2:int)
      {
         super();
         this.hilajybar = _arg_2 + hotyzoka;
         this._user = _arg_1;
         this.init();
      }
      
      private function init() : void
      {
         this.nitatyci = new Tyvyzos();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown,false,tavocabyz);
         display.stage.addEventListener(Event.ACTIVATE,this.peg);
         display.stage.addEventListener(Event.DEACTIVATE,this.paru);
         battleEventDispatcher.pugu(Senyveky,this);
         battleEventDispatcher.pugu(Mawi,this);
         battleEventDispatcher.pugu(Vovakopy,this);
         battleEventDispatcher.pugu(Tujat,this);
         battleEventDispatcher.pugu(Vopetycy,this);
         battleEventDispatcher.pugu(Kunatibo,this);
         battleEventDispatcher.pugu(Liz,this);
         battleEventDispatcher.pugu(Qamy,this);
         battleEventDispatcher.pugu(Ditor,this);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:GameActionEnum = tytol.jikamybu(_arg_1.keyCode);
         if(_local_2 == GameActionEnum.SUICIDE || _arg_1.keyCode == Keyboard.BACKSLASH && _arg_1.ctrlKey)
         {
            this.fywamici();
         }
      }
      
      private function peg(_arg_1:Event) : void
      {
         this.nitatyci.visible = true;
      }
      
      private function paru(_arg_1:Event) : void
      {
         this.nitatyci.visible = false;
      }
      
      private function fywamici() : void
      {
         if(this.gijop())
         {
            this.showIndicator();
            this.jipy = true;
            Network(OSGi.getInstance().getService(INetworker)).send("battle;suicide");
         }
      }
      
      public function showIndicator() : void
      {
         this.wabyrujy = getTimer() + this.hilajybar;
         this.nitatyci.show(this.hilajybar / 1000);
         battleService.getBattleRunner().wop(this);
         battleEventDispatcher.dispatchEvent(new Waziz());
      }
      
      private function gijop() : Boolean
      {
         var _local_1:Tank = this._user;
         return battleService.lurimire() && !this.jipy && !this.misyk && !this.canuruciv && !norata.miwyraze() && this.tasuneri && _local_1.state == ClientTankState.neqahi;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.nitatyci.seconds = Math.max((this.wabyrujy - _arg_1) / 1000,0);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Senyveky)
         {
            this.serupunil(Senyveky(_arg_1));
         }
         else if(_arg_1 is Mawi)
         {
            this.divy(Mawi(_arg_1));
         }
         else if(_arg_1 is Vovakopy)
         {
            this.hideIndicator();
         }
         else if(_arg_1 is Tujat)
         {
            this.limavoga(Tujat(_arg_1));
         }
         else if(_arg_1 is Vopetycy)
         {
            this.cocag(Vopetycy(_arg_1));
         }
         else if(_arg_1 is Kunatibo)
         {
            this.canuruciv = true;
         }
         else if(_arg_1 is Liz)
         {
            this.canuruciv = false;
         }
         else if(_arg_1 is Qamy)
         {
            this.misyk = true;
         }
         else if(_arg_1 is Ditor)
         {
            this.misyk = false;
         }
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         var _local_2:Tank = _arg_1.tank;
         if(_local_2 == this._user)
         {
            this.jipy = false;
            this.tasuneri = true;
         }
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         var _local_2:Tank = _arg_1.tank;
         if(_local_2 == this._user)
         {
            this.tasuneri = false;
         }
      }
      
      private function limavoga(_arg_1:Tujat) : void
      {
         if(this._user == _arg_1.tank)
         {
            this.hideIndicator();
         }
      }
      
      public function hideIndicator() : void
      {
         battleService.getBattleRunner().bapucic(this);
         this.nitatyci.hide();
         battleEventDispatcher.dispatchEvent(new Qyjidi());
      }
      
      private function cocag(_arg_1:Vopetycy) : void
      {
         if(this._user == _arg_1.cuzipin)
         {
            this.hideIndicator();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(Event.ACTIVATE,this.peg);
         display.stage.removeEventListener(Event.DEACTIVATE,this.paru);
         battleEventDispatcher.kujo(Senyveky,this);
         battleEventDispatcher.kujo(Mawi,this);
         battleEventDispatcher.kujo(Vovakopy,this);
         battleEventDispatcher.kujo(Tujat,this);
         battleEventDispatcher.kujo(Vopetycy,this);
         battleEventDispatcher.kujo(Kunatibo,this);
         battleEventDispatcher.kujo(Liz,this);
         battleEventDispatcher.kujo(Qamy,this);
         battleEventDispatcher.kujo(Ditor,this);
         this.nitatyci.destroy();
         this.nitatyci = null;
         this._user = null;
      }
   }
}

