package alternativa.tanks.model.item.kit
{
   import alternativa.tanks.model.item.discount.DiscountInfo;
   import alternativa.tanks.model.item.discount.ICollectDiscount;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.discount.IDiscountCollector;
   import alternativa.tanks.service.item.ItemService;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.Jyred;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.client.garage.models.item.kit.Teguqeci;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Catypab extends Teguqeci implements Jyred, GarageKit, ICollectDiscount
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      public function Catypab()
      {
         super();
      }
      
      public function getImage() : ImageResource
      {
         return getInitParam().image;
      }
      
      public function getPrice() : int
      {
         var _local_1:int = this.getPriceWithoutDiscount();
         var _local_2:IDiscount = IDiscount(object.adapt(IDiscount));
         return _local_2.applyDiscount(_local_1);
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var _local_1:KitItem = null;
         var _local_2:int = 0;
         for each(_local_1 in this.getItems())
         {
            _local_2 += itemService.getPriceWithoutDiscount(_local_1.item) * _local_1.count;
         }
         return _local_2;
      }
      
      public function cik() : int
      {
         var _local_1:KitItem = null;
         var _local_2:int = 0;
         for each(_local_1 in this.getItems())
         {
            if(itemService.jihosis(_local_1.item) && !itemService.isCountable(_local_1.item) && itemService.getCategory(_local_1.item) != ItemCategoryEnum.PLUGIN)
            {
               _local_2 += itemService.getPrice(_local_1.item) * _local_1.count;
            }
         }
         return _local_2;
      }
      
      public function cikanokot() : int
      {
         return this.getPriceWithoutDiscount() - this.getPrice() - this.cik();
      }
      
      public function canBuy() : Boolean
      {
         var _local_1:KitItem = null;
         for each(_local_1 in this.getItems())
         {
            if(!itemService.jihosis(_local_1.item) && itemService.ruma(_local_1.item) > userPropertyService.rank)
            {
               return true;
            }
         }
         return this.cikanokot() > 0;
      }
      
      public function getItems() : Vector.<KitItem>
      {
         return getInitParam().kitItems;
      }
      
      public function collectDiscountsInfo(_arg_1:IDiscountCollector) : void
      {
         if(getInitParam() == null)
         {
            return;
         }
         _arg_1.addDiscount(new DiscountInfo(getInitParam().discountInPercent,0));
      }
      
      public function getGiftItems() : Vector.<KitGiftItem>
      {
         return getInitParam().giftItems;
      }
   }
}

