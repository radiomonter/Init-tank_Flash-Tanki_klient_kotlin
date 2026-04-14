package obfuscation.jihadufef
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   
   public class Juk implements Gerucykoq
   {
      
      private static const nuves:Number = 0.7;
      
      private static const gusy:Number = 0.7;
      
      private static const pale:Number = 110;
      
      private static const sikam:Number = 250;
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const vegenel:Vector3 = new Vector3();
      
      private var battleService:BattleService;
      
      private var sfxData:Qikypu;
      
      public function Juk(_arg_1:BattleService, _arg_2:Qikypu)
      {
         super();
         this.battleService = _arg_1;
         this.sfxData = _arg_2;
      }
      
      public function dimiled(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:Bicyjawyf = Bicyjawyf(this.battleService.getObjectPool().getObject(Bicyjawyf));
         _local_3.init(_arg_2,_arg_1,this.sfxData.jenugo);
         this.battleService.addGraphicEffect(_local_3);
         cojo.setMatrix(_arg_2.x,_arg_2.y,_arg_2.z,_arg_2.rotationX,_arg_2.rotationY,_arg_2.rotationZ);
         cojo.transformVector(_arg_1,vegenel);
         var _local_4:Sound3D = Sound3D.create(this.sfxData.shotSound,nuves);
         this.battleService.wikyhih(Sound3DEffect.create(vegenel,_local_4));
         this.qyvakyk(_arg_1,_arg_2);
      }
      
      public function qyvakyk(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1);
         _local_3.init(_local_4,this.sfxData.loh);
         this.battleService.addGraphicEffect(_local_3);
      }
      
      public function zazyra(_arg_1:Vector3) : void
      {
         this.sil(_arg_1);
         this.wywikep(_arg_1);
         this.wiryhuk(_arg_1);
      }
      
      private function wiryhuk(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,pale);
         _local_2.init(_local_3,this.sfxData.jowe);
         this.battleService.addGraphicEffect(_local_2);
      }
      
      public function diqic(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.battleService.getBattleScene3D().addDecal(_arg_2,_arg_1,sikam,this.sfxData.ranorywag);
      }
      
      private function sil(_arg_1:Vector3) : void
      {
         var _local_2:ObjectPool = this.battleService.getObjectPool();
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_local_2.getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,pale);
         var _local_4:Bikuqy = Bikuqy(_local_2.getObject(Bikuqy));
         _local_4.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.hevi,Math.random() * 2 * Math.PI,_local_3);
         this.battleService.addGraphicEffect(_local_4);
      }
      
      private function wywikep(_arg_1:Vector3) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.explosionSound,gusy);
         this.battleService.wikyhih(Sound3DEffect.create(_arg_1,_local_2));
      }
   }
}

