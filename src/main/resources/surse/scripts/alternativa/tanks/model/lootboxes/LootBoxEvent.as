package alternativa.tanks.model.lootboxes
{
   import flash.events.Event;
   
   public class LootBoxEvent extends Event
   {
      
      public static var OPEN:String = "LootBoxEvent1";
      
      public var count:int = 0;
      
      public function LootBoxEvent(_arg_1:int)
      {
         this.count = _arg_1;
         super(OPEN,false,false);
      }
   }
}

