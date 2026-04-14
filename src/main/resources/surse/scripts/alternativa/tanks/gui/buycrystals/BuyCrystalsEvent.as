package alternativa.tanks.gui.buycrystals
{
   import flash.events.Event;
   
   public class BuyCrystalsEvent extends Event
   {
      
      public static const BUY_CRYSTALS:String = "BuyCrystalsEvent.BuyCrystals";
      
      private var crystalsToBuy:int;
      
      public function BuyCrystalsEvent(_arg_1:int)
      {
         super(BUY_CRYSTALS);
         this.crystalsToBuy = _arg_1;
      }
      
      public function getCrystalsToBuy() : int
      {
         return this.crystalsToBuy;
      }
   }
}

