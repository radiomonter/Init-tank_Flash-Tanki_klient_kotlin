package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.LogicUnit;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import obfuscation.garud.Rib;
   import obfuscation.zajun.Qiqa;
   
   public class Vipopulo extends BattleRunnerProvider implements LogicUnit
   {
      
      private var cahosarih:Qiqa;
      
      private var time:int;
      
      private var tydobe:Boolean;
      
      private var myhop:Rib;
      
      private var wijeju:Number;
      
      private var more:TankSpecification;
      
      public function Vipopulo(_arg_1:Qiqa, _arg_2:Rib, _arg_3:TankSpecification)
      {
         super();
         this.cahosarih = _arg_1;
         this.myhop = _arg_2;
         this.more = _arg_3;
         this.tydobe = false;
         this.time = 0;
      }
      
      public function start() : void
      {
         fahysemas().wop(this);
         this.wijeju = this.myhop.getTurnAcceleration();
      }
      
      public function stop() : void
      {
         fahysemas().bapucic(this);
         this.tydobe = true;
         this.myhop.setMaxTurnSpeed(this.more.turretRotationSpeed,true);
         this.myhop.setTurnAcceleration(this.wijeju);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         if(!this.tydobe)
         {
            this.time += _arg_2;
            _local_3 = this.cahosarih.tikinapys * (this.time + this.cahosarih.targetingTransitionTime) / 1000 / this.cahosarih.kazobilu;
            if(_local_3 > 1)
            {
               _local_3 = 1;
            }
            this.myhop.setMaxTurnSpeed(this.manojymy(_local_3) * this.cahosarih.roz * this.myhop.getTurnAcceleration(),false);
            this.myhop.setTurnAcceleration(this.cahosarih.targetingAcceleration);
         }
      }
      
      private function manojymy(_arg_1:Number) : Number
      {
         var _local_2:Number = this.cahosarih.rotationCoeffT1;
         if(_arg_1 < _local_2)
         {
            return 1;
         }
         var _local_3:Number = this.cahosarih.rotationCoeffT2;
         var _local_4:Number = this.cahosarih.rotationCoeffKmin;
         if(_arg_1 < _local_3)
         {
            return 1 - (1 - _local_4) * (_arg_1 - _local_2) / (_local_3 - _local_2);
         }
         return _local_4;
      }
   }
}

