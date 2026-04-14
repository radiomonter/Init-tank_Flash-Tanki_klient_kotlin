package obfuscation.qasa
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.CommonTargetEvaluatorConst;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import obfuscation.bude.BattleTeam;
   
   public class Nubiwywyg implements CommonTargetEvaluator, TeamDMTargetEvaluator
   {
      
      private var fejahuda:BattleTeam;
      
      public function Nubiwywyg()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.fejahuda = _arg_1;
      }
      
      public function roruqily(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Number
      {
         var _local_6:Tank = _arg_1.tank;
         if(_local_6.tankData.health > 0 && !_local_6.fiveqejav(this.fejahuda))
         {
            return CommonTargetEvaluatorConst.jecam - (CommonTargetEvaluatorConst.hatycag * _arg_2 / _arg_4 + (1 - CommonTargetEvaluatorConst.hatycag) * Math.abs(_arg_3) / _arg_5);
         }
         return 0;
      }
   }
}

