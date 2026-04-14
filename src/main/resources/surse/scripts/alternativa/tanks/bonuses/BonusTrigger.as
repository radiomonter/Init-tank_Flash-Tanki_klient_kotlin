package alternativa.tanks.bonuses
{
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.Trigger;
   import obfuscation.kyre.Myw;
   
   public class BonusTrigger extends BattleRunnerProvider implements Trigger
   {
      
      private var bonus:BattleBonus;
      
      private var collisionBox:CollisionBox;
      
      public function BonusTrigger(_arg_1:BattleBonus)
      {
         super();
         this.bonus = _arg_1;
         var _local_2:Number = BonusConst.BONUS_HALF_SIZE;
         this.collisionBox = new CollisionBox(new Vector3(_local_2,_local_2,_local_2),Myw.kyrupecan,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      public function enable() : void
      {
         fahysemas().wapicyjim(this);
      }
      
      public function disable() : void
      {
         fahysemas().zegyrak(this);
      }
      
      public function update(_arg_1:Matrix4) : void
      {
         var _local_2:Matrix4 = this.collisionBox.transform;
         _local_2.copy(_arg_1);
         this.collisionBox.calculateAABB();
      }
      
      public function updateByComponents(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:int, _arg_6:Number) : void
      {
         var _local_7:Matrix4 = this.collisionBox.transform;
         _local_7.setMatrix(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
         this.collisionBox.calculateAABB();
      }
      
      public function setTransform(_arg_1:Vector3, _arg_2:Matrix3) : void
      {
         var _local_3:Matrix4 = this.collisionBox.transform;
         _local_3.setFromMatrix3(_arg_2,_arg_1);
         this.collisionBox.calculateAABB();
      }
      
      public function checkTrigger(_arg_1:Body) : void
      {
         var _local_2:CollisionShape = null;
         var _local_3:int = 0;
         while(_local_3 < _arg_1.numCollisionShapes)
         {
            _local_2 = _arg_1.collisionShapes[_local_3];
            if(fahysemas().soc().testCollision(_local_2,this.collisionBox))
            {
               this.bonus.onTriggerActivated();
               return;
            }
            _local_3++;
         }
      }
   }
}

