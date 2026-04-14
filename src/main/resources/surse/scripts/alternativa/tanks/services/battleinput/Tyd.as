package alternativa.tanks.services.battleinput
{
   public class Tyd
   {
      
      public static const CHAT:Tyd = new Tyd(1);
      
      public static const byzidaj:Tyd = new Tyd(2);
      
      public static const zutaqy:Tyd = new Tyd(4);
      
      private var mask:int;
      
      public function Tyd(_arg_1:int)
      {
         super();
         this.mask = _arg_1;
      }
      
      public function jevatotu() : int
      {
         return this.mask;
      }
   }
}

