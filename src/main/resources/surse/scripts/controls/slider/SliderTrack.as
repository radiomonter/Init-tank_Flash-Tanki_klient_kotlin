package controls.slider
{
   import assets.slider.slider_TRACK_CENTER;
   import assets.slider.slider_TRACK_LEFT;
   import assets.slider.slider_TRACK_RIGHT;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class SliderTrack extends Sprite
   {
      
      protected var track_bmpLeft:slider_TRACK_LEFT = new slider_TRACK_LEFT(1,1);
      
      protected var track_bmpCenter:slider_TRACK_CENTER = new slider_TRACK_CENTER(1,1);
      
      protected var track_bmpRight:slider_TRACK_RIGHT = new slider_TRACK_RIGHT(1,1);
      
      protected var _width:int;
      
      protected var _showTrack:Boolean;
      
      protected var _minValue:Number = 0;
      
      protected var _maxValue:Number = 100;
      
      protected var _tick:Number = 10;
      
      public function SliderTrack(_arg_1:Boolean = true)
      {
         super();
         this._showTrack = _arg_1;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.draw();
      }
      
      protected function draw() : void
      {
         var _local_2:Matrix = null;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_1:Graphics = this.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(this.track_bmpLeft);
         _local_1.drawRect(0,0,5,30);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.translate(5,0);
         _local_1.beginBitmapFill(this.track_bmpCenter,_local_2);
         _local_1.drawRect(5,0,this._width - 11,30);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.translate(this._width - 6,0);
         _local_1.beginBitmapFill(this.track_bmpRight,_local_2);
         _local_1.drawRect(this._width - 6,0,6,30);
         _local_1.endFill();
         if(this._showTrack)
         {
            _local_3 = width / ((this._maxValue - this._minValue) / this._tick);
            _local_4 = _local_3;
            while(_local_4 < this._width)
            {
               _local_1.lineStyle(0,16777215,0.4);
               _local_1.moveTo(_local_4,5);
               _local_1.lineTo(_local_4,25);
               _local_4 += _local_3;
            }
         }
      }
      
      public function set minValue(_arg_1:Number) : void
      {
         this._minValue = _arg_1;
         this.draw();
      }
      
      public function set maxValue(_arg_1:Number) : void
      {
         this._maxValue = _arg_1;
         this.draw();
      }
      
      public function set tickInterval(_arg_1:Number) : void
      {
         this._tick = _arg_1;
         this.draw();
      }
   }
}

