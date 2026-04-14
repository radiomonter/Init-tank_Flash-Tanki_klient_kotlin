package controls.dropdownlist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DeleteIndicator extends Sprite
   {
      
      private static var crossIconClass:Class = DeleteIndicator_crossIconClass;
      
      private static var crossIconBitmapData:BitmapData = new crossIconClass().bitmapData;
      
      public var data:Object;
      
      public function DeleteIndicator(_arg_1:Object)
      {
         super();
         this.data = _arg_1;
         buttonMode = true;
         tabEnabled = false;
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
         addChild(new Bitmap(crossIconBitmapData));
      }
      
      private function onMouseClick(_arg_1:MouseEvent) : void
      {
         visible = false;
         _arg_1.stopPropagation();
         removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         dispatchEvent(new DeleteEvent(this.data));
      }
   }
}

