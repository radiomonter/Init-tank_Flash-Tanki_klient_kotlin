package alternativa.tanks.gui.friends.list.renderer.background
{
   import controls.ButtonState;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   
   public class FriendCellSelected extends ButtonState
   {
      
      private static var leftIconClass:Class = FriendCellSelected_leftIconClass;
      
      private static var leftIconBitmapData:BitmapData = Bitmap(new leftIconClass()).bitmapData;
      
      private static var centerIconClass:Class = FriendCellSelected_centerIconClass;
      
      private static var centerIconBitmapData:BitmapData = Bitmap(new centerIconClass()).bitmapData;
      
      private static var rightIconClass:Class = FriendCellSelected_rightIconClass;
      
      private static var rightIconBitmapData:BitmapData = Bitmap(new rightIconClass()).bitmapData;
      
      public function FriendCellSelected()
      {
         super();
         bmpLeft = leftIconBitmapData;
         bmpCenter = centerIconBitmapData;
         bmpRight = rightIconBitmapData;
      }
      
      override public function draw() : void
      {
         var _local_1:Graphics = null;
         _local_1 = l.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpLeft);
         _local_1.drawRect(0,0,5,20);
         _local_1.endFill();
         l.x = 0;
         l.y = 0;
         _local_1 = c.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpCenter);
         _local_1.drawRect(0,0,_width - 10,20);
         _local_1.endFill();
         c.x = 5;
         c.y = 0;
         _local_1 = r.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpRight);
         _local_1.drawRect(0,0,5,20);
         _local_1.endFill();
         r.x = _width - 5;
         r.y = 0;
      }
   }
}

