package alternativa.tanks.service.item
{
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Rukebuqap extends Event
   {
      
      public static var lekuzu:String = "ItemEvents:OnItemAdded";
      
      private var item:IGameObject;
      
      public function Rukebuqap(_arg_1:String, _arg_2:IGameObject)
      {
         super(_arg_1);
         this.item = _arg_2;
      }
      
      public function getItem() : IGameObject
      {
         return this.item;
      }
   }
}

