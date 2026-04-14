package alternativa.tanks.display
{
   import alternativa.tanks.sfx.Blinker;
   import obfuscation.modo.Johad;
   
   public class EffectBlinkerUtil
   {
      
      public static const EFFECT_WARNING_PERIOD:int = 3000;
      
      public static const FIRST_AID_WARNING_PERIOD:int = 100000;
      
      public static const INITIAL_BLINK_INTERVAL:int = 300;
      
      public static const MIN_INTERVAL:int = 20;
      
      public static const BLINK_INTERVAL_DECREMENT:int = 30;
      
      public static const FIRST_AID_BLINK_INTERVAL_DECREMENT:int = 0;
      
      public static const MIN_VALUE:Number = 0.2;
      
      public static const MAX_VALUE:Number = 1;
      
      public static const SPEED_COEFF:Number = 10;
      
      public function EffectBlinkerUtil()
      {
         super();
      }
      
      public static function createBlinker(_arg_1:int) : Blinker
      {
         var _local_2:int = 0;
         var _local_3:int = EffectBlinkerUtil.INITIAL_BLINK_INTERVAL;
         var _local_4:int = EffectBlinkerUtil.MIN_INTERVAL;
         var _local_5:Number = EffectBlinkerUtil.MIN_VALUE;
         var _local_6:Number = EffectBlinkerUtil.MAX_VALUE;
         var _local_7:Number = EffectBlinkerUtil.SPEED_COEFF;
         if(_arg_1 == Johad.hocypo)
         {
            _local_2 = EffectBlinkerUtil.FIRST_AID_BLINK_INTERVAL_DECREMENT;
         }
         else
         {
            _local_2 = EffectBlinkerUtil.BLINK_INTERVAL_DECREMENT;
         }
         return new Blinker(_local_3,_local_4,_local_2,_local_5,_local_6,_local_7);
      }
      
      public static function getBlinkingPeriod(_arg_1:int) : int
      {
         if(_arg_1 == Johad.hocypo)
         {
            return EffectBlinkerUtil.FIRST_AID_WARNING_PERIOD;
         }
         return EffectBlinkerUtil.EFFECT_WARNING_PERIOD;
      }
   }
}

