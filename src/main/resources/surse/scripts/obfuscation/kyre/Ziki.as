package obfuscation.kyre
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   
   public class Ziki
   {
      
      private static const nycatamy:Number = 200;
      
      private var nyzo:Vector3Validator;
      
      private var physicsScene:PhysicsScene;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public function Ziki(_arg_1:int, _arg_2:Number, _arg_3:BattleEventDispatcher)
      {
         super();
         this.battleEventDispatcher = _arg_3;
         this.physicsScene = new PhysicsScene();
         this.physicsScene.gravity.reset(0,0,-_arg_2);
         this.nyzo = new Vector3Validator(this.physicsScene.gravity);
         this.physicsScene.collisionIterations = 4;
         this.physicsScene.contactIterations = 4;
         this.physicsScene.allowedPenetration = 5;
         this.collisionDetector = new TanksCollisionDetector();
         this.physicsScene.collisionDetector = this.collisionDetector;
         this.physicsScene.time = _arg_1;
      }
      
      public function zyqityget(_arg_1:Number) : void
      {
         this.physicsScene.gravity.z = -_arg_1;
      }
      
      public function hulivyjam() : int
      {
         return this.physicsScene.time;
      }
      
      public function tuhuvika(_arg_1:int) : void
      {
         this.physicsScene.time += _arg_1;
      }
      
      public function pyzujedos(_arg_1:Vector.<CollisionShape>) : void
      {
         this.collisionDetector.dypulefa(_arg_1);
      }
      
      public function soc() : TanksCollisionDetector
      {
         return this.collisionDetector;
      }
      
      public function addBody(_arg_1:Vuwuci) : void
      {
         this.physicsScene.addBody(_arg_1.body);
         this.collisionDetector.polatemu(_arg_1);
      }
      
      public function removeBody(_arg_1:Vuwuci) : void
      {
         this.physicsScene.removeBody(_arg_1.body);
         this.collisionDetector.jag(_arg_1);
      }
      
      public function destroy() : void
      {
         this.collisionDetector.destroy();
      }
      
      public function update(_arg_1:int) : void
      {
         if(this.nyzo.isValid())
         {
            this.physicsScene.update(_arg_1);
            this.toqaco();
         }
         else
         {
            this.physicsScene.time = int.MAX_VALUE;
            this.battleEventDispatcher.nigohif(new DataValidationErrorEvent(DataValidatorType.MEMHACK_GRAVITY));
         }
      }
      
      private function toqaco() : void
      {
         var _local_1:Vuwuci = null;
         var _local_2:Body = null;
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         for each(_local_1 in this.collisionDetector.getTankBodies())
         {
            _local_2 = _local_1.body;
            _local_3 = _local_2.state.velocity;
            _local_4 = BattleUtils.vemoleg;
            _local_2.state.orientation.getZAxis(_local_4);
            _local_5 = _local_3.x * _local_4.x + _local_3.y * _local_4.y + _local_3.z * _local_4.z;
            if(_local_4.z < -0.1 || _local_4.z < 0.1 && _local_5 < 0)
            {
               _local_5 = -_local_5;
               _local_4.reverse();
            }
            _local_1.wuqevylov();
            if(_local_1.coruziva || _local_1.lurivih || _local_1.qiw() || !_local_1.gikemad())
            {
               _local_6 = nycatamy;
               if(!_local_1.coruziva && _local_1.gikemad() && _local_1.wevotus > _local_6)
               {
                  _local_6 = _local_1.wevotus;
               }
               _local_7 = _local_1.gib.dot(_local_4);
               _local_8 = _local_7 * _local_1.body.invMass * BattleRunner.rasomil / 1000;
               if(_local_8 < nycatamy)
               {
                  _local_8 = 0;
               }
               _local_6 = Math.max(_local_8,_local_6);
               if(_local_5 > _local_6)
               {
                  _local_9 = _local_5 - _local_6;
                  _local_3.x -= _local_9 * _local_4.x;
                  _local_3.y -= _local_9 * _local_4.y;
                  _local_3.z -= _local_9 * _local_4.z;
                  _local_5 = _local_6;
               }
            }
            _local_1.wevotus = _local_5;
            _local_1.gib.reset();
         }
      }
      
      public function nifa() : Number
      {
         return this.physicsScene.gravity.z;
      }
   }
}

