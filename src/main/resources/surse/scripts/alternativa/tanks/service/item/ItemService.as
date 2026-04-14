package alternativa.tanks.service.item
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import controls.timer.CountDownTimer;
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public interface ItemService extends IEventDispatcher
   {
      
      function getPreviewResource(param1:IGameObject) : ImageResource;
      
      function addItem(param1:IGameObject) : void;
      
      function removeItem(param1:IGameObject) : void;
      
      function getCategory(param1:IGameObject) : ItemCategoryEnum;
      
      function rivozip(param1:IGameObject) : ItemViewCategoryEnum;
      
      function cunybuwoq(param1:ItemCategoryEnum) : void;
      
      function muceraqe(param1:IGameObject) : Vector.<IGameObject>;
      
      function vedet(param1:IGameObject) : int;
      
      function getProperties(param1:IGameObject) : Vector.<ItemPropertyValue>;
      
      function nyr(param1:IGameObject) : IGameObject;
      
      function getName(param1:IGameObject) : String;
      
      function getDescription(param1:IGameObject) : String;
      
      function ducecyra(param1:IGameObject) : IGameObject;
      
      function getPosition(param1:IGameObject) : int;
      
      function getPrice(param1:IGameObject) : int;
      
      function isBuyable(param1:IGameObject) : Boolean;
      
      function getDiscount(param1:IGameObject) : int;
      
      function isUpgrading(param1:IGameObject) : Boolean;
      
      function getUpgradingProperty(param1:IGameObject) : ItemGarageProperty;
      
      function cacum(param1:IGameObject) : Boolean;
      
      function getEndDiscountTimer(param1:IGameObject) : CountDownTimer;
      
      function getPriceWithoutDiscount(param1:IGameObject) : int;
      
      function zereqyj(param1:IGameObject) : Boolean;
      
      function capaq(param1:IGameObject) : Boolean;
      
      function isCountable(param1:IGameObject) : Boolean;
      
      function miqysi(param1:IGameObject) : Boolean;
      
      function gotol(param1:IGameObject) : Boolean;
      
      function canBuy(param1:IGameObject) : Boolean;
      
      function joso(param1:IGameObject) : Boolean;
      
      function jihosis(param1:IGameObject) : Boolean;
      
      function reset() : void;
      
      function getUpgradableProperties(param1:IGameObject) : Vector.<UpgradableItemPropertyValue>;
      
      function getModificationIndex(param1:IGameObject) : int;
      
      function hasNextModification(param1:IGameObject) : Boolean;
      
      function hefigiv(param1:IGameObject) : IGameObject;
      
      function mepuge(param1:IGameObject) : IGameObject;
      
      function nemofoni(param1:IGameObject) : IGameObject;
      
      function getCount(param1:IGameObject) : int;
      
      function setCount(param1:IGameObject, param2:int) : void;
      
      function ruma(param1:IGameObject) : int;
      
      function hun(param1:IGameObject) : int;
      
      function zelima(param1:IGameObject) : Boolean;
      
      function mountItem(param1:IGameObject) : void;
      
      function isFullUpgraded(param1:IGameObject) : Boolean;
      
      function getTimeLeftInSeconds(param1:IGameObject) : int;
      
      function konyqa(param1:IGameObject) : Boolean;
      
      function vogacamy(param1:IGameObject) : Boolean;
   }
}

