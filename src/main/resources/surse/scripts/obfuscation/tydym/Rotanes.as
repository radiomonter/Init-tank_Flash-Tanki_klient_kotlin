package obfuscation.tydym
{
   public class Rotanes implements Kolovi
   {
      
      private var type:int;
      
      private var zajyten:Fudazoze;
      
      public function Rotanes(_arg_1:int, _arg_2:Fudazoze)
      {
         super();
         this.type = _arg_1;
         this.zajyten = _arg_2;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.zajyten.mot.visible = true;
         this.zajyten.mot.alpha = 1;
         this.zajyten.hedohygyl.visible = false;
         this.zajyten.kad.visible = false;
      }
      
      public function stop() : void
      {
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
      }
   }
}

