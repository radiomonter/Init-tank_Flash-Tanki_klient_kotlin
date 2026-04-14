package obfuscation.kyre
{
   import alternativa.math.Vector3;
   
   public class Wyhe
   {
      
      private static const A:Vector3 = new Vector3();
      
      private static const V:Vector3 = new Vector3();
      
      public function Wyhe()
      {
         super();
      }
      
      public static function test(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3, _arg_5:Vector3, _arg_6:Number, _arg_7:Number) : Boolean
      {
         A.diff(_arg_1,_arg_4);
         var _local_8:Number = _arg_3 + _arg_6;
         var _local_9:Number = A.dot(A) - _local_8 * _local_8;
         if(_local_9 < 0)
         {
            return true;
         }
         V.diff(_arg_2,_arg_5);
         var _local_10:Number = V.dot(V);
         if(_local_10 < 0.0001)
         {
            return false;
         }
         var _local_11:Number = A.dot(V);
         if(_local_11 > 0)
         {
            return false;
         }
         var _local_12:Number = _local_11 * _local_11 - _local_10 * _local_9;
         if(_local_12 < 0)
         {
            return false;
         }
         var _local_13:Number = Math.sqrt(_local_12);
         var _local_14:Number = (-_local_11 - _local_13) / _local_10;
         return _local_14 < _arg_7;
      }
   }
}

