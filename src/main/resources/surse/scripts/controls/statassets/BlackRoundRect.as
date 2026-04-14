package controls.statassets
{
   import assets.resultwindow.bres_BG_BLACKCORNER;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class BlackRoundRect extends StatLineBase
   {
      
      public function BlackRoundRect()
      {
         super();
         tl = new bres_BG_BLACKCORNER(1,1);
         px = new BitmapData(1,1,true,2566914048);
      }
      
      override protected function draw() : void
      {
         var _local_2:Matrix = null;
         var _local_1:Graphics = this.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(tl);
         _local_1.drawRect(0,0,8,8);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI * 0.5);
         _local_2.translate(_width - 8,0);
         _local_1.beginBitmapFill(tl,_local_2);
         _local_1.drawRect(_width - 8,0,8,8);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI);
         _local_2.translate(_width - 8,_height - 8);
         _local_1.beginBitmapFill(tl,_local_2);
         _local_1.drawRect(_width - 8,_height - 8,8,8);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI * 1.5);
         _local_2.translate(0,_height - 8);
         _local_1.beginBitmapFill(tl,_local_2);
         _local_1.drawRect(0,_height - 8,8,8);
         _local_1.endFill();
         _local_1.beginBitmapFill(px);
         _local_1.drawRect(8,0,_width - 16,_height);
         _local_1.drawRect(0,8,8,_height - 16);
         _local_1.drawRect(_width - 8,8,8,_height - 16);
         _local_1.endFill();
      }
   }
}

