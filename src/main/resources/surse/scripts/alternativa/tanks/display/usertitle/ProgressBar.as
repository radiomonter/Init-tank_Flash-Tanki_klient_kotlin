package alternativa.tanks.display.usertitle
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class ProgressBar
   {
      
      private static var matrix:Matrix = new Matrix();
      
      private var maxValue:int;
      
      private var barWidth:int;
      
      private var shadowTipWidth:int;
      
      private var shadowHeight:int;
      
      private var barOffsetX:int;
      
      private var barOffsetY:int;
      
      private var skin:ProgressBarSkin;
      
      private var barTipWidth:int;
      
      private var barHeight:int;
      
      private var _progress:int;
      
      private var canvas:Shape = new Shape();
      
      private var x:int;
      
      private var y:int;
      
      private var rect:Rectangle;
      
      public function ProgressBar(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:ProgressBarSkin)
      {
         super();
         this.x = _arg_1;
         this.y = _arg_2;
         this.maxValue = _arg_3;
         this.barWidth = _arg_4;
         this.setSkin(_arg_5);
         this.rect = new Rectangle(_arg_1,_arg_2,2 * this.shadowTipWidth + _arg_4,this.shadowHeight);
      }
      
      public function setSkin(_arg_1:ProgressBarSkin) : void
      {
         this.skin = _arg_1;
         this.barTipWidth = _arg_1.leftTipBg.width;
         this.barHeight = _arg_1.leftTipBg.height;
         this.shadowTipWidth = _arg_1.shadowLeftTip.width;
         this.shadowHeight = _arg_1.shadow.height;
         this.barOffsetX = this.shadowTipWidth - this.barTipWidth;
         this.barOffsetY = this.shadowHeight - this.barHeight >> 1;
      }
      
      public function get progress() : int
      {
         return this._progress;
      }
      
      public function set progress(_arg_1:int) : void
      {
         if(_arg_1 < 0)
         {
            _arg_1 = 0;
         }
         else if(_arg_1 > this.maxValue)
         {
            _arg_1 = this.maxValue;
         }
         this._progress = _arg_1;
      }
      
      public function draw(_arg_1:BitmapData) : void
      {
         var _local_2:int = 0;
         var _local_3:Graphics = this.canvas.graphics;
         _local_3.clear();
         _local_3.beginBitmapFill(this.skin.shadowLeftTip);
         _local_3.drawRect(0,0,this.shadowTipWidth,this.shadowHeight);
         _local_3.beginBitmapFill(this.skin.shadow);
         _local_3.drawRect(this.shadowTipWidth,0,this.barWidth - 2 * this.barTipWidth,this.shadowHeight);
         _local_3.beginBitmapFill(this.skin.shadowRightTip);
         _local_3.drawRect(this.shadowTipWidth + this.barWidth - 2 * this.barTipWidth,0,this.shadowTipWidth,this.shadowHeight);
         _local_3.endFill();
         var _local_4:int = int(this.barWidth * this._progress / this.maxValue);
         var _local_5:int = this.barWidth - this.barTipWidth;
         if(_local_4 >= this.barTipWidth)
         {
            if(_local_4 == this.barWidth)
            {
               this.drawFullBar(_local_3,this.skin.color,this.skin.leftTipFg,this.skin.rightTipFg);
               _local_2 = _local_4;
            }
            else
            {
               matrix.tx = this.barOffsetX;
               matrix.ty = this.barOffsetY;
               _local_3.beginBitmapFill(this.skin.leftTipFg,matrix,false);
               _local_3.drawRect(this.barOffsetX,this.barOffsetY,this.barTipWidth,this.barHeight);
               if(_local_4 > this.barTipWidth)
               {
                  if(_local_4 > _local_5)
                  {
                     _local_4 = _local_5;
                  }
                  _local_2 = _local_4;
                  _local_3.beginFill(this.skin.color);
                  _local_3.drawRect(this.barOffsetX + this.barTipWidth,this.barOffsetY,_local_4 - this.barTipWidth,this.barHeight);
               }
               else
               {
                  _local_2 = this.barTipWidth;
               }
            }
         }
         if(_local_2 == 0)
         {
            this.drawFullBar(_local_3,this.skin.bgColor,this.skin.leftTipBg,this.skin.rightTipBg);
         }
         else if(_local_2 < this.barWidth)
         {
            _local_3.beginFill(this.skin.bgColor);
            _local_3.drawRect(this.barOffsetX + _local_2,this.barOffsetY,_local_5 - _local_2,this.barHeight);
            matrix.tx = this.barOffsetX + _local_5;
            matrix.ty = this.barOffsetY;
            _local_3.beginBitmapFill(this.skin.rightTipBg,matrix,false);
            _local_3.drawRect(this.barOffsetX + _local_5,this.barOffsetY,this.barTipWidth,this.barHeight);
         }
         _local_3.endFill();
         _arg_1.fillRect(this.rect,0);
         matrix.tx = this.x;
         matrix.ty = this.y;
         _arg_1.draw(this.canvas,matrix);
      }
      
      private function drawFullBar(_arg_1:Graphics, _arg_2:uint, _arg_3:BitmapData, _arg_4:BitmapData) : void
      {
         var _local_5:int = this.barWidth - this.barTipWidth;
         matrix.tx = this.barOffsetX;
         matrix.ty = this.barOffsetY;
         _arg_1.beginBitmapFill(_arg_3,matrix,false);
         _arg_1.drawRect(this.barOffsetX,this.barOffsetY,this.barTipWidth,this.barHeight);
         _arg_1.beginFill(_arg_2);
         _arg_1.drawRect(this.barOffsetX + this.barTipWidth,this.barOffsetY,_local_5 - this.barTipWidth,this.barHeight);
         matrix.tx = this.barOffsetX + _local_5;
         _arg_1.beginBitmapFill(_arg_4,matrix,false);
         _arg_1.drawRect(this.barOffsetX + _local_5,this.barOffsetY,this.barTipWidth,this.barHeight);
      }
   }
}

