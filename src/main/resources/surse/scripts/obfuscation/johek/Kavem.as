package obfuscation.johek
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.battle.battlefield.CommonTargetEvaluatorConst;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   
   public class Kavem implements CommonTargetEvaluator
   {
      
      public function Kavem()
      {
         super();
      }
      
      public function roruqily(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Number
      {
         if(_arg_1.tank.tankData.health > 0)
         {
            return CommonTargetEvaluatorConst.jecam - (CommonTargetEvaluatorConst.hatycag * _arg_2 / _arg_4 + (1 - CommonTargetEvaluatorConst.hatycag) * Math.abs(_arg_3) / _arg_5);
         }
         return 0;
      }
   }
}

