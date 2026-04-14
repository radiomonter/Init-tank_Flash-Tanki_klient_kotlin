package alternativa.tanks.bonuses
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class FallController implements BonusController
   {
      
      private static const MAX_ANGLE_X:Number = 0.1;
      
      private static const ANGLE_X_FREQ:Number = 1;
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const v:Vector3 = new Vector3();
      
      private const interpolatedMatrix:Matrix3 = new Matrix3();
      
      private const interpolatedVector:Vector3 = new Vector3();
      
      private const oldState:BattleBonusState = new BattleBonusState();
      
      private const newState:BattleBonusState = new BattleBonusState();
      
      private const interpolatedState:BattleBonusState = new BattleBonusState();
      
      private var battleBonus:BattleBonus;
      
      private var minPivotZ:Number;
      
      private var time:Number;
      
      private var fallSpeed:Number;
      
      private var t0:Number;
      
      private var x:Number = 0;
      
      private var y:Number = 0;
      
      public function FallController(_arg_1:BattleBonus)
      {
         super();
         this.battleBonus = _arg_1;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : void
      {
         this.x = _arg_1.x;
         this.y = _arg_1.y;
         this.newState.pivotZ = _arg_1.z + BonusConst.BONUS_OFFSET_Z - _arg_2 * _arg_5;
         this.newState.angleZ = _arg_6 + BonusConst.ANGULAR_SPEED_Z * _arg_5;
         this.fallSpeed = _arg_2;
         this.minPivotZ = _arg_3;
         this.t0 = _arg_4;
         this.time = _arg_5;
      }
      
      public function start() : void
      {
      }
      
      public function runBeforePhysicsUpdate(_arg_1:Number) : void
      {
         this.oldState.copy(this.newState);
         this.time += _arg_1;
         this.newState.pivotZ -= this.fallSpeed * _arg_1;
         this.newState.angleX = MAX_ANGLE_X * Math.sin(ANGLE_X_FREQ * (this.t0 + this.time));
         this.newState.angleZ += BonusConst.ANGULAR_SPEED_Z * _arg_1;
         if(this.newState.pivotZ <= this.minPivotZ)
         {
            this.newState.pivotZ = this.minPivotZ;
            this.newState.angleX = 0;
            this.interpolatePhysicsState(1);
            this.render();
            this.battleBonus.onTouchGround();
         }
         this.updateTrigger();
      }
      
      private function updateTrigger() : void
      {
         m.setRotationMatrix(this.newState.angleX,0,this.newState.angleZ);
         m.transformVector(Vector3.DOWN,v);
         v.scale(BonusConst.BONUS_OFFSET_Z);
         var _local_1:BonusTrigger = this.battleBonus.getTrigger();
         _local_1.updateByComponents(this.x + v.x,this.y + v.y,this.newState.pivotZ + v.z,this.newState.angleX,0,this.newState.angleZ);
      }
      
      public function interpolatePhysicsState(_arg_1:Number) : void
      {
         this.interpolatedState.interpolate(this.oldState,this.newState,_arg_1);
         this.interpolatedMatrix.setRotationMatrix(this.interpolatedState.angleX,0,this.interpolatedState.angleZ);
         this.interpolatedMatrix.transformVector(Vector3.DOWN,this.interpolatedVector);
      }
      
      public function render() : void
      {
         this.setObjectTransform(this.battleBonus.getParachute(),BonusConst.PARACHUTE_OFFSET_Z,this.interpolatedVector);
         this.setObjectTransform(this.battleBonus.getBonusMesh(),BonusConst.BONUS_OFFSET_Z,this.interpolatedVector);
         this.battleBonus.getCords().updateVertices();
      }
      
      private function setObjectTransform(_arg_1:Object3DWrapper, _arg_2:Number, _arg_3:Vector3) : void
      {
         _arg_1.setRotationComponents(this.interpolatedState.angleX,0,this.interpolatedState.angleZ);
         _arg_1.setPositionComponents(this.x + _arg_2 * _arg_3.x,this.y + _arg_2 * _arg_3.y,this.interpolatedState.pivotZ + _arg_2 * _arg_3.z);
      }
   }
}

