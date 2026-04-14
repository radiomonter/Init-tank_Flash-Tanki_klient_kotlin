package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public class Foz implements GarageKit
   {
      
      private var object:IGameObject;
      
      private var impl:GarageKit;
      
      public function Foz(_arg_1:IGameObject, _arg_2:GarageKit)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImage();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPrice() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getPrice();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getPriceWithoutDiscount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function cik() : int
      {
         var pify:int = 0;
         try
         {
            Model.object = this.object;
            pify = this.impl.cik();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function cikanokot() : int
      {
         var pify:int = 0;
         try
         {
            Model.object = this.object;
            pify = this.impl.cikanokot();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function getItems() : Vector.<KitItem>
      {
         var result:Vector.<KitItem> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getItems();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function canBuy() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.canBuy();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getGiftItems() : Vector.<KitGiftItem>
      {
         var result:Vector.<KitGiftItem> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getGiftItems();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

