package utils.graphics
{
   import flash.display.Shape;
   
   public class SectorMask extends Shape
   {
      
      private static const MIN_PROGRESS:Number = 0;
      
      private static const MAX_PROGRESS:Number = 1;
      
      private var _pen:Pen;
      
      private var _radius:int;
      
      private var _size:int;
      
      private var _startProgress:Number;
      
      private var _endProgress:Number;
      
      private var _isReverse:Boolean;
      
      public function SectorMask(_arg_1:Number, _arg_2:Boolean = false)
      {
         super();
         this._size = _arg_1;
         this._isReverse = _arg_2;
         this.init();
      }
      
      private static function clamp(_arg_1:Number) : Number
      {
         return Math.max(MIN_PROGRESS,Math.min(MAX_PROGRESS,_arg_1));
      }
      
      private function init() : void
      {
         this._radius = Math.ceil(Math.sqrt(this._size * this._size + this._size * this._size) / 2);
         this._pen = new Pen(this.graphics);
      }
      
      public function setProgress(_arg_1:Number, _arg_2:Number) : void
      {
         if(this._startProgress == _arg_1 && this._endProgress == _arg_2)
         {
            return;
         }
         this._startProgress = _arg_1;
         this._endProgress = _arg_2;
         var _local_3:Number = 360 * clamp(_arg_1);
         var _local_4:Number = 360 * clamp(_arg_2);
         var _local_5:Number = _local_4 - _local_3;
         var _local_6:Number = !this._isReverse ? Number(_local_3 - 90) : Number(-90);
         this._pen.clear();
         this._pen.beginFill(16711680);
         this._pen.drawArc(this._size / 2,this._size / 2,this._radius,_local_5,_local_6,true);
         this._pen.endFill();
      }
   }
}

