package obfuscation.mujusaqim
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.CTFTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.CommonTargetEvaluatorConst;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import obfuscation.bude.BattleTeam;
   
   public class Lib implements CommonTargetEvaluator, CTFTargetEvaluator
   {
      
      private static const sasukah:Number = 5;
      
      private var fejahuda:BattleTeam;
      
      private var ryzil:Body;
      
      public function Lib()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.fejahuda = _arg_1;
      }
      
      public function siga(_arg_1:Body) : void
      {
         this.ryzil = _arg_1;
      }
      
      public function roruqily(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Number
      {
         var _local_6:Number = NaN;
         var _local_7:Tank = _arg_1.tank;
         if(_local_7.tankData.health > 0 && !_local_7.fiveqejav(this.fejahuda))
         {
            _local_6 = _arg_1 == this.ryzil ? Number(sasukah) : Number(0);
            return CommonTargetEvaluatorConst.jecam - (CommonTargetEvaluatorConst.hatycag * _arg_2 / _arg_4 + (1 - CommonTargetEvaluatorConst.hatycag) * Math.abs(_arg_3) / _arg_5) + _local_6;
         }
         return 0;
      }
   }
}

