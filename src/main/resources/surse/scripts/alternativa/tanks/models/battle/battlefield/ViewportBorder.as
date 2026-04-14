package alternativa.tanks.models.battle.battlefield
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class ViewportBorder
   {
      
      private static var bmpClassCorner1:Class = ViewportBorder_bmpClassCorner1;
      
      private static var bmdCorner1:BitmapData = Bitmap(new bmpClassCorner1()).bitmapData;
      
      private static var bmpClassCorner2:Class = ViewportBorder_bmpClassCorner2;
      
      private static var bmdCorner2:BitmapData = Bitmap(new bmpClassCorner2()).bitmapData;
      
      private static var bmpClassCorner3:Class = ViewportBorder_bmpClassCorner3;
      
      private static var bmdCorner3:BitmapData = Bitmap(new bmpClassCorner3()).bitmapData;
      
      private static var bmpClassCorner4:Class = ViewportBorder_bmpClassCorner4;
      
      private static var bmdCorner4:BitmapData = Bitmap(new bmpClassCorner4()).bitmapData;
      
      private static var bmpClassBorderLeft:Class = ViewportBorder_bmpClassBorderLeft;
      
      private static var bmdBorderLeft:BitmapData = Bitmap(new bmpClassBorderLeft()).bitmapData;
      
      private static var bmpClassBorderRight:Class = ViewportBorder_bmpClassBorderRight;
      
      private static var bmdBorderRight:BitmapData = Bitmap(new bmpClassBorderRight()).bitmapData;
      
      private static var bmpClassBorderTop:Class = ViewportBorder_bmpClassBorderTop;
      
      private static var bmdBorderTop:BitmapData = Bitmap(new bmpClassBorderTop()).bitmapData;
      
      private static var bmpClassBorderBottom:Class = ViewportBorder_bmpClassBorderBottom;
      
      private static var bmdBorderBottom:BitmapData = Bitmap(new bmpClassBorderBottom()).bitmapData;
      
      public function ViewportBorder()
      {
         super();
      }
      
      private static function fillBorderRect(_arg_1:Graphics, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int) : void
      {
         var _local_7:Matrix = new Matrix();
         _local_7.tx = _arg_3;
         _local_7.ty = _arg_4;
         _arg_1.beginBitmapFill(_arg_2,_local_7);
         _arg_1.drawRect(_arg_3,_arg_4,_arg_5,_arg_6);
         _arg_1.endFill();
      }
      
      public static function draw(_arg_1:Graphics, _arg_2:int, _arg_3:int) : void
      {
         var _local_4:int = 4;
         fillBorderRect(_arg_1,bmdCorner1,_local_4 - bmdCorner1.width,_local_4 - bmdCorner1.height,bmdCorner1.width,bmdCorner1.height);
         fillBorderRect(_arg_1,bmdCorner2,_arg_2 - _local_4,_local_4 - bmdCorner2.height,bmdCorner2.width,bmdCorner2.height);
         fillBorderRect(_arg_1,bmdCorner3,_local_4 - bmdCorner3.width,_arg_3 - _local_4,bmdCorner3.width,bmdCorner3.height);
         fillBorderRect(_arg_1,bmdCorner4,_arg_2 - _local_4,_arg_3 - _local_4,bmdCorner4.width,bmdCorner4.height);
         fillBorderRect(_arg_1,bmdBorderTop,_local_4,_local_4 - bmdBorderTop.height,_arg_2 - 2 * _local_4,bmdBorderTop.height);
         fillBorderRect(_arg_1,bmdBorderBottom,_local_4,_arg_3 - _local_4,_arg_2 - 2 * _local_4,bmdBorderBottom.height);
         fillBorderRect(_arg_1,bmdBorderLeft,_local_4 - bmdBorderLeft.width,_local_4,bmdBorderLeft.width,_arg_3 - 2 * _local_4);
         fillBorderRect(_arg_1,bmdBorderRight,_arg_2 - _local_4,_local_4,bmdBorderRight.width,_arg_3 - 2 * _local_4);
      }
   }
}

