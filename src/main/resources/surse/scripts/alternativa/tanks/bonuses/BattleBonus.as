package alternativa.tanks.bonuses
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.PhysicsController;
   import alternativa.tanks.battle.PhysicsInterpolator;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.Vyfeqyfy;
   import org1.osflash.signals.ISignal;
   import org1.osflash.signals.Signal;
   
   public class BattleBonus extends PooledObject implements PhysicsController, PhysicsInterpolator, Renderer, Bonus
   {
      
      private static const BIG_VALUE:Number = 10000000000;
      
      private static const FADEOUT_TIME:Number = 1777;
      
      private static const FADEOUT_CURVE:Number = 1 / 0.777;
      
      private static const N:Vector3 = new Vector3();
      
      private static const P:Vector3 = new Vector3();
      
      private static const P1:Vector3 = new Vector3();
      
      private static const X:Vector3 = new Vector3();
      
      private static const Y:Vector3 = new Vector3();
      
      private static const Y1:Vector3 = new Vector3();
      
      private static const origin:Vector3 = new Vector3();
      
      private static const _RayIntersection:RayHit = new RayHit();
      
      private static const _bonusTransform:Matrix4 = new Matrix4();
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const m1:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const offsetVector:Vector3 = new Vector3();
      
      private static const _bonusPosition:Vector3 = new Vector3();
      
      public const onPickup:ISignal = new Signal();
      
      public const onRemove:ISignal = new Signal();
      
      public const onDestroy:ISignal = new Signal();
      
      private const onTankCollision:ISignal = new Signal();
      
      private var bonusMesh:BonusMesh;
      
      private var parachute:Parachute;
      
      private var cords:Cords;
      
      private var lightSource:OmniLight;
      
      private var battleService:BattleService;
      
      private var fallSpeed:Number = 0;
      
      private var bonusObjectId:String;
      
      private var data:BattleBonusData;
      
      private var _bonusId:String;
      
      private var controllersActive:Boolean;
      
      private var trigger:BonusTrigger;
      
      private var controllers:Vector.<BonusController> = new Vector.<BonusController>();
      
      private var currentController:BonusController;
      
      private var fallController:FallController;
      
      private var landingController:LandingController;
      
      private var globalLightIntensity:Number;
      
      public function BattleBonus(_arg_1:Pool)
      {
         super(_arg_1);
         this.trigger = new BonusTrigger(this);
         this.fallController = new FallController(this);
         this.landingController = new LandingController(this);
         this.lightSource = new OmniLight(0,0,0);
      }
      
      private static function isFlatSurface(_arg_1:Vector3) : Boolean
      {
         return _arg_1.z > BonusConst.COS_ONE_DEGREE;
      }
      
      public function init(_arg_1:String, _arg_2:String, _arg_3:BattleBonusData, _arg_4:BattleService) : void
      {
         this.bonusObjectId = _arg_1;
         this._bonusId = _arg_2;
         this.data = _arg_3;
         this.battleService = _arg_4;
         this.controllers.length = 0;
      }
      
      private function initLight() : void
      {
         this.globalLightIntensity = 1;
         this.lightSource.color = this.data.lightColor;
         this.lightSource.attenuationBegin = this.data.attenuationBegin;
         this.lightSource.attenuationEnd = this.data.attenuationEnd;
         this.lightSource.intensity = this.data.lightIntensity * this.globalLightIntensity;
         this.lightSource.calculateBounds();
         this.bonusMesh.readPosition(origin);
         this.lightSource.x = origin.x;
         this.lightSource.y = origin.y;
         this.lightSource.z = origin.z;
         this.battleService.getBattleScene3D().addObject(this.lightSource);
      }
      
      public function spawn(_arg_1:Vector3, _arg_2:int, _arg_3:Number, _arg_4:Function) : void
      {
         this.fallSpeed = _arg_3;
         this.onTankCollision.add(_arg_4);
         this.initBonusMesh();
         this.controllersActive = false;
         this.controllers.length = 0;
         this.getGroundPointAndNormal(_arg_1,P,N);
         if(this.isUnderCeil(_arg_1))
         {
            this.initOnGround(P,N);
         }
         else
         {
            this.initAirborne(_arg_1,P,N,_arg_2);
            this.trigger.enable();
         }
         this.initRemovalAnimation();
         if(this.runNextController())
         {
            this.activateRendererAndPhysicsController();
         }
         this.initLight();
      }
      
      private function initOnGround(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:Number = NaN;
         offsetVector.reset(0,0,BonusConst.BONUS_HALF_SIZE);
         if(isFlatSurface(_arg_2))
         {
            eulerAngles.reset(0,0,this.getStartingAngleZ());
         }
         else
         {
            axis.cross2(Vector3.Z_AXIS,_arg_2);
            axis.normalize();
            _local_3 = Math.acos(_arg_2.z);
            m.fromAxisAngle(axis,_local_3);
            m1.setRotationMatrix(0,0,this.getStartingAngleZ());
            m1.append(m);
            m1.getEulerAngles(eulerAngles);
            offsetVector.transform3(m);
         }
         this.bonusMesh.setRotation(eulerAngles);
         this.bonusMesh.setPositionComponents(_arg_1.x + offsetVector.x,_arg_1.y + offsetVector.y,_arg_1.z + offsetVector.z);
         this.updateTriggerFromMesh();
         this.bonusMesh.addToScene();
         this.startGroundSpawnAnimation();
      }
      
      private function startGroundSpawnAnimation() : void
      {
         var _local_1:GroundSpawnRenderer = GroundSpawnRenderer(this.battleService.getObjectPool().getObject(GroundSpawnRenderer));
         _local_1.start(this);
      }
      
      private function updateTriggerFromMesh() : void
      {
         this.bonusMesh.readTransform(_bonusTransform);
         this.trigger.update(_bonusTransform);
      }
      
      private function getStartingAngleZ() : Number
      {
         return Math.PI * 10 * parseInt(this.bonusId.split("_")[1]) / 180;
      }
      
      private function initAirborne(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:int) : void
      {
         var _local_5:Number = NaN;
         if(isFlatSurface(_arg_3))
         {
            _local_5 = this.calculateFallTime(_arg_1,_arg_2);
            P1.copy(_arg_2);
         }
         else
         {
            X.cross2(_arg_3,Vector3.Z_AXIS);
            X.normalize();
            Y.cross2(_arg_3,X);
            Y1.cross2(Vector3.Z_AXIS,X);
            origin.copy(_arg_1);
            origin.addScaled(-BonusConst.BONUS_HALF_SIZE,Y1);
            P1.copy(_arg_2);
            P1.addScaled(-BonusConst.BONUS_HALF_SIZE / _arg_3.z,Y);
            if(this.battleService.getBattleRunner().soc().raycastStatic(origin,Vector3.DOWN,Myw.dyhan,BIG_VALUE,null,_RayIntersection))
            {
               if(_arg_2.z < _RayIntersection.position.z && _RayIntersection.position.z < P1.z)
               {
                  P1.addScaled(BonusConst.BONUS_HALF_SIZE / _arg_3.z * (P1.z - _RayIntersection.position.z) / (P1.z - _arg_2.z),Y);
               }
            }
            _local_5 = this.calculateFallTime(_arg_1,P1);
            this.landingController.init(P1,_arg_3);
            this.controllers.push(this.landingController);
         }
         var _local_6:Number = P1.z + BonusConst.BONUS_HALF_SIZE + BonusConst.BONUS_OFFSET_Z;
         var _local_7:Number = this.getStartingAngleZ();
         if(_local_5 * 1000 <= _arg_4)
         {
            this.bonusMesh.setPositionComponents(P1.x,P1.y,P1.z + BonusConst.BONUS_HALF_SIZE);
            this.bonusMesh.setRotationZ(_local_7 + _local_5 * BonusConst.ANGULAR_SPEED_Z);
            this.updateTriggerFromMesh();
            this.bonusMesh.addToScene();
         }
         else
         {
            this.initParachute();
            this.addAllToScene();
            this.startSpawnAnimation(this.battleService);
            this.fallController.init(_arg_1,this.fallSpeed,_local_6,-_local_5,_arg_4 / 1000,_local_7);
            this.controllers.push(this.fallController);
         }
      }
      
      private function isUnderCeil(_arg_1:Vector3) : Boolean
      {
         var _local_2:TanksCollisionDetector = this.battleService.getBattleRunner().soc();
         return _local_2.hasStaticHit(_arg_1,Vector3.Z_AXIS,Myw.dyhan,BIG_VALUE);
      }
      
      private function getGroundPointAndNormal(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_4:TanksCollisionDetector = this.battleService.getBattleRunner().soc();
         if(_local_4.raycastStatic(_arg_1,Vector3.DOWN,Myw.dyhan,BIG_VALUE,null,_RayIntersection))
         {
            _arg_3.copy(_RayIntersection.normal);
            _arg_2.copy(_RayIntersection.position);
         }
         else
         {
            _arg_3.copy(Vector3.Z_AXIS);
            _arg_2.copy(_arg_1);
            _arg_2.z -= 1000;
         }
      }
      
      public function get bonusId() : String
      {
         return this._bonusId;
      }
      
      public function pickup() : void
      {
         this.onPickup.dispatch();
         this.playPickupSound();
         this.detachParachute();
         this.startPickupAnimation();
         this.destroy();
      }
      
      private function playPickupSound() : void
      {
         var _local_1:Sound3D = null;
         if(this.data.pickupSound != null)
         {
            _local_1 = Sound3D.create(this.data.pickupSound,0.5);
            this.bonusMesh.readPosition(_bonusPosition);
            this.battleService.wikyhih(Sound3DEffect.create(_bonusPosition,_local_1));
         }
      }
      
      private function startPickupAnimation() : void
      {
         var _local_1:BonusPickupAnimation = BonusPickupAnimation(this.battleService.getObjectPool().getObject(BonusPickupAnimation));
         _local_1.start(this.bonusMesh);
         this.bonusMesh = null;
      }
      
      public function remove() : void
      {
         this.onRemove.dispatch();
         this.bonusMesh = null;
         this.destroy();
      }
      
      private function destroy() : void
      {
         this.onDestroy.dispatch();
         this.onPickup.removeAll();
         this.onRemove.removeAll();
         this.onDestroy.removeAll();
         this.destroyBonusMesh();
         this.destroyParachute();
         this.deactivateRendererAndPhysicsController();
         this.removeLight();
         this.trigger.disable();
         this.onTankCollision.removeAll();
         this.battleService = null;
         this.data = null;
         recycle();
      }
      
      private function destroyBonusMesh() : void
      {
         if(this.bonusMesh != null)
         {
            this.bonusMesh.removeFromScene();
            this.bonusMesh.recycle();
            this.bonusMesh = null;
         }
      }
      
      private function destroyParachute() : void
      {
         if(this.parachute != null)
         {
            this.parachute.removeFromScene();
            this.parachute.recycle();
            this.parachute = null;
            this.cords.removeFromScene();
            this.cords.recycle();
            this.cords = null;
         }
      }
      
      private function calculateFallTime(_arg_1:Vector3, _arg_2:Vector3) : Number
      {
         return (_arg_1.z - _arg_2.z - BonusConst.BONUS_HALF_SIZE) / this.fallSpeed;
      }
      
      private function initRemovalAnimation() : void
      {
         var _local_2:RemovalAnimation = RemovalAnimation(this.battleService.getObjectPool().getObject(RemovalAnimation));
         _local_2.init(this);
      }
      
      private function startSpawnAnimation(_arg_1:BattleService) : void
      {
         var _local_2:SpawnAnimation = SpawnAnimation(this.battleService.getObjectPool().getObject(SpawnAnimation));
         _local_2.start(this);
      }
      
      private function activateRendererAndPhysicsController() : void
      {
         if(!this.controllersActive)
         {
            this.controllersActive = true;
            this.battleService.getBattleRunner().wefoderu(this);
            this.battleService.getBattleRunner().fugimok(this);
            this.battleService.getBattleScene3D().toqok(this,0);
         }
      }
      
      private function initParachute() : void
      {
         if(BonusCache.isParachuteCacheEmpty())
         {
            this.parachute = new Parachute(this.data.parachuteOuterMesh,this.data.parachuteInnerMesh);
         }
         else
         {
            this.parachute = BonusCache.getParachute();
         }
         if(BonusCache.isCordsCacheEmpty())
         {
            this.cords = new Cords(Parachute.RADIUS,BonusConst.BONUS_HALF_SIZE,Parachute.NUM_STRAPS,this.data.cordsMaterial);
         }
         else
         {
            this.cords = BonusCache.getCords();
         }
         this.cords.init(this.bonusMesh,this.parachute);
      }
      
      private function initBonusMesh() : void
      {
         if(BonusCache.isBonusMeshCacheEmpty(this.bonusObjectId))
         {
            this.bonusMesh = new BonusMesh(this.bonusObjectId,this.data.boxMesh);
         }
         else
         {
            this.bonusMesh = BonusMesh(BonusCache.getBonusMesh(this.bonusObjectId));
         }
         this.bonusMesh.init();
      }
      
      private function addAllToScene() : void
      {
         this.parachute.addToScene();
         this.bonusMesh.addToScene();
         this.cords.addToScene();
      }
      
      public function runBeforePhysicsUpdate(_arg_1:Number) : void
      {
         this.currentController.runBeforePhysicsUpdate(_arg_1);
      }
      
      private function deactivateRendererAndPhysicsController() : void
      {
         if(this.controllersActive)
         {
            this.controllersActive = false;
            this.battleService.getBattleRunner().kigunig(this);
            this.battleService.getBattleRunner().kufoq(this);
            this.battleService.getBattleScene3D().qahakuve(this,0);
         }
      }
      
      private function detachParachute() : void
      {
         var _local_1:ParachuteDetachAnimation = null;
         if(this.parachute != null)
         {
            _local_1 = ParachuteDetachAnimation(this.battleService.getObjectPool().getObject(ParachuteDetachAnimation));
            _local_1.start(this.parachute,this.cords,this.fallSpeed / 2);
            this.parachute = null;
            this.cords = null;
         }
      }
      
      public function interpolatePhysicsState(_arg_1:Number) : void
      {
         this.currentController.interpolatePhysicsState(_arg_1);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.currentController.render();
         this.bonusMesh.readPosition(origin);
         this.lightSource.intensity = this.globalLightIntensity * this.data.lightIntensity;
         this.lightSource.x = origin.x;
         this.lightSource.y = origin.y;
         this.lightSource.z = origin.z;
      }
      
      public function setAlpha(_arg_1:Number) : void
      {
         this.bonusMesh.setAlpha(_arg_1);
         if(this.parachute != null)
         {
            this.parachute.setAlpha(_arg_1);
            this.cords.setAlpha(_arg_1);
         }
      }
      
      public function onTriggerActivated() : void
      {
         this.trigger.disable();
         this.onTankCollision.dispatch(this);
      }
      
      public function onTouchGround() : void
      {
         this.detachParachute();
         if(!this.runNextController())
         {
            this.stopMovement();
         }
      }
      
      public function onLandingComplete() : void
      {
         this.stopMovement();
      }
      
      private function stopMovement() : void
      {
         this.deactivateRendererAndPhysicsController();
      }
      
      public function getBonusMesh() : BonusMesh
      {
         return this.bonusMesh;
      }
      
      private function runNextController() : Boolean
      {
         this.currentController = this.controllers.pop();
         if(this.currentController == null)
         {
            return false;
         }
         this.currentController.start();
         return true;
      }
      
      public function getParachute() : Parachute
      {
         return this.parachute;
      }
      
      public function getCords() : Cords
      {
         return this.cords;
      }
      
      public function getTrigger() : BonusTrigger
      {
         return this.trigger;
      }
      
      public function enableTrigger() : void
      {
         this.trigger.enable();
      }
      
      private function removeLight() : void
      {
         var _local_1:Vyfeqyfy = null;
         if(this.lightSource.parent != null)
         {
            this.battleService.getBattleScene3D().removeObject(this.lightSource);
            _local_1 = Vyfeqyfy(this.battleService.getObjectPool().getObject(Vyfeqyfy));
            _local_1.init(this.lightSource,FADEOUT_TIME,FADEOUT_CURVE);
            this.battleService.getBattleScene3D().addGraphicEffect(_local_1);
         }
      }
   }
}

