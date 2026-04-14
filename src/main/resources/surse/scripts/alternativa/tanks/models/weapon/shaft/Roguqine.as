package alternativa.tanks.models.weapon.shaft
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import flash.media.SoundChannel;
   import obfuscation.cujewipo.Jodov;
   import obfuscation.cujewipo.Punakade;
   import obfuscation.cujewipo.Vypalati;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.MobileSound3DEffect;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   
   public class Roguqine
   {
      
      public static const kihuwoha:Number = 200;
      
      public static const fuvi:Number = 200;
      
      private static const pale:Number = 110;
      
      private static const kolojyni:Number = 0.4;
      
      private static const homoke:Number = 0.8;
      
      private static const kogyvy:Number = 0.35;
      
      private static const vilidehy:int = 1000;
      
      private static const livufodic:Vector3 = new Vector3();
      
      private static const nivizaf:int = 300;
      
      private var sfxData:Qef;
      
      private var battleService:BattleService;
      
      private var metuwym:SoundChannel;
      
      private var nibaw:MobileSound3DEffect;
      
      public function Roguqine(_arg_1:Qef, _arg_2:BattleService)
      {
         super();
         this.sfxData = _arg_1;
         this.battleService = _arg_2;
      }
      
      public function ninato(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            if(this.metuwym == null)
            {
               this.metuwym = this.battleService.kyfyrid.nekile(this.sfxData.targetingSound,0,9999);
            }
         }
         else if(this.metuwym != null)
         {
            this.battleService.kyfyrid.luqire(this.metuwym);
            this.metuwym = null;
         }
      }
      
      public function qewimequg(_arg_1:Object3D) : void
      {
         var _local_2:Sound3D = null;
         if(this.nibaw == null)
         {
            this.nibaw = MobileSound3DEffect(this.battleService.getObjectPool().getObject(MobileSound3DEffect));
            _local_2 = Sound3D.create(this.sfxData.zoomModeSound,kogyvy);
            this.nibaw.init(_local_2,_arg_1,0,9999);
            this.battleService.wikyhih(this.nibaw);
         }
      }
      
      public function hyhu() : void
      {
         if(this.nibaw != null)
         {
            this.nibaw.kill();
            this.nibaw = null;
         }
      }
      
      public function cyd() : void
      {
         if(this.nibaw != null)
         {
            this.nibaw.mesan(vilidehy);
         }
      }
      
      public function numule(_arg_1:Vector3) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.shotSound,kolojyni);
         var _local_3:Sound3DEffect = Sound3DEffect.create(_arg_1,_local_2);
         this.battleService.wikyhih(_local_3);
      }
      
      public function rijewury(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:ObjectPool = this.battleService.getObjectPool();
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(_local_3.getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1,10);
         var _local_5:Bikuqy = Bikuqy(_local_3.getObject(Bikuqy));
         _local_5.init(kihuwoha,kihuwoha,this.sfxData.wedeji,0,_local_4);
         this.battleService.addGraphicEffect(_local_5);
         this.wylofituh(_arg_1,_arg_2);
      }
      
      public function wylofituh(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1);
         _local_3.init(_local_4,this.sfxData.loh);
         this.battleService.addGraphicEffect(_local_3);
      }
      
      public function huj(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Vector3) : void
      {
         if(_arg_1 != null)
         {
            this.ketipas(_arg_1,_arg_3,_arg_4,_arg_5,false);
         }
         if(_arg_2 != null)
         {
            this.ketipas(_arg_2,_arg_3,_arg_4,_arg_5,true);
         }
      }
      
      private function ketipas(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Boolean) : void
      {
         var _local_6:Number = NaN;
         var _local_7:Number = this.sfxData.gefi;
         livufodic.diff(_arg_1,_arg_2);
         if(livufodic.dot(_arg_3) > 0)
         {
            _local_6 = livufodic.length();
            if(_local_6 > _local_7)
            {
               _local_6 = _local_7;
            }
            this.pipejiv(Punakade,_arg_1,_arg_4,_local_6,_local_6 / _local_7);
            if(_arg_5)
            {
               this.pipejiv(Jodov,_arg_1,_arg_4,_local_6,0.5);
            }
         }
         this.sil(_arg_1);
         this.wywikep(_arg_1);
      }
      
      private function sil(_arg_1:Vector3) : void
      {
         var _local_2:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_2.init(_arg_1,pale);
         var _local_3:Bikuqy = Bikuqy(this.battleService.getObjectPool().getObject(Bikuqy));
         _local_3.init(fuvi,2.5 * fuvi,this.sfxData.hevi,0,_local_2);
         this.battleService.addGraphicEffect(_local_3);
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
      
      private function wywikep(_arg_1:Vector3) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.explosionSound,homoke);
         var _local_3:Sound3DEffect = Sound3DEffect(this.battleService.getObjectPool().getObject(Sound3DEffect));
         _local_3.init(_arg_1,_local_2,100);
         this.battleService.wikyhih(_local_3);
      }
      
      private function pipejiv(_arg_1:Class, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:Number) : void
      {
         var _local_6:Vypalati = Vypalati(this.battleService.getObjectPool().getObject(_arg_1));
         _local_6.init(_arg_2,_arg_3,_arg_4,_arg_5,this.sfxData.sarasave,nivizaf);
         this.battleService.addGraphicEffect(_local_6);
      }
      
      public function destroy() : void
      {
         if(this.metuwym != null)
         {
            this.battleService.kyfyrid.luqire(this.metuwym);
            this.metuwym = null;
         }
         this.hyhu();
      }
      
      public function laqevoj(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         if(_arg_2 != null)
         {
            this.battleService.getBattleScene3D().addDecal(_arg_2,_arg_1,50,this.sfxData.fyqydyd);
         }
      }
   }
}

