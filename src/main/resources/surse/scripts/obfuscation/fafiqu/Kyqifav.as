package obfuscation.fafiqu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.types.Long;
   import flash.media.Sound;
   import obfuscation.quqykor.Finawote;
   import obfuscation.quqykor.Vypybuham;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.Duqudi;
   import obfuscation.rofa.Jywaca;
   import obfuscation.rofa.LightAnimation;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Kyqifav extends Finawote implements Vypybuham, ObjectLoadListener, ObjectUnloadListener, Vamobanoc
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const pelogubic:Number = 800;
      
      private static const loqijyfyt:Number = 400;
      
      private static const jebelepek:Number = 1000;
      
      private static const hogehitek:Number = 600;
      
      private static const qug:Number = 800;
      
      private static const rymivozo:Number = 200;
      
      private static const gyko:Number = -2000;
      
      private static const voh:int = 200;
      
      private static const homoke:Number = 0.4;
      
      private const fawevotoj:RayHit = new RayHit();
      
      private const position:Vector3 = new Vector3();
      
      private const eulerAngles:Vector3 = new Vector3();
      
      private const velocity:Vector3 = new Vector3();
      
      private const matrix:Matrix3 = new Matrix3();
      
      private var gusuzy:Mykape;
      
      public function Kyqifav()
      {
         super();
      }
      
      private static function datono(_arg_1:Tank) : Number
      {
         var _local_2:Mesh = _arg_1.bij().repijumu();
         var _local_3:Number = _local_2.boundMaxX - _local_2.boundMinX;
         var _local_4:Number = _local_2.boundMaxY - _local_2.boundMinY;
         var _local_5:Number = _local_2.boundMaxZ - _local_2.boundMinZ;
         var _local_6:Number = Math.sqrt(_local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5);
         return _local_6 / hogehitek;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _local_1:TextureAnimation = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,450080))),pelogubic);
         var _local_2:TextureAnimation = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,644720))),jebelepek);
         var _local_3:TextureAnimation = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,839177))),loqijyfyt);
         var _local_4:Mykape = new Mykape(_local_1,_local_2,_local_3);
         this.gusuzy = _local_4;
      }
      
      private function getTextureAnimation(_arg_1:MultiframeImageResource, _arg_2:Number) : TextureAnimation
      {
         var _local_3:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_3.material.resolution = _arg_2 / _arg_1.frameWidth;
         return _local_3;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.liburipa(this.gusuzy);
      }
      
      public function zazyra(_arg_1:IGameObject, _arg_2:Tank, _arg_3:LightAnimation) : void
      {
         var _local_4:Mykape = this.gusuzy;
         var _local_5:ObjectPool = battleService.getObjectPool();
         var _local_6:Number = datono(_arg_2);
         this.puj(_arg_2,_local_5,_local_6,_local_4);
         this.liqy(_local_5,_local_6,_local_4);
         this.nyh(_local_5,_local_6,_local_4);
         this.farohuc(_local_5,_arg_3);
         this.vomot(_arg_2);
      }
      
      private function vomot(_arg_1:Tank) : void
      {
         var _local_2:Sound3D = null;
         var _local_3:Object3D = null;
         var _local_4:Sound = battleService.huruvo();
         if(_local_4 != null)
         {
            _local_2 = Sound3D.create(_local_4,homoke);
            _local_3 = _arg_1.bij().rocipaga();
            battleService.wikyhih(Sound3DEffect.create(new Vector3(_local_3.x,_local_3.y,_local_3.z),_local_2,0,0));
         }
      }
      
      private function farohuc(_arg_1:ObjectPool, _arg_2:LightAnimation) : void
      {
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_arg_1.getObject(StaticObject3DPositionProvider));
         var _local_4:AnimatedLightEffect = AnimatedLightEffect(_arg_1.getObject(AnimatedLightEffect));
         _local_3.init(this.position,0);
         _local_4.init(_local_3,_arg_2);
         battleService.addGraphicEffect(_local_4);
      }
      
      private function liburipa(_arg_1:Mykape) : void
      {
         suner.releaseMaterial(_arg_1.lit.material);
         suner.releaseMaterial(_arg_1.resorocuk.material);
         suner.releaseMaterial(_arg_1.jubalu.material);
      }
      
      private function puj(_arg_1:Tank, _arg_2:ObjectPool, _arg_3:Number, _arg_4:Mykape) : void
      {
         var _local_7:Vector3 = null;
         var _local_9:Vector3 = null;
         var _local_10:Jywaca = null;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_8:Number = NaN;
         var _local_11:Vector3 = new Vector3(0,0,-1);
         var _local_12:Number = 500;
         this.position.copy(_arg_1.qiniwu().state.position);
         if(battleService.getBattleRunner().soc().raycastStatic(this.position,_local_11,255,_local_12,null,this.fawevotoj))
         {
            this.fawevotoj.position.z += 10;
            _local_5 = jebelepek;
            _local_6 = 200;
            if(this.fawevotoj.t > _local_6)
            {
               _local_5 *= (_local_12 - this.fawevotoj.t) / (_local_12 - _local_6);
            }
            _local_7 = this.fawevotoj.normal;
            _local_8 = Math.acos(_local_7.z);
            _local_9 = new Vector3(-_local_7.y,_local_7.x,0);
            _local_9.normalize();
            this.matrix.fromAxisAngle(_local_9,_local_8);
            this.matrix.getEulerAngles(this.eulerAngles);
            _local_10 = Jywaca(_arg_2.getObject(Jywaca));
            _local_10.init(_arg_3 * _local_5,this.fawevotoj.position,this.eulerAngles,_arg_4.resorocuk,1);
            battleService.getBattleScene3D().addGraphicEffect(_local_10);
         }
      }
      
      private function liqy(_arg_1:ObjectPool, _arg_2:Number, _arg_3:Mykape) : void
      {
         this.position.z += 50;
         var _local_4:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_arg_1.getObject(StaticObject3DPositionProvider));
         _local_4.init(this.position,voh);
         var _local_5:Bikuqy = Bikuqy(_arg_1.getObject(Bikuqy));
         var _local_6:Number = pelogubic * _arg_2;
         _local_5.init(_local_6,_local_6,_arg_3.lit,Math.random() * 2 * Math.PI,_local_4);
         battleService.getBattleScene3D().addGraphicEffect(_local_5);
      }
      
      private function nyh(_arg_1:ObjectPool, _arg_2:Number, _arg_3:Mykape) : void
      {
         var _local_5:Duqudi = null;
         var _local_6:Bikuqy = null;
         var _local_8:int = 0;
         var _local_4:Number = NaN;
         var _local_7:Number = NaN;
         while(_local_8 < 3)
         {
            _local_4 = qug + Math.random() * rymivozo;
            this.velocity.x = _local_4 * (1 - 2 * Math.random());
            this.velocity.y = _local_4 * (1 - 2 * Math.random());
            this.velocity.z = _local_4 * 0.5 * (1 + Math.random());
            _local_5 = Duqudi(_arg_1.getObject(Duqudi));
            _local_5.init(this.position,this.velocity,gyko);
            _local_6 = Bikuqy(_arg_1.getObject(Bikuqy));
            _local_7 = loqijyfyt * _arg_2;
            _local_6.init(_local_7,_local_7,_arg_3.jubalu,Math.random() * 2 * Math.PI,_local_5);
            battleService.getBattleScene3D().addGraphicEffect(_local_6);
            _local_8++;
         }
      }
   }
}

