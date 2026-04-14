package obfuscation.tydym
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Rymefuqiw;
   import flash.utils.getTimer;
   
   public class Gesu implements Kolovi
   {
      
      private var type:int;
      
      private var zajyten:Fudazoze;
      
      private var blinker:Rymefuqiw;
      
      private var konaky:int;
      
      public function Gesu(_arg_1:int, _arg_2:Fudazoze, _arg_3:Rymefuqiw, _arg_4:int)
      {
         super();
         this.type = _arg_1;
         this.zajyten = _arg_2;
         this.blinker = _arg_3;
         this.konaky = _arg_4;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.blinker.start(getTimer());
         this.zajyten.mot.visible = true;
         this.zajyten.mot.alpha = 1;
         this.zajyten.hedohygyl.visible = false;
         this.zajyten.kad.visible = true;
         this.zajyten.kad.alpha = 0;
      }
      
      public function stop() : void
      {
         this.blinker.stop();
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = this.blinker.values[this.konaky];
         this.zajyten.mot.alpha = _local_3;
         this.zajyten.kad.alpha = 1 - _local_3;
      }
   }
}

