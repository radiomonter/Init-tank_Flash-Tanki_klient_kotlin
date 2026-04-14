package controls.containers
{
   import base.DiscreteSprite;
   import controls.base.TankInputBase;
   import flash.display.DisplayObject;
   
   public class StackPanel extends DiscreteSprite
   {
      
      private var margin:int;
      
      public var items:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function StackPanel()
      {
         super();
      }
      
      public function addItem(_arg_1:DisplayObject) : void
      {
         addChild(_arg_1);
         this.items.push(_arg_1);
         this.lagez(_arg_1);
      }
      
      public function removeItem(param1:DisplayObject) : DisplayObject
      {
         var item:DisplayObject = param1;
         var itemIndex:int = this.items.indexOf(item);
         if(itemIndex < 0)
         {
            return null;
         }
         try
         {
            removeChild(item);
         }
         catch(e:ArgumentError)
         {
            return null;
         }
         this.items.splice(itemIndex,1);
         this.reqema(itemIndex,item);
         return item;
      }
      
      protected function wotycat(_arg_1:DisplayObject) : int
      {
         return int(_arg_1 is TankInputBase ? _arg_1.width - 10 : _arg_1.width);
      }
      
      protected function reqema(_arg_1:int, _arg_2:DisplayObject) : void
      {
      }
      
      protected function lagez(_arg_1:DisplayObject) : void
      {
      }
      
      public function lokiko() : int
      {
         return this.margin;
      }
      
      public function bujet(_arg_1:int) : void
      {
         this.margin = _arg_1;
      }
      
      public function sudybuvo() : int
      {
         return this.items.length;
      }
      
      public function getItems() : Vector.<DisplayObject>
      {
         return this.items;
      }
   }
}

