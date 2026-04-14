package controls.slider
{
   import assets.slider.slider_THUMB_CENTER;
   import assets.slider.slider_THUMB_LEFT;
   import assets.slider.slider_THUMB_RIGHT;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class SliderThumb extends Sprite
   {
      
      protected var thumb_bmpLeft:slider_THUMB_LEFT = new slider_THUMB_LEFT(1,1);
      
      protected var thumb_bmpCenter:slider_THUMB_CENTER = new slider_THUMB_CENTER(1,1);
      
      protected var thumb_bmpRight:slider_THUMB_RIGHT = new slider_THUMB_RIGHT(1,1);
      
      protected var _width:int;
      
      public function SliderThumb()
      {
         super();
         buttonMode = true;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.draw();
      }
      
      protected function draw() : void
      {
         var _local_2:Matrix = null;
         var _local_1:Graphics = this.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(this.thumb_bmpLeft);
         _local_1.drawRect(0,0,10,30);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.translate(10,0);
         _local_1.beginBitmapFill(this.thumb_bmpCenter,_local_2);
         _local_1.drawRect(10,0,this._width - 20,30);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.translate(this._width - 10,0);
         _local_1.beginBitmapFill(this.thumb_bmpRight,_local_2);
         _local_1.drawRect(this._width - 10,0,10,30);
         _local_1.endFill();
      }
   }
}

