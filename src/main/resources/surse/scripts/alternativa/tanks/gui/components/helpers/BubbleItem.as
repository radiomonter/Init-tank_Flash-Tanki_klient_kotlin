package alternativa.tanks.gui.components.helpers
{
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BubbleItem extends BubbleHelper
   {
      
      private static var instance:BubbleItem;
      
      public function BubbleItem()
      {
         super();
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
      }
      
      public static function createBubble(_arg_1:String, _arg_2:DisplayObject, _arg_3:DisplayObjectContainer) : BubbleItem
      {
         if(instance == null)
         {
            instance = new BubbleItem();
         }
         instance.text = _arg_1;
         instance.arrowLehgth = 20;
         instance.arrowAlign = HelperAlign.BOTTOM_LEFT;
         instance.x = _arg_2.x;
         instance.y = _arg_2.y - 45;
         instance.targetPoint = new Point(_arg_2.x,20);
         instance.draw(instance.size);
         _arg_3.addChild(instance);
         return instance;
      }
      
      public static function hide() : void
      {
         if(instance != null)
         {
            instance.hide();
         }
      }
      
      private function onMouseClick(_arg_1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         if(Boolean(parent))
         {
            parent.removeChild(this);
         }
      }
   }
}

