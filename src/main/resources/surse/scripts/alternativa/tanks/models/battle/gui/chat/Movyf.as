package alternativa.tanks.models.battle.gui.chat
{
   public class Movyf
   {
      
      public static const OPEN:int = 1;
      
      public static const CLOSE:int = 2;
      
      private var type:int;
      
      public function Movyf(_arg_1:int)
      {
         super();
         this.type = _arg_1;
      }
      
      public function getType() : int
      {
         return this.type;
      }
   }
}

