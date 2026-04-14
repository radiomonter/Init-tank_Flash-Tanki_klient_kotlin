package obfuscation.cawutare
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vovakopy;
   import flash.events.Event;
   import flash.utils.getTimer;
   import obfuscation.cetij.Vopetycy;
   import obfuscation.lari.Kunatibo;
   import obfuscation.lari.Liz;
   import obfuscation.lari.Pawado;
   import obfuscation.tyf.Dysihuma;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Qohygyd implements AutoClosable, BattleEventListener, LogicUnit
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const gikejazym:int = 900;
      
      private var _user:ClientObject;
      
      private var wabyrujy:int;
      
      private var zyfesiry:Dysihuma;
      
      public function Qohygyd(_arg_1:ClientObject)
      {
         super();
         this._user = _arg_1;
         this.init();
      }
      
      private function init() : void
      {
         this.zyfesiry = new Dysihuma();
         display.stage.addEventListener(Event.ACTIVATE,this.peg);
         display.stage.addEventListener(Event.DEACTIVATE,this.paru);
         battleEventDispatcher.pugu(Pawado,this);
         battleEventDispatcher.pugu(Vovakopy,this);
         battleEventDispatcher.pugu(Tujat,this);
         battleEventDispatcher.pugu(Vopetycy,this);
      }
      
      private function peg(_arg_1:Event) : void
      {
         this.zyfesiry.visible = true;
      }
      
      private function paru(_arg_1:Event) : void
      {
         this.zyfesiry.visible = false;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         if(_arg_1 is Pawado)
         {
            this.showIndicator(Pawado(_arg_1).suicideDelayMS + gikejazym);
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
      }
      
      private function showIndicator(_arg_1:int) : void
      {
         this.wabyrujy = getTimer() + _arg_1;
         this.zyfesiry.show(_arg_1 / 1000);
         battleService.getBattleRunner().wop(this);
         battleEventDispatcher.dispatchEvent(new Kunatibo());
      }
      
      private function hideIndicator() : void
      {
         battleService.getBattleRunner().bapucic(this);
         this.zyfesiry.hide();
         battleEventDispatcher.dispatchEvent(new Liz());
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.zyfesiry.seconds = Math.max((this.wabyrujy - _arg_1) / 1000,0);
      }
      
      private function limavoga(_arg_1:Tujat) : void
      {
         if(this._user == _arg_1.tank.bebosaca())
         {
            this.hideIndicator();
         }
      }
      
      private function cocag(_arg_1:Vopetycy) : void
      {
         if(this._user == _arg_1.cuzipin.bebosaca())
         {
            this.hideIndicator();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.ACTIVATE,this.peg);
         display.stage.removeEventListener(Event.DEACTIVATE,this.paru);
         battleEventDispatcher.kujo(Pawado,this);
         battleEventDispatcher.kujo(Vovakopy,this);
         battleEventDispatcher.kujo(Tujat,this);
         battleEventDispatcher.kujo(Vopetycy,this);
         this.zyfesiry.destroy();
         this.zyfesiry = null;
         this._user = null;
      }
   }
}

