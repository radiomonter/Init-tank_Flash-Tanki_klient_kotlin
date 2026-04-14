package obfuscation.jewyti
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class Habobada implements Sytyrojuq, Gonatedog
   {
      
      public static const cohenylic:int = 0;
      
      public static const hecega:int = 1;
      
      public static const lisihusah:int = 2;
      
      public static const tyn:int = 3;
      
      public static const sagoh:int = 4;
      
      public static const dazefozy:int = 5;
      
      public static const qydiqi:int = 6;
      
      public static const keqi:int = 7;
      
      public static const qulanabus:int = 8;
      
      public static const bylig:int = 9;
      
      public static const mucovibe:int = 10;
      
      private static const puqef:int = 1 << mucovibe | 1 << bylig | 1 << keqi | 1 << qulanabus;
      
      private var gac:Dictionary = new Dictionary();
      
      private var jeneto:BitMask = new BitMask(0);
      
      public function Habobada()
      {
         super();
         this.gac[Keyboard.W] = cohenylic;
         this.gac[Keyboard.S] = hecega;
         this.gac[Keyboard.A] = lisihusah;
         this.gac[Keyboard.D] = tyn;
         this.gac[Keyboard.Q] = dazefozy;
         this.gac[Keyboard.E] = sagoh;
         this.gac[Keyboard.SHIFT] = qydiqi;
         this.gac[Keyboard.LEFT] = keqi;
         this.gac[Keyboard.RIGHT] = qulanabus;
         this.gac[Keyboard.UP] = bylig;
         this.gac[Keyboard.DOWN] = mucovibe;
      }
      
      public function botava() : int
      {
         return this.jesenebo(cohenylic,hecega);
      }
      
      public function zunosup() : int
      {
         return this.jesenebo(tyn,lisihusah);
      }
      
      public function zekyliqol() : int
      {
         return this.jesenebo(sagoh,dazefozy);
      }
      
      public function risag() : Boolean
      {
         return this.jeneto.getBitValue(qydiqi) == 1;
      }
      
      public function tabuduhy(_arg_1:KeyboardEvent) : void
      {
         if(this.gac[_arg_1.keyCode] != null)
         {
            this.jeneto.setBit(this.gac[_arg_1.keyCode]);
         }
      }
      
      public function mokuby(_arg_1:KeyboardEvent) : void
      {
         if(this.gac[_arg_1.keyCode] != null)
         {
            this.jeneto.clearBit(this.gac[_arg_1.keyCode]);
         }
      }
      
      public function cyfywac() : int
      {
         return this.jesenebo(keqi,qulanabus);
      }
      
      public function qita() : int
      {
         return this.jesenebo(bylig,mucovibe);
      }
      
      public function isRotating() : Boolean
      {
         return this.jeneto.hasAnyBit(puqef);
      }
      
      private function jesenebo(_arg_1:int, _arg_2:int) : int
      {
         return this.jeneto.getBitValue(_arg_1) - this.jeneto.getBitValue(_arg_2);
      }
      
      public function reset() : void
      {
         this.jeneto.clear();
      }
   }
}

