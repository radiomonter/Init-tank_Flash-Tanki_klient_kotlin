package obfuscation.facod
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.PhysicsController;
   import alternativa.tanks.battle.PhysicsInterpolator;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.errors.IllegalOperationError;
   import obfuscation.kyre.Myw;
   import obfuscation.lyjufaq.Lodywy;
   import obfuscation.lyjufaq.Zokisase;
   
   public class Jybawabaz extends PooledObject implements PhysicsController, Renderer, PhysicsInterpolator, IRayCollisionFilter
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      protected static const thousandth:EncryptedInt = new EncryptedIntImpl(1000);
      
      protected static const levujecad:Matrix3 = new Matrix3();
      
      protected static const verumonuv:RayHit = new RayHit();
      
      protected static const cotosane:Vector3 = new Vector3();
      
      private static const jeburasu:Vector3 = new Vector3();
      
      private static const hico:Vector3 = new Vector3();
      
      private const leci:Number;
      
      private var shotId:int;
      
      protected var hivuf:Boolean;
      
      protected var kipeliri:Boolean;
      
      protected var cupy:Body;
      
      protected var segelehe:Number = 0;
      
      protected var gowoziru:Vector3;
      
      protected var lunyde:Vector3;
      
      protected var loned:Vector3;
      
      protected var hiwanu:Vector3;
      
      protected var roca:Vector3;
      
      protected var nisebi:Vector.<Vector3>;
      
      protected var dynihe:Zokisase;
      
      public function Jybawabaz(_arg_1:Pool)
      {
         var _local_2:int = 0;
         this.leci = 8 == 0 ? 0 : 2 * 3.14159265358979 / 8;
         this.gowoziru = new Vector3();
         this.lunyde = new Vector3();
         this.loned = new Vector3();
         this.hiwanu = new Vector3();
         this.roca = new Vector3();
         super(_arg_1);
         this.nisebi = new Vector.<Vector3>(this.mujid(),true);
         while(_local_2 < this.mujid())
         {
            this.nisebi[_local_2] = new Vector3();
            _local_2++;
         }
      }
      
      private static function teruw(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:int = 0;
         var _local_4:Number = 10000000000;
         var _local_5:Number = _arg_1.x < 0 ? Number(-_arg_1.x) : Number(_arg_1.x);
         if(_local_5 < _local_4)
         {
            _local_4 = _local_5;
            _local_3 = 0;
         }
         _local_5 = _arg_1.y < 0 ? Number(-_arg_1.y) : Number(_arg_1.y);
         if(_local_5 < _local_4)
         {
            _local_4 = _local_5;
            _local_3 = 1;
         }
         _local_5 = _arg_1.z < 0 ? Number(-_arg_1.z) : Number(_arg_1.z);
         if(_local_5 < _local_4)
         {
            _local_3 = 2;
         }
         if(_local_3 == 0)
         {
            _arg_2.reset(0,_arg_1.z,-_arg_1.y);
         }
         else if(_local_3 == 1)
         {
            _arg_2.reset(-_arg_1.z,0,_arg_1.x);
         }
         else if(_local_3 == 2)
         {
            _arg_2.reset(_arg_1.y,-_arg_1.x,0);
         }
      }
      
      protected function mosy() : Zokisase
      {
         if(this.hivuf)
         {
            return Lodywy.INSTANCE;
         }
         return Zokisase(battleService.getObjectPool().getObject(Zokisase));
      }
      
      public function rykysap(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:Body, _arg_4:int = -1) : void
      {
         this.segelehe = 0;
         this.kipeliri = true;
         this.shotId = _arg_4;
         this.hivuf = _arg_4 == -1;
         this.hiwanu.copy(_arg_1.hiwanu);
         this.lunyde.copy(_arg_1.vegenel);
         this.loned.copy(_arg_1.vegenel);
         this.gowoziru.copy(_arg_2);
         this.cupy = _arg_3;
         battleService.getBattleRunner().wefoderu(this);
         battleService.getBattleRunner().fugimok(this);
         battleService.getBattleScene3D().toqok(this,0);
         this.dynihe = this.mosy();
         this.dynihe.start(this.lunyde,_arg_2);
      }
      
      public function runBeforePhysicsUpdate(_arg_1:Number) : void
      {
         if(this.kipeliri)
         {
            this.kipeliri = false;
            this.katyhiteh(_arg_1);
         }
         else
         {
            this.update(_arg_1);
         }
      }
      
      private function katyhiteh(_arg_1:Number) : void
      {
         if(!this.tagadymav())
         {
            this.mikizimez(this.lunyde,this.gowoziru);
            this.update(_arg_1);
         }
      }
      
      protected function tagadymav() : Boolean
      {
         var _local_1:Body = null;
         var _local_2:Vector3 = null;
         var _local_5:int = 0;
         var _local_3:CollisionDetector = battleService.getBattleRunner().soc();
         hico.diff(this.lunyde,this.hiwanu);
         var _local_4:Number = hico.length();
         hico.normalize();
         if(_local_3.raycast(this.hiwanu,hico,Myw.WEAPON,_local_4,this,verumonuv))
         {
            _local_1 = verumonuv.shape.body;
            if(_local_1.tank == null)
            {
               verumonuv.position.subtract(hico);
            }
            this.pawa(_local_1,verumonuv.position,hico,_local_4);
            return true;
         }
         this.mikizimez(this.hiwanu,hico);
         while(_local_5 < this.mujid())
         {
            _local_2 = this.nisebi[_local_5];
            if(_local_3.raycast(_local_2,hico,Myw.WEAPON,_local_4,this,verumonuv))
            {
               _local_1 = verumonuv.shape.body;
               if(BattleUtils.pote(_local_1))
               {
                  cotosane.copy(this.hiwanu).addScaled(verumonuv.t,hico);
                  this.pawa(_local_1,cotosane,hico,_local_4);
                  return true;
               }
            }
            _local_5++;
         }
         return false;
      }
      
      protected function destroy() : void
      {
         battleService.getBattleRunner().kigunig(this);
         battleService.getBattleRunner().kufoq(this);
         battleService.getBattleScene3D().qahakuve(this,0);
         this.dynihe.destroy();
         recycle();
      }
      
      protected function mikizimez(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         teruw(_arg_2,jeburasu);
         jeburasu.normalize().scale(this.gow());
         levujecad.fromAxisAngle(_arg_2,this.leci);
         Vector3(this.nisebi[0]).sum(_arg_1,jeburasu);
         var _local_3:int = 1;
         while(_local_3 < this.mujid())
         {
            jeburasu.transform3(levujecad);
            Vector3(this.nisebi[_local_3]).sum(_arg_1,jeburasu);
            _local_3++;
         }
      }
      
      public function interpolatePhysicsState(_arg_1:Number) : void
      {
         this.roca.interpolate(_arg_1,this.loned,this.lunyde);
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.cupy != _arg_1;
      }
      
      public function jobopa() : int
      {
         return this.shotId;
      }
      
      protected function mujid() : int
      {
         return 8;
      }
      
      protected function update(_arg_1:Number) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function zasesono(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function jiqyjene(_arg_1:Number) : int
      {
         return Math.round(verumonuv.t / _arg_1 * BattleRunner.rasomil);
      }
      
      protected function pawa(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number) : void
      {
         this.zasesono(_arg_1,_arg_2,_arg_3,this.segelehe + verumonuv.t,this.jiqyjene(_arg_4));
      }
      
      protected function gow() : Number
      {
         throw new IllegalOperationError();
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function vopa() : ObjectPool
      {
         return battleService.getObjectPool();
      }
      
      protected function juvyba() : BattleScene3D
      {
         return battleService.getBattleScene3D();
      }
   }
}

