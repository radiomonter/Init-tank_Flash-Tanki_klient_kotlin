package obfuscation.cujewipo
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Matrix;
   
   public class Myjigyni extends Shape
   {
      
      private static const matrix:Matrix = new Matrix();
      
      public function Myjigyni()
      {
         super();
      }
      
      public function set bitmapData(_arg_1:BitmapData) : void
      {
         matrix.tx = -_arg_1.width / 2;
         graphics.clear();
         graphics.beginBitmapFill(_arg_1,matrix,false,true);
         graphics.drawRect(matrix.tx,0,_arg_1.width,_arg_1.height);
         graphics.endFill();
      }
   }
}

