package controls.resultassets
{
   import assets.resultwindow.items_mini_CENTER;
   import assets.resultwindow.items_mini_LEFT;
   import assets.resultwindow.items_mini_RIGHT;
   import controls.ButtonState;
   import flash.display.Graphics;
   
   public class WhiteFrame extends ButtonState
   {
      
      public function WhiteFrame()
      {
         super();
         bmpLeft = new items_mini_LEFT(1,1);
         bmpCenter = new items_mini_CENTER(1,1);
         bmpRight = new items_mini_RIGHT(1,1);
      }
      
      override public function draw() : void
      {
         var _local_1:Graphics = null;
         _local_1 = l.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpLeft);
         _local_1.drawRect(0,0,20,40);
         _local_1.endFill();
         l.x = 0;
         l.y = 0;
         _local_1 = c.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpCenter);
         _local_1.drawRect(0,0,_width - 40,40);
         _local_1.endFill();
         c.x = 20;
         c.y = 0;
         _local_1 = r.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpRight);
         _local_1.drawRect(0,0,20,40);
         _local_1.endFill();
         r.x = _width - 20;
         r.y = 0;
      }
   }
}

