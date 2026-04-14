package obfuscation.kevidery
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.smoky.Rubelyvo;
   import alternativa.tanks.models.weapon.smoky.Vitovyhad;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import flash.display.BlendMode;
   import obfuscation.lozewaby.Guh;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.Dus;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   
   public class Luga implements Rubelyvo
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var kyfyrid:Guh;
      
      private var vopa:ObjectPool;
      
      private var sfxData:Duk;
      
      public function Luga(_arg_1:Guh, _arg_2:ObjectPool, _arg_3:Duk)
      {
         super();
         this.kyfyrid = _arg_1;
         this.vopa = _arg_2;
         this.sfxData = _arg_3;
      }
      
      public function dimiled(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         this.numule(_arg_2);
         this.rijewury(_arg_1,_arg_2);
         this.seqijadi(_arg_1,_arg_2);
      }
      
      private function numule(_arg_1:Object3D) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.shotSound,Vitovyhad.kolojyni);
         this.kyfyrid.vakydiqip(Sound3DEffect.create(new Vector3(_arg_1.x,_arg_1.y,_arg_1.z),_local_2));
      }
      
      private function rijewury(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:Dus = Dus(this.vopa.getObject(Dus));
         _local_3.init(_arg_1,_arg_2,this.sfxData.jenugo,Vitovyhad.ryrugyr,Vitovyhad.lagycewun,Vitovyhad.duronirut);
         battleService.getBattleScene3D().addGraphicEffect(_local_3);
      }
      
      private function seqijadi(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.vopa.getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.vopa.getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1);
         _local_3.init(_local_4,this.sfxData.loh);
         battleService.getBattleScene3D().addGraphicEffect(_local_3);
      }
      
      public function zazyra(_arg_1:Vector3) : void
      {
         this.wywikep(_arg_1);
         this.sil(_arg_1);
         this.wiryhuk(_arg_1);
      }
      
      private function wiryhuk(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(this.vopa.getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.vopa.getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,Vitovyhad.pale);
         _local_2.init(_local_3,this.sfxData.jowe);
         battleService.getBattleScene3D().addGraphicEffect(_local_2);
      }
      
      private function wywikep(_arg_1:Vector3) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.explosionSound,1);
         this.kyfyrid.vakydiqip(Sound3DEffect.create(_arg_1,_local_2,Vitovyhad.byjony));
      }
      
      private function sil(_arg_1:Vector3) : void
      {
         var _local_2:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.vopa.getObject(StaticObject3DPositionProvider));
         _local_2.init(_arg_1,Vitovyhad.pale);
         var _local_3:Bikuqy = Bikuqy(this.vopa.getObject(Bikuqy));
         _local_3.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.hevi,0,_local_2);
         battleService.getBattleScene3D().addGraphicEffect(_local_3);
      }
      
      public function diqic(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         battleService.getBattleScene3D().addDecal(_arg_2,_arg_1,Vitovyhad.sikam,this.sfxData.ranorywag);
      }
      
      public function woqap(_arg_1:Vector3) : void
      {
         var _local_2:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.vopa.getObject(StaticObject3DPositionProvider));
         _local_2.init(_arg_1,Vitovyhad.pale + 50);
         var _local_3:Bikuqy = Bikuqy(this.vopa.getObject(Bikuqy));
         _local_3.kaf(this.sfxData.criticalHitSize,this.sfxData.criticalHitSize,this.sfxData.qobupar,0,_local_2,0.5,0.5,null,70,BlendMode.NORMAL,2);
         battleService.getBattleScene3D().addGraphicEffect(_local_3);
      }
   }
}

