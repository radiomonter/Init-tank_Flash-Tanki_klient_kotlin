package utils.graphics
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class Pen
   {
      
      private var _gTarget:Graphics;
      
      private var _bLineStyleSet:Boolean;
      
      public function Pen(_arg_1:Graphics)
      {
         super();
         this._gTarget = _arg_1;
      }
      
      public function set target(_arg_1:Graphics) : void
      {
         this._gTarget = _arg_1;
      }
      
      public function get target() : Graphics
      {
         return this._gTarget;
      }
      
      public function lineStyle(_arg_1:Number = 1, _arg_2:Number = 0, _arg_3:Number = 1, _arg_4:Boolean = false, _arg_5:String = "normal", _arg_6:String = null, _arg_7:String = null, _arg_8:Number = 3) : void
      {
         this._gTarget.lineStyle(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
         this._bLineStyleSet = true;
      }
      
      public function lineGradientStyle(_arg_1:String, _arg_2:Array, _arg_3:Array, _arg_4:Array, _arg_5:Matrix = null, _arg_6:String = "pad", _arg_7:String = "rgb", _arg_8:Number = 0) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.lineGradientStyle(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      public function beginFill(_arg_1:Number, _arg_2:Number = 1) : void
      {
         this._gTarget.beginFill(_arg_1,_arg_2);
      }
      
      public function beginGradientFill(_arg_1:String, _arg_2:Array, _arg_3:Array, _arg_4:Array, _arg_5:Matrix = null, _arg_6:String = "pad", _arg_7:String = "rgb", _arg_8:Number = 0) : void
      {
         this._gTarget.beginGradientFill(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      public function beginBitmapFill(_arg_1:BitmapData, _arg_2:Matrix = null, _arg_3:Boolean = true, _arg_4:Boolean = false) : void
      {
         this._gTarget.beginBitmapFill(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function endFill() : void
      {
         this._gTarget.endFill();
      }
      
      public function clear() : void
      {
         this._gTarget.clear();
         this._bLineStyleSet = false;
      }
      
      public function moveTo(_arg_1:Number, _arg_2:Number) : void
      {
         this._gTarget.moveTo(_arg_1,_arg_2);
      }
      
      public function lineTo(_arg_1:Number, _arg_2:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.lineTo(_arg_1,_arg_2);
      }
      
      public function curveTo(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.curveTo(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function drawLine(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.moveTo(_arg_1,_arg_2);
         this._gTarget.lineTo(_arg_3,_arg_4);
      }
      
      public function drawCurve(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.moveTo(_arg_1,_arg_2);
         this._gTarget.curveTo(_arg_3,_arg_4,_arg_5,_arg_6);
      }
      
      public function drawRect(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.drawRect(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function drawRoundRect(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.drawRoundRect(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public function drawRoundRectComplex(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.drawRoundRectComplex(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      public function drawCircle(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         if(!this._bLineStyleSet)
         {
            this.lineStyle();
         }
         this._gTarget.drawCircle(_arg_1,_arg_2,_arg_3);
      }
      
      public function drawSlice(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         this.drawArc(_arg_4,_arg_5,_arg_2,_arg_1,_arg_3,true);
      }
      
      public function drawArc(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number = 0, _arg_6:Boolean = false) : void
      {
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         if(_arg_4 > 360)
         {
            _arg_4 = 360;
         }
         _arg_4 = Math.PI / 180 * _arg_4;
         var _local_11:Number = _arg_4 / 8;
         var _local_12:Number = _arg_3 / Math.cos(_local_11 / 2);
         _arg_5 *= Math.PI / 180;
         var _local_13:Number = _arg_5;
         var _local_14:Number = _arg_1 + Math.cos(_arg_5) * _arg_3;
         var _local_15:Number = _arg_2 + Math.sin(_arg_5) * _arg_3;
         if(_arg_6)
         {
            this.moveTo(_arg_1,_arg_2);
            this.lineTo(_local_14,_local_15);
         }
         else
         {
            this.moveTo(_local_14,_local_15);
         }
         var _local_16:Number = 0;
         while(_local_16 < 8)
         {
            _local_13 += _local_11;
            _local_7 = _arg_1 + Math.cos(_local_13 - _local_11 / 2) * _local_12;
            _local_8 = _arg_2 + Math.sin(_local_13 - _local_11 / 2) * _local_12;
            _local_9 = _arg_1 + Math.cos(_local_13) * _arg_3;
            _local_10 = _arg_2 + Math.sin(_local_13) * _arg_3;
            this.curveTo(_local_7,_local_8,_local_9,_local_10);
            _local_16++;
         }
         if(_arg_6)
         {
            this.lineTo(_arg_1,_arg_2);
         }
      }
      
      public function drawEllipse(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = Math.PI / 4;
         var _local_10:Number = 0;
         var _local_11:Number = _arg_3 / Math.cos(_local_9 / 2);
         var _local_12:Number = _arg_4 / Math.cos(_local_9 / 2);
         this.moveTo(_arg_1 + _arg_3,_arg_2);
         var _local_13:Number = 0;
         while(_local_13 < 8)
         {
            _local_10 += _local_9;
            _local_5 = _arg_1 + Math.cos(_local_10 - _local_9 / 2) * _local_11;
            _local_6 = _arg_2 + Math.sin(_local_10 - _local_9 / 2) * _local_12;
            _local_7 = _arg_1 + Math.cos(_local_10) * _arg_3;
            _local_8 = _arg_2 + Math.sin(_local_10) * _arg_4;
            this.curveTo(_local_5,_local_6,_local_7,_local_8);
            _local_13++;
         }
      }
      
      public function drawTriangle(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number = 0) : void
      {
         _arg_6 = _arg_6 * Math.PI / 180;
         _arg_5 = _arg_5 * Math.PI / 180;
         var _local_7:Number = Math.cos(_arg_5 - _arg_6) * _arg_3;
         var _local_8:Number = Math.sin(_arg_5 - _arg_6) * _arg_3;
         var _local_9:Number = Math.cos(-_arg_6) * _arg_4;
         var _local_10:Number = Math.sin(-_arg_6) * _arg_4;
         this.drawLine(0 + _arg_1,0 + _arg_2,_local_9 - 0 + _arg_1,_local_10 - 0 + _arg_2);
         this.lineTo(_local_7 - 0 + _arg_1,_local_8 - 0 + _arg_2);
         this.lineTo(0 + _arg_1,0 + _arg_2);
      }
      
      public function drawRegularPolygon(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number = 0) : void
      {
         _arg_5 = _arg_5 * Math.PI / 180;
         var _local_6:Number = 2 * Math.PI / _arg_3;
         var _local_7:Number = _arg_4 / 2 / Math.sin(_local_6 / 2);
         var _local_8:Number = Math.cos(_arg_5) * _local_7 + _arg_1;
         var _local_9:Number = Math.sin(_arg_5) * _local_7 + _arg_2;
         this.moveTo(_local_8,_local_9);
         var _local_10:Number = 1;
         while(_local_10 <= _arg_3)
         {
            _local_8 = Math.cos(_local_6 * _local_10 + _arg_5) * _local_7 + _arg_1;
            _local_9 = Math.sin(_local_6 * _local_10 + _arg_5) * _local_7 + _arg_2;
            this.lineTo(_local_8,_local_9);
            _local_10++;
         }
      }
      
      public function drawStar(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number = 0) : void
      {
         if(_arg_3 < 3)
         {
            return;
         }
         var _local_7:Number = Math.PI * 2 / _arg_3;
         _arg_6 = Math.PI * (_arg_6 - 90) / 180;
         var _local_8:Number = _arg_6;
         var _local_9:Number = _arg_1 + Math.cos(_local_8 + _local_7 / 2) * _arg_4;
         var _local_10:Number = _arg_2 + Math.sin(_local_8 + _local_7 / 2) * _arg_4;
         this.moveTo(_local_9,_local_10);
         _local_8 += _local_7;
         var _local_11:Number = 0;
         while(_local_11 < _arg_3)
         {
            _local_9 = _arg_1 + Math.cos(_local_8) * _arg_5;
            _local_10 = _arg_2 + Math.sin(_local_8) * _arg_5;
            this.lineTo(_local_9,_local_10);
            _local_9 = _arg_1 + Math.cos(_local_8 + _local_7 / 2) * _arg_4;
            _local_10 = _arg_2 + Math.sin(_local_8 + _local_7 / 2) * _arg_4;
            this.lineTo(_local_9,_local_10);
            _local_8 += _local_7;
            _local_11++;
         }
      }
   }
}

