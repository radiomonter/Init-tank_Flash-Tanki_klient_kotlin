package obfuscation.fatik
{
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Fujujys
   {
      
      private static const hatycag:Number = 0.65;
      
      public function Fujujys()
      {
         super();
      }
      
      protected static function bebohid(_arg_1:Tank, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : Number
      {
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         if(_arg_1.tankData.health > 0)
         {
            _local_7 = hatycag * _arg_3 / _arg_5 + (1 - hatycag) * _arg_4 / _arg_6;
            _local_8 = _arg_2 == 0 ? Number(2) : Number(0);
            return 1 - _local_7 + _local_8;
         }
         return 0;
      }
   }
}

