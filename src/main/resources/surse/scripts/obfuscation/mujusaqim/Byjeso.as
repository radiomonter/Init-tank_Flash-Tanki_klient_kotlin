package obfuscation.mujusaqim
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Trigger;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import obfuscation.badu.Jytamutid;
   import obfuscation.badu.Wydu;
   import obfuscation.bude.BattleTeam;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.kyre.Myw;
   import obfuscation.ronadylez.Vyhesuz;
   
   public class Byjeso implements Vyhesuz, Trigger, Renderer
   {
      
      [Inject]
      public static var qapy:ILightingEffectsService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const vizojub:EncryptedInt = new EncryptedIntImpl(95);
      
      private static const pigyryq:EncryptedInt = new EncryptedIntImpl(400);
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private static const susenisac:Vector3 = new Vector3();
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private static const rulijo:Vector3 = new Vector3();
      
      private static const vukyke:Vector3 = new Vector3();
      
      public var teamType:BattleTeam;
      
      public var nydozaw:CollisionShape;
      
      private var mufiv:Tank;
      
      private var husyhuveb:String;
      
      private var _state:Tawytuqe = Tawytuqe.AT_BASE;
      
      private var keqemilu:Vector3;
      
      private var skin:AnimatedSprite3D;
      
      private var startTime:int;
      
      private var zederizi:int = 1000;
      
      private var vemofufa:Number = 1;
      
      private var verapyh:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      private var callback:Hylyv;
      
      private var lightSource:OmniLight;
      
      public function Byjeso(_arg_1:BattleTeam, _arg_2:Vector3, _arg_3:int, _arg_4:int, _arg_5:TextureAnimation, _arg_6:CollisionDetector, _arg_7:Hylyv)
      {
         super();
         this.teamType = _arg_1;
         this.keqemilu = _arg_2.clone();
         this._state = Tawytuqe.AT_BASE;
         this.collisionDetector = _arg_6;
         this.callback = _arg_7;
         this.createSkin(_arg_3,_arg_4,_arg_5);
         this.ropor(_arg_1);
         this.setPosition(_arg_2);
         this.startTime = this.zederizi * Math.random();
      }
      
      private function ropor(_arg_1:BattleTeam) : void
      {
         var _local_2:Jytamutid = qapy.nediqelun(Suvozimi.CTF);
         var _local_3:Wydu = _local_2.kycigove(_arg_1);
         this.lightSource = new OmniLight(_local_3.quruqa(),_local_2.vehyvoqi(),_local_2.nuzomypu());
         this.lightSource.intensity = _local_3.kys();
      }
      
      public function setAlphaMultiplier(_arg_1:Number) : void
      {
         this.vemofufa = _arg_1 < 0.2 ? Number(0.2) : Number(_arg_1);
         this.daqiv(!this.verapyh ? Number(1) : Number(0.5));
      }
      
      private function daqiv(_arg_1:Number) : void
      {
         if(this._state == Tawytuqe.CARRIED)
         {
            this.skin.alpha = _arg_1;
         }
         else
         {
            this.skin.alpha = this.vemofufa;
         }
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.skin.x;
         _arg_1.y = this.skin.y;
         _arg_1.z = this.skin.z;
      }
      
      public function checkTrigger(_arg_1:Body) : void
      {
         var _local_2:CollisionShape = null;
         var _local_3:ShapeContact = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         while(true)
         {
            if(_local_5 >= _arg_1.numCollisionShapes)
            {
               return;
            }
            _local_2 = _arg_1.collisionShapes[0];
            this.collisionDetector.getContacts(_local_2,this.nydozaw,contacts);
            if(contacts.length > 0)
            {
               _local_3 = contacts[0];
               susenisac.copy(_local_3.position);
               vukyke.x = this.nydozaw.transform.m03 - susenisac.x;
               vukyke.y = this.nydozaw.transform.m13 - susenisac.y;
               vukyke.z = this.nydozaw.transform.m23 - susenisac.z;
               if(!this.collisionDetector.raycastStatic(susenisac,vukyke,Myw.dyhan,1,null,fawevotoj))
               {
                  break;
               }
               susenisac.x = _local_2.transform.m03;
               susenisac.y = _local_2.transform.m13;
               susenisac.z = _local_2.transform.m23;
               vukyke.x = this.nydozaw.transform.m03 - susenisac.x;
               vukyke.y = this.nydozaw.transform.m13 - susenisac.y;
               vukyke.z = this.nydozaw.aabb.minZ - susenisac.z + 1;
               if(!this.collisionDetector.raycastStatic(susenisac,vukyke,Myw.dyhan,1,null,fawevotoj))
               {
                  break;
               }
            }
            _local_5++;
         }
         _local_4 = 0;
         while(_local_4 < contacts.length)
         {
            _local_3 = contacts[_local_4];
            _local_3.dispose();
            _local_4++;
         }
         contacts.length = 0;
         this.callback.gykiha(this);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.skin.kiba(int((_arg_1 - this.startTime) / this.zederizi));
         if(this.mufiv != null)
         {
            this.mufiv.bij().hopepyqyj(rulijo);
            rulijo.z -= 50;
            this.setPosition(rulijo);
         }
      }
      
      public function get rosobif() : Tank
      {
         return this.mufiv;
      }
      
      public function get wef() : String
      {
         return this.husyhuveb;
      }
      
      private function setPosition(_arg_1:Vector3) : void
      {
         this.skin.x = _arg_1.x;
         this.skin.y = _arg_1.y;
         this.skin.z = _arg_1.z;
         this.nydozaw.transform.m03 = _arg_1.x;
         this.nydozaw.transform.m13 = _arg_1.y;
         this.nydozaw.transform.m23 = _arg_1.z + 0.5 * pigyryq.getInt();
         this.nydozaw.calculateAABB();
         this.lightSource.x = _arg_1.x;
         this.lightSource.y = _arg_1.y;
         this.lightSource.z = _arg_1.z + 0.75 * pigyryq.getInt();
      }
      
      public function addToScene() : void
      {
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.addObject(this.skin);
         _local_1.addObject(this.lightSource);
      }
      
      public function get state() : Tawytuqe
      {
         return this._state;
      }
      
      public function jehe(_arg_1:String, _arg_2:Tank) : void
      {
         this.verapyh = true;
         this.najebofo(_arg_1,_arg_2,0.5);
      }
      
      public function polydad(_arg_1:String, _arg_2:Tank) : void
      {
         this.verapyh = false;
         this.najebofo(_arg_1,_arg_2,1);
      }
      
      private function najebofo(_arg_1:String, _arg_2:Tank, _arg_3:Number) : void
      {
         this.husyhuveb = _arg_1;
         this.mufiv = _arg_2;
         this._state = Tawytuqe.CARRIED;
         if(_arg_2 != null)
         {
            this.skin.visible = true;
            this.daqiv(_arg_3);
         }
         else
         {
            this.skin.visible = false;
         }
      }
      
      public function keqipihe() : void
      {
         this.reset(Tawytuqe.AT_BASE);
         this.setPosition(this.keqemilu);
      }
      
      public function vafekuny(_arg_1:Vector3) : void
      {
         this.reset(Tawytuqe.DROPPED);
         if(this.collisionDetector.raycastStatic(_arg_1,new Vector3(0,0,-20000),Myw.dyhan,1,null,fawevotoj))
         {
            this.setPosition(fawevotoj.position);
         }
         else
         {
            this.setPosition(_arg_1);
         }
      }
      
      public function dispose() : void
      {
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.removeObject(this.skin);
         _local_1.removeObject(this.lightSource);
      }
      
      private function createSkin(_arg_1:int, _arg_2:int, _arg_3:TextureAnimation) : void
      {
         var _local_4:Number = _arg_1 * pigyryq.getInt() / _arg_2;
         this.skin = new AnimatedSprite3D(_local_4,pigyryq.getInt());
         this.skin.softAttenuation = 10;
         this.skin.vuhi(_arg_3);
         this.skin.kiba(0);
         this.skin.originY = 1;
         _arg_3.material.resolution = 1;
         this.nydozaw = new CollisionBox(new Vector3(0.5 * vizojub.getInt(),0.5 * vizojub.getInt(),0.5 * pigyryq.getInt()),Myw.TANK,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function reset(_arg_1:Tawytuqe) : void
      {
         this._state = _arg_1;
         this.husyhuveb = null;
         this.mufiv = null;
         this.daqiv(1);
         this.skin.visible = true;
      }
   }
}

