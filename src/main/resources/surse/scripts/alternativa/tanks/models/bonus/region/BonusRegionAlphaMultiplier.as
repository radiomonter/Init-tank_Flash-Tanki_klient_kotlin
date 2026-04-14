package alternativa.tanks.models.bonus.region
{
   public class BonusRegionAlphaMultiplier
   {
      
      private static const MIN_MULTIPLIER:Number = 0;
      
      private static const MAX_MULTIPLIER:Number = 1;
      
      private var _startTime:int;
      
      private var _duration:int;
      
      private var _startAlphaMesh:Number;
      
      private var _newAlpha:Number;
      
      public function BonusRegionAlphaMultiplier()
      {
         super();
      }
      
      private static function clamp(_arg_1:Number) : Number
      {
         return Math.max(MIN_MULTIPLIER,Math.min(MAX_MULTIPLIER,_arg_1));
      }
      
      public function init(_arg_1:int, _arg_2:int, _arg_3:Number) : void
      {
         this._startTime = _arg_1;
         this._duration = _arg_2;
         this._startAlphaMesh = _arg_3;
      }
      
      public function reset() : void
      {
         this._startTime = -1;
         this._duration = 0;
      }
      
      public function getAlphaMultiplier(_arg_1:int, _arg_2:Boolean) : Number
      {
         if(_arg_1 > this._startTime + this._duration)
         {
            if(_arg_2)
            {
               return MAX_MULTIPLIER;
            }
            return MIN_MULTIPLIER;
         }
         var _local_3:Number = (_arg_1 - this._startTime) / this._duration;
         if(!_arg_2)
         {
            _local_3 = 1 - _local_3;
         }
         return clamp(_local_3);
      }
      
      public function getAlpha(_arg_1:int, _arg_2:Boolean) : Number
      {
         var _local_4:Number = NaN;
         if(_arg_1 > this._startTime + this._duration)
         {
            if(_arg_2)
            {
               return MAX_MULTIPLIER;
            }
            return MIN_MULTIPLIER;
         }
         var _local_3:Number = (_arg_1 - this._startTime) / this._duration;
         if(_arg_2)
         {
            _local_4 = this._startAlphaMesh + (1 - this._startAlphaMesh) * _local_3;
         }
         else
         {
            _local_4 = this._startAlphaMesh * (1 - _local_3);
         }
         return clamp(_local_4);
      }
      
      public function get startAlphaMesh() : Number
      {
         return this._startAlphaMesh;
      }
      
      public function get newAlpha() : Number
      {
         return this._newAlpha;
      }
      
      public function set newAlpha(_arg_1:Number) : void
      {
         this._newAlpha = _arg_1;
      }
   }
}

