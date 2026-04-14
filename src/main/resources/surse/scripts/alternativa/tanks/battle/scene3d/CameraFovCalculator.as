package alternativa.tanks.battle.scene3d
{
   public class CameraFovCalculator
   {
      
      private static const logamunuq:Number = 12;
      
      private static const rukusewe:Number = 16;
      
      private static const qinomylym:Number = 9;
      
      private static const nymakide:Number = Math.PI / 2;
      
      public function CameraFovCalculator()
      {
         super();
      }
      
      public static function mysepokuw(_arg_1:Number, _arg_2:Number) : Number
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_2 / qinomylym;
         var _local_7:Number = _arg_1 / _local_6;
         if(_local_7 <= logamunuq)
         {
            return nymakide;
         }
         _local_3 = _local_7 - (rukusewe - logamunuq);
         if(_local_3 < logamunuq)
         {
            _local_3 = logamunuq;
         }
         _local_4 = _local_3 * _local_6;
         _local_5 = Math.sqrt(_local_4 * _local_4 + _arg_2 * _arg_2) * 0.5 / Math.tan(nymakide * 0.5);
         return Math.atan(Math.sqrt(_arg_1 * _arg_1 + _arg_2 * _arg_2) * 0.5 / _local_5) * 2;
      }
   }
}

