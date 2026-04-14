package obfuscation.wokogi
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import obfuscation.cawutare.Qohygyd;
   import obfuscation.cetij.Pisodyhi;
   import obfuscation.lari.Pawado;
   import obfuscation.vacogofiv.Dyd;
   import obfuscation.vacogofiv.Sybo;
   
   public class Gelifo extends Dyd implements Sybo
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function Gelifo()
      {
         super();
      }
      
      public function localTankLoaded(_arg_1:ClientObject) : void
      {
         _arg_1.putParams(Qohygyd,new Qohygyd(_arg_1));
      }
      
      [Obfuscation(rename="false")]
      public function onDeathScheduled(_arg_1:int) : void
      {
         battleEventDispatcher.dispatchEvent(new Pawado(_arg_1));
      }
      
      [Obfuscation(rename="false")]
      public function die(_arg_1:int) : void
      {
      }
      
      [Obfuscation(rename="false")]
      public function onReload(_arg_1:ClientObject) : void
      {
         battleEventDispatcher.dispatchEvent(new Pisodyhi(_arg_1.id));
      }
   }
}

