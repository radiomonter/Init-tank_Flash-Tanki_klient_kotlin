package controls.cellrenderer
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   
   public class CellNormalSelected extends CellRendererDefault
   {
      
      private static const normalLeft:Class = CellNormalSelected_normalLeft;
      
      private static const normalLeftData:BitmapData = Bitmap(new normalLeft()).bitmapData;
      
      private static const normalCenter:Class = CellNormalSelected_normalCenter;
      
      private static const normalCenterData:BitmapData = Bitmap(new normalCenter()).bitmapData;
      
      private static const normalRight:Class = CellNormalSelected_normalRight;
      
      private static const normalRightData:BitmapData = Bitmap(new normalRight()).bitmapData;
      
      public function CellNormalSelected()
      {
         super();
         bmpLeft = normalLeftData;
         bmpCenter = normalCenterData;
         bmpRight = normalRightData;
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
         l.y = 1;
         _local_1 = c.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpCenter);
         _local_1.drawRect(0,0,_width - 10,20);
         _local_1.endFill();
         c.x = 5;
         c.y = 1;
         _local_1 = r.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(bmpRight);
         _local_1.drawRect(0,0,5,20);
         _local_1.endFill();
         r.x = _width - 5;
         r.y = 1;
      }
   }
}

