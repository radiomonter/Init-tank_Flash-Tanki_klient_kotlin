package alternativa.tanks.gui
{
   import flash.events.Event;
   
   public class GiftWindowEvent extends Event
   {
      
      public static const GIFT_RECEIVED:String = "GiftWindowEventGiftReceived";
      
      public function GiftWindowEvent(_arg_1:String)
      {
         super(_arg_1,true,false);
      }
   }
}

