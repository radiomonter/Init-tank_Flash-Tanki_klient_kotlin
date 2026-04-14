package alternativa.tanks.gui
{
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public interface Jec extends IEventDispatcher
   {
      
      function mountItem(param1:IGameObject) : void;
      
      function unmountItem(param1:IGameObject) : void;
      
      function updateDiscount(param1:IGameObject) : void;
      
      function qufomo() : IGameObject;
      
      function calepyz() : ItemInfoPanel;
      
      function addItemToMarket(param1:IGameObject) : void;
      
      function tofafo(param1:IGameObject) : void;
      
      function removeItemFromStore(param1:IGameObject) : void;
      
      function removeItemFromDepot(param1:IGameObject) : void;
      
      function nobam() : Vector.<Nebaqyce>;
      
      function showCategory(param1:ItemViewCategoryEnum) : void;
   }
}

