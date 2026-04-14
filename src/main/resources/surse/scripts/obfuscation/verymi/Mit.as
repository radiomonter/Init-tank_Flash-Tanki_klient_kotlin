package obfuscation.verymi
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.colliders.BoxSphereCollider;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionSphere;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.Trigger;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.sfx.Blinker;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kyre.Myw;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Mit extends BattleRunnerProvider implements Trigger, Renderer
   {
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private static var pool:Mit;
      
      private static const didiw:int = 1;
      
      private static const bylip:int = 2;
      
      private static const cilyluz:int = 3;
      
      private static const INITIAL_BLINK_INTERVAL:int = 320;
      
      private static const MIN_BLINK_INTERVAL:int = 22;
      
      private static const BLINK_INTERVAL_DECREMENT:int = 12;
      
      private static const vobe:Number = 0.2;
      
      private static const cyworiku:Number = 10;
      
      private static const vodavi:Vector3 = new Vector3();
      
      private static const bosoga:BoxSphereCollider = new BoxSphereCollider();
      
      private const blinker:Blinker = new Blinker(INITIAL_BLINK_INTERVAL,MIN_BLINK_INTERVAL,BLINK_INTERVAL_DECREMENT,vobe,1,cyworiku);
      
      public var next:Mit;
      
      public var prev:Mit;
      
      public var id:String;
      
      public var ownerId:String;
      
      public var nydozaw:CollisionSphere = new CollisionSphere(1,Myw.WEAPON,PhysicsMaterial.DEFAULT_MATERIAL);
      
      public var position:Vector3 = new Vector3();
      
      public var vidasajuk:Vector3 = new Vector3();
      
      private var callback:Baryly;
      
      private var teamType:BattleTeam;
      
      private var mesh:Mesh;
      
      private var state:Mutapok = Mutapok.vudinag;
      
      private var gopa:Quh;
      
      private var kajubidy:int;
      
      private var tyhedi:int;
      
      private var colorTransform:ColorTransform = new ColorTransform();
      
      private var gaz:Tank;
      
      private var fisywozur:Boolean;
      
      public function Mit(_arg_1:Mesh)
      {
         super();
         this.mesh = Mesh(_arg_1.clone());
      }
      
      public static function create(_arg_1:String, _arg_2:String, _arg_3:Number, _arg_4:Mesh, _arg_5:Material, _arg_6:BattleTeam, _arg_7:Quh, _arg_8:Baryly) : Mit
      {
         var _local_9:Mit = null;
         if(pool == null)
         {
            _local_9 = new Mit(_arg_4);
         }
         else
         {
            _local_9 = pool;
            pool = pool.next;
            _local_9.next = null;
         }
         _local_9.init(_arg_1,_arg_2,_arg_3,_arg_5,_arg_6,_arg_7,_arg_8);
         return _local_9;
      }
      
      public function dispose() : void
      {
         this.id = null;
         this.ownerId = null;
         this.gopa = null;
         this.gaz = null;
         this.fisywozur = false;
         this.prev = null;
         this.next = pool == null ? null : pool;
         pool = this;
      }
      
      public function kivohag() : void
      {
         this.state = Mutapok.dapaq;
         this.kajubidy = getTimer();
         this.tyhedi = didiw;
         this.mesh.colorTransform = this.colorTransform;
         this.mesh.alpha = 1;
      }
      
      public function setPosition(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.position.copy(_arg_1);
         this.vidasajuk.copy(_arg_2);
         this.mesh.x = _arg_1.x;
         this.mesh.y = _arg_1.y;
         this.mesh.z = _arg_1.z;
         vodavi.cross2(Vector3.Z_AXIS,_arg_2).normalize();
         var _local_3:Number = Math.acos(_arg_2.dot(Vector3.Z_AXIS));
         var _local_4:Matrix3 = new Matrix3();
         _local_4.fromAxisAngle(vodavi,_local_3);
         _local_4.getEulerAngles(vodavi);
         this.mesh.rotationX = vodavi.x;
         this.mesh.rotationY = vodavi.y;
         this.mesh.rotationZ = vodavi.z;
         var _local_5:Matrix4 = this.nydozaw.transform;
         _local_5.setPosition(_arg_1);
         this.nydozaw.calculateAABB();
      }
      
      public function rykysap() : void
      {
         fahysemas().wapicyjim(this);
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.addObject(this.mesh);
         _local_1.toqok(this,0);
      }
      
      public function coraw() : void
      {
         fahysemas().zegyrak(this);
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.qahakuve(this,0);
         _local_1.removeObject(this.mesh);
      }
      
      public function checkTrigger(_arg_1:Body) : void
      {
         this.gaz = _arg_1.tank;
         if(this.wisak(this.gaz))
         {
            if(this.nynor(this.gaz))
            {
               if(!this.fisywozur)
               {
                  this.fisywozur = true;
                  this.callback.jyf(this);
               }
            }
            else
            {
               this.fisywozur = false;
            }
         }
      }
      
      private function wisak(_arg_1:Tank) : Boolean
      {
         return this.state == Mutapok.dapaq && this.ownerId != _arg_1.tankData.userName && !_arg_1.fiveqejav(this.teamType) && _arg_1.state == ClientTankState.neqahi;
      }
      
      private function nynor(_arg_1:Tank) : Boolean
      {
         var _local_2:CollisionBox = _arg_1.sipobujif();
         return (_local_2.collisionGroup & this.nydozaw.collisionGroup) != 0 && bosoga.haveCollision(_local_2,this.nydozaw);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.state == Mutapok.vudinag)
         {
            this.mesh.alpha = this.blinker.cusyrun(_arg_1,_arg_2);
         }
         else if(this.state == Mutapok.dapaq)
         {
            if(this.tyhedi != cilyluz)
            {
               this.gajowa(_arg_1);
            }
            else
            {
               this.updateVisibility();
            }
         }
      }
      
      private function updateVisibility() : void
      {
         if(this.soda())
         {
            this.mesh.visible = true;
         }
         else if(this.perunifan())
         {
            this.kycoju(this.gaz);
         }
         else
         {
            this.mesh.visible = false;
         }
      }
      
      private function soda() : Boolean
      {
         return battleInfoService.isSpectatorMode() || this.state != Mutapok.dapaq || this.perunifan() && (this.ownerId == this.gaz.tankData.userName || this.gaz.fiveqejav(this.teamType));
      }
      
      private function perunifan() : Boolean
      {
         return Boolean(this.gaz) && Boolean(this.gaz.tankData.userName) && this.gaz.tankData.health > 0;
      }
      
      private function kycoju(_arg_1:Tank) : void
      {
         this.mesh.visible = true;
         vodavi.diff(_arg_1.qiniwu().state.position,this.position);
         var _local_2:Number = vodavi.length();
         if(_local_2 > this.gopa.hivedejy)
         {
            this.mesh.visible = false;
         }
         else if(_local_2 < this.gopa.jugylapy)
         {
            this.mesh.alpha = 1;
         }
         else
         {
            this.mesh.alpha = (this.gopa.hivedejy - _local_2) / (this.gopa.hivedejy - this.gopa.jugylapy);
         }
      }
      
      private function init(_arg_1:String, _arg_2:String, _arg_3:Number, _arg_4:Material, _arg_5:BattleTeam, _arg_6:Quh, _arg_7:Baryly) : void
      {
         this.id = _arg_1;
         this.ownerId = _arg_2;
         this.vebeq(_arg_3);
         this.teamType = _arg_5;
         this.gopa = _arg_6;
         this.callback = _arg_7;
         this.mesh.colorTransform = null;
         this.mesh.alpha = 1;
         this.mesh.visible = true;
         this.mesh.setMaterialToAllFaces(_arg_4);
         this.state = Mutapok.vudinag;
         this.tyhedi = cilyluz;
         this.kajubidy = getTimer();
         this.blinker.init(this.kajubidy);
      }
      
      private function vebeq(_arg_1:Number) : void
      {
         this.nydozaw.r = _arg_1;
         this.nydozaw.calculateAABB();
      }
      
      private function gajowa(_arg_1:int) : void
      {
         switch(this.tyhedi)
         {
            case didiw:
               if(_arg_1 < this.kajubidy + this.gopa.lurekoqy)
               {
                  this.tulovosu(this.gopa.vagyriqu * (_arg_1 - this.kajubidy) / this.gopa.lurekoqy);
               }
               else
               {
                  this.tulovosu(this.gopa.vagyriqu);
                  this.kajubidy += this.gopa.lurekoqy + this.gopa.qabo;
                  this.tyhedi = bylip;
               }
               return;
            case bylip:
               if(_arg_1 < this.kajubidy)
               {
                  this.tulovosu(this.gopa.vagyriqu * (this.kajubidy - _arg_1) / this.gopa.qabo);
                  break;
               }
               this.tulovosu(0);
               this.tyhedi = cilyluz;
               this.mesh.colorTransform = null;
         }
      }
      
      private function tulovosu(_arg_1:uint) : void
      {
         this.colorTransform.redOffset = _arg_1;
         this.colorTransform.greenOffset = _arg_1;
         this.colorTransform.blueOffset = _arg_1;
         this.mesh.colorTransform = this.colorTransform;
      }
   }
}

