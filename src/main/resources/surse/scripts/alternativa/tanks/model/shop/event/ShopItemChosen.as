package alternativa.tanks.model.shop.event
{
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import flash.events.Event;
   
   public class ShopItemChosen extends Event
   {
      
      public static const zevafef:String = "ShopItemChosenEventConfirmationClosed";
      
      public static const jew:String = "ShopItemChosenEventConfirmationProceed";
      
      public static const EVENT_TYPE:String = "ShopItemChosenEVENT";
      
      public var itemId:String;
      
      public var gridPosition:int;
      
      public var watu:ShopItemBase;
      
      public var method:String;
      
      public function ShopItemChosen(_arg_1:String = null, _arg_2:String = null, _arg_3:int = 0, _arg_4:ShopItemBase = null, _arg_5:String = null)
      {
         super(_arg_1,true);
         this.itemId = _arg_2;
         this.gridPosition = _arg_3;
         this.watu = _arg_4;
         this.method = _arg_5;
      }
   }
}

