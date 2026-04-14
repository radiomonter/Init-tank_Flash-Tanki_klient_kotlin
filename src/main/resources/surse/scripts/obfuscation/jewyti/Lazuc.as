package obfuscation.jewyti
{
   public class Lazuc
   {
      
      private var cofiwi:Vector.<Detuqyz>;
      
      private var rosoroqel:int;
      
      public function Lazuc(_arg_1:Vector.<Detuqyz>)
      {
         super();
         this.cofiwi = _arg_1;
      }
      
      public function qudica() : Detuqyz
      {
         return this.cofiwi[this.rosoroqel];
      }
      
      public function byrok() : void
      {
         this.rosoroqel = (this.rosoroqel + 1) % this.cofiwi.length;
      }
   }
}

