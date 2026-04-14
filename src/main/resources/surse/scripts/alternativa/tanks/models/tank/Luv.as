package alternativa.tanks.models.tank
{
   import flash.utils.getTimer;
   
   public class Luv
   {
      
      private var buvugife:uint;
      
      public function Luv()
      {
         super();
      }
      
      public function reset(_arg_1:uint) : void
      {
         this.buvugife = getTimer() + _arg_1;
      }
      
      public function getTimeLeft() : uint
      {
         return this.buvugife - getTimer();
      }
   }
}

