package alternativa.tanks.utils
{
   public class MathUtils
   {
      
      public static const PI2:Number = 2 * Math.PI;
      
      public function MathUtils()
      {
         super();
      }
      
      public static function clamp(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         if(_arg_1 < _arg_2)
         {
            return _arg_2;
         }
         if(_arg_1 > _arg_3)
         {
            return _arg_3;
         }
         return _arg_1;
      }
      
      public static function clampAngle(_arg_1:Number) : Number
      {
         _arg_1 %= PI2;
         if(_arg_1 < -Math.PI)
         {
            return PI2 + _arg_1;
         }
         if(_arg_1 > Math.PI)
         {
            return _arg_1 - PI2;
         }
         return _arg_1;
      }
      
      public static function clampAngleFast(_arg_1:Number) : Number
      {
         if(_arg_1 < -Math.PI)
         {
            return PI2 + _arg_1;
         }
         if(_arg_1 > Math.PI)
         {
            return _arg_1 - PI2;
         }
         return _arg_1;
      }
      
      public static function toDegrees(_arg_1:Number) : Number
      {
         return _arg_1 * 180 / Math.PI;
      }
      
      public static function toRadians(_arg_1:Number) : Number
      {
         return _arg_1 * Math.PI / 180;
      }
      
      public static function getBitValue(_arg_1:int, _arg_2:int) : int
      {
         return _arg_1 >> _arg_2 & 1;
      }
      
      public static function changeBitValue(_arg_1:int, _arg_2:int, _arg_3:Boolean) : int
      {
         if(_arg_3)
         {
            return _arg_1 | 1 << _arg_2;
         }
         return _arg_1 & ~(1 << _arg_2);
      }
      
      public static function moveValueTowards(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         if(_arg_1 < _arg_2)
         {
            _arg_1 += _arg_3;
            return _arg_1 > _arg_2 ? Number(_arg_2) : Number(_arg_1);
         }
         if(_arg_1 > _arg_2)
         {
            _arg_1 -= _arg_3;
            return _arg_1 < _arg_2 ? Number(_arg_2) : Number(_arg_1);
         }
         return _arg_1;
      }
      
      public static function snap(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         if(_arg_1 > _arg_2 - _arg_3 && _arg_1 < _arg_2 + _arg_3)
         {
            return _arg_2;
         }
         return _arg_1;
      }
      
      public static function sign(_arg_1:Number) : Number
      {
         if(_arg_1 < 0)
         {
            return -1;
         }
         if(_arg_1 > 0)
         {
            return 1;
         }
         return 0;
      }
      
      public static function numberSign(_arg_1:Number, _arg_2:Number) : Number
      {
         if(_arg_1 < 0)
         {
            return _arg_1 < -_arg_2 ? Number(-1) : Number(0);
         }
         if(_arg_1 > 0)
         {
            return _arg_1 > _arg_2 ? Number(1) : Number(0);
         }
         return 0;
      }
      
      public static function numbersEqual(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Boolean
      {
         var _local_4:Number = _arg_1 - _arg_2;
         if(_local_4 < 0)
         {
            return _local_4 > -_arg_3;
         }
         return _local_4 < _arg_3;
      }
      
      public static function nearestPowerOf2(_arg_1:int) : int
      {
         return 1 << Math.ceil(Math.log(_arg_1) / Math.LN2);
      }
   }
}

