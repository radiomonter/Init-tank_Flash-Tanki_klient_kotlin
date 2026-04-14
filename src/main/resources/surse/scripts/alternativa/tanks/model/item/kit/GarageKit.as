package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public interface GarageKit
   {
      
      function getImage() : ImageResource;
      
      function getPrice() : int;
      
      function getPriceWithoutDiscount() : int;
      
      function cik() : int;
      
      function cikanokot() : int;
      
      function getItems() : Vector.<KitItem>;
      
      function canBuy() : Boolean;
      
      function getGiftItems() : Vector.<KitGiftItem>;
   }
}

