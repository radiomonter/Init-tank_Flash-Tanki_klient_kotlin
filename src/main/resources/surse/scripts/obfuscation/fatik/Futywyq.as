package obfuscation.fatik
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Dus;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   
   public class Futywyq
   {
      
      public static const kihuwoha:Number = 150;
      
      private static const bedukij:int = 100;
      
      private var battleService:BattleService;
      
      private var sfxData:Lujimarem;
      
      public function Futywyq(_arg_1:BattleService, _arg_2:Lujimarem)
      {
         super();
         this.battleService = _arg_1;
         this.sfxData = _arg_2;
      }
      
      public function dimiled(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_5:Sound3D = null;
         var _local_6:Sound3DEffect = null;
         var _local_4:Number = NaN;
         var _local_7:Dus = Dus(this.battleService.getObjectPool().getObject(Dus));
         _local_7.init(_arg_2,_arg_1,this.sfxData.jenugo,bedukij,kihuwoha,kihuwoha);
         this.battleService.addGraphicEffect(_local_7);
         if(this.sfxData.shotSound != null)
         {
            _local_4 = 0.8;
            _local_5 = Sound3D.create(this.sfxData.shotSound,_local_4);
            _local_6 = Sound3DEffect.create(_arg_3,_local_5);
            this.battleService.wikyhih(_local_6);
         }
      }
      
      public function hez(_arg_1:Object3D, _arg_2:Vector3) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(_arg_1,_arg_2);
         _local_3.init(_local_4,this.sfxData.loh);
         this.battleService.addGraphicEffect(_local_3);
      }
   }
}

