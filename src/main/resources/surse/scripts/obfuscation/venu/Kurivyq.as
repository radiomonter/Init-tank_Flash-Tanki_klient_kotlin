package obfuscation.venu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Dus;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   
   public class Kurivyq
   {
      
      public static const dif:int = 120;
      
      private static const jyretovyn:int = 50;
      
      private var battleService:BattleService;
      
      private var sfxData:Kehyhyhy;
      
      public function Kurivyq(_arg_1:BattleService, _arg_2:Kehyhyhy)
      {
         super();
         this.battleService = _arg_1;
         this.sfxData = _arg_2;
      }
      
      public function dimiled(_arg_1:Object3D, _arg_2:Vector3) : void
      {
         this.wezaraquz(_arg_2,_arg_1);
         this.sus(_arg_2,_arg_1);
         this.vos(_arg_1);
      }
      
      private function wezaraquz(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:Dus = Dus(this.battleService.getObjectPool().getObject(Dus));
         _local_3.init(_arg_1,_arg_2,this.sfxData.jenugo,jyretovyn,dif,dif);
         this.battleService.addGraphicEffect(_local_3);
      }
      
      private function sus(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1);
         _local_3.init(_local_4,this.sfxData.jeja);
         this.battleService.addGraphicEffect(_local_3);
      }
      
      private function vos(_arg_1:Object3D) : void
      {
         var _local_3:Sound3D = null;
         var _local_2:Number = NaN;
         if(this.sfxData.shotSound != null)
         {
            _local_2 = 0.8;
            _local_3 = Sound3D.create(this.sfxData.shotSound,_local_2);
            BattleUtils.vemoleg.reset(_arg_1.x,_arg_1.y,_arg_1.z);
            this.battleService.wikyhih(Sound3DEffect.create(BattleUtils.vemoleg,_local_3));
         }
      }
   }
}

