package alternativa.tanks.gui.device.list
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class DeviceBorder extends Sprite
   {
      
      private static const MIN_SINGLE_BUTTON_HEIGHT:int = 104;
      
      private static const MIN_DOUBLE_BUTTON_HEIGHT:int = 150;
      
      private static const WIDTH:int = 474;
      
      private static const topClass:Class = DeviceBorder_topClass;
      
      private static const topData:BitmapData = Bitmap(new topClass()).bitmapData;
      
      private static const centerClass:Class = DeviceBorder_centerClass;
      
      private static const centerData:BitmapData = Bitmap(new centerClass()).bitmapData;
      
      private static const bottomClass:Class = DeviceBorder_bottomClass;
      
      private static const bottomData:BitmapData = Bitmap(new bottomClass()).bitmapData;
      
      public const top:Shape;
      
      public const bottom:Shape;
      
      public const center:Shape;
      
      public function DeviceBorder(_arg_1:int, _arg_2:Boolean)
      {
         var _local_4:Graphics = null;
         var _local_3:int = 0;
         this.top = new Shape();
         this.bottom = new Shape();
         this.center = new Shape();
         super();
         _local_3 = Math.max(_arg_1,_arg_2 ? MIN_SINGLE_BUTTON_HEIGHT : MIN_DOUBLE_BUTTON_HEIGHT);
         addChild(this.top);
         addChild(this.center);
         addChild(this.bottom);
         _local_4 = this.top.graphics;
         _local_4.clear();
         _local_4.beginBitmapFill(topData);
         _local_4.drawRect(0,0,WIDTH,5);
         _local_4.endFill();
         this.top.x = 0;
         this.top.y = 0;
         _local_4 = this.center.graphics;
         _local_4.clear();
         _local_4.beginBitmapFill(centerData);
         _local_4.drawRect(0,0,WIDTH,_local_3 - 10);
         _local_4.endFill();
         this.center.x = 0;
         this.center.y = 5;
         _local_4 = this.bottom.graphics;
         _local_4.clear();
         _local_4.beginBitmapFill(bottomData);
         _local_4.drawRect(0,0,WIDTH,5);
         _local_4.endFill();
         this.bottom.x = 0;
         this.bottom.y = _local_3 - 5;
      }
   }
}

