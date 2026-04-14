package obfuscation.raryzuzif
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   import alternativa.physics.collision.types.AABB;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.StaticCollisionBoxValidator;
   import alternativa.tanks.utils.StaticCollisionTriangleValidator;
   import alternativa.tanks.utils.StaticCollisoinRectValidator;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import obfuscation.jynere.Garo;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   import obfuscation.ronadylez.Nuci;
   import platform.client.fp10.core.type.AutoClosable;
   
   use namespace alternativa3d;
   
   public class Sijy implements AutoClosable
   {
      
      [Inject]
      public static var pypiw:DataValidator;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var commandService:CommandService;
      
      private static const cyrysob:ConsoleVarInt = new ConsoleVarInt("map_delay",0,0,600);
      
      private static const wika:Number = 0.1;
      
      private static const mujipyced:int = 20;
      
      private var suner:TextureMaterialRegistry;
      
      private var vopyboc:PropLibRegistry;
      
      private var hylali:Vimybegij;
      
      private var mojigu:KDContainer;
      
      private var kuh:Function;
      
      private var lajapa:AABB;
      
      private var textures:Vector.<BitmapData>;
      
      private var bede:Womuve;
      
      private var huqapa:uint;
      
      private var giquqaveg:Boolean;
      
      private var isComplete:Boolean;
      
      public function Sijy(_arg_1:TextureMaterialRegistry, _arg_2:PropLibRegistry)
      {
         super();
         this.suner = _arg_1;
         this.vopyboc = _arg_2;
      }
      
      private function parucugaj(_arg_1:FormattedOutput) : void
      {
      }
      
      public function jidokezyp() : Object3DContainer
      {
         return this.mojigu;
      }
      
      public function build(_arg_1:XML, _arg_2:Function) : void
      {
         this.kuh = _arg_2;
         this.cyl(_arg_1);
         this.maky(_arg_1);
         this.laciquj();
      }
      
      private function cyl(_arg_1:XML) : void
      {
         var _local_2:Vector.<CollisionShape> = Wywowema.parse(_arg_1);
         var _local_3:BattleRunner = battleService.getBattleRunner();
         _local_3.pyzujedos(_local_2);
         this.sapiv(_local_2);
      }
      
      private function sapiv(_arg_1:Vector.<CollisionShape>) : void
      {
         var _local_2:CollisionShape = null;
         for each(_local_2 in _arg_1)
         {
            if(_local_2 is CollisionBox)
            {
               pypiw.addValidator(new StaticCollisionBoxValidator(CollisionBox(_local_2)));
            }
            else if(_local_2 is CollisionRect)
            {
               pypiw.addValidator(new StaticCollisoinRectValidator(CollisionRect(_local_2)));
            }
            else if(_local_2 is CollisionTriangle)
            {
               pypiw.addValidator(new StaticCollisionTriangleValidator(CollisionTriangle(_local_2)));
            }
         }
      }
      
      private function maky(_arg_1:XML) : void
      {
         this.bede = new Womuve(this.vopyboc);
         this.bede.parse(_arg_1);
         this.lajapa = this.bede.lypeb();
      }
      
      private function laciquj() : void
      {
         this.hylali = new Vimybegij(this.suner,mujipyced);
         this.hylali.addEventListener(Event.COMPLETE,this.onTexturesReady);
         this.hylali.run(this.bede.meq());
      }
      
      private function onTexturesReady(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         this.giquqaveg = true;
         this.hylali.removeEventListener(Event.COMPLETE,this.onTexturesReady);
         this.huqapa = setTimeout(this.complete,_local_2);
      }
      
      private function complete() : void
      {
         this.isComplete = true;
         clearTimeout(this.huqapa);
         this.textures = this.hylali.fanokifyp();
         this.cozyl();
         this.nujutok();
         this.dicomudi();
         this.bapese();
         this.bede.clear();
         this.bede = null;
         this.hylali = null;
         this.suner = null;
         this.vopyboc = null;
         this.kuh();
      }
      
      private function cozyl() : void
      {
         if(this.bede.husy() == null)
         {
            return;
         }
         (this.bede.husy() as BSP).faces[0].material.alphaTestThreshold = 0.5;
      }
      
      private function bapese() : void
      {
         var _local_1:int = 0;
         var _local_2:Object3D = null;
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         var _local_5:StaticObject3DPositionProvider = null;
         var _local_6:Garo = null;
         if(this.bede.husy() == null)
         {
            return;
         }
         var _local_7:Vector.<Object3D> = this.bede.wyfelem();
         var _local_8:int = int(_local_7.length);
         var _local_9:ObjectPool = battleService.getObjectPool();
         _local_3 = new Vector3();
         _local_1 = 0;
         while(_local_1 < _local_8)
         {
            _local_2 = _local_7[_local_1];
            _local_3.x += _local_2.x;
            _local_3.y += _local_2.y;
            _local_3.z += _local_2.z;
            _local_1++;
         }
         _local_3.x /= _local_8;
         _local_3.y /= _local_8;
         _local_3.z /= _local_8;
         _local_4 = new Vector3();
         _local_1 = 0;
         while(_local_1 < _local_8)
         {
            _local_2 = _local_7[_local_1];
            _local_4.x = _local_2.x;
            _local_4.y = _local_2.y;
            _local_4.z = _local_2.z;
            _local_5 = StaticObject3DPositionProvider(_local_9.getObject(StaticObject3DPositionProvider));
            _local_5.init(_local_4,150);
            _local_6 = Garo(_local_9.getObject(Garo));
            _local_6.init(_local_2 as Sprite3D,_local_5,_local_3);
            battleService.getBattleScene3D().addGraphicEffect(_local_6);
            _local_1++;
         }
      }
      
      private function nujutok() : void
      {
         var _local_1:Object3D = null;
         this.mojigu = new KDContainer();
         this.mojigu.threshold = wika;
         this.mojigu.ignoreChildrenInCollider = true;
         var _local_2:Vector.<Object3D> = this.bede.getObjects();
         _local_2.push(new Karafadad());
         this.mojigu.createTree(_local_2,this.bede.fuwydoqi());
         var _local_3:BattleScene3D = battleService.getBattleScene3D();
         for each(_local_1 in this.bede.molaki())
         {
            this.mojigu.addChild(_local_1);
            _local_3.tiziqec.add(new Nuci(_local_1));
         }
         this.mojigu.calculateBounds();
         _local_3.konorazo(this.mojigu);
      }
      
      private function dicomudi() : void
      {
         var _local_1:Mesh = null;
         var _local_2:Vector.<Mesh> = this.bede.wecy();
         var _local_3:BattleScene3D = battleService.getBattleScene3D();
         for each(_local_1 in _local_2)
         {
            _local_3.kyveculoh(_local_1);
         }
      }
      
      public function lypeb() : AABB
      {
         return this.lajapa;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         clearTimeout(this.huqapa);
         if(this.mojigu != null)
         {
            this.mojigu.destroyTree();
            this.mojigu = null;
         }
         if(this.hylali != null)
         {
            this.hylali.removeEventListener(Event.COMPLETE,this.onTexturesReady);
            this.hylali.destroy();
            this.hylali = null;
         }
         if(this.bede != null)
         {
            this.bede.clear();
            this.bede = null;
         }
         this.kuh = null;
         this.weriden();
      }
      
      private function weriden() : void
      {
         var _local_1:BitmapData = null;
         var _local_2:int = 0;
         for each(_local_1 in this.textures)
         {
            _local_1.dispose();
            _local_2++;
         }
         this.textures = null;
      }
   }
}

