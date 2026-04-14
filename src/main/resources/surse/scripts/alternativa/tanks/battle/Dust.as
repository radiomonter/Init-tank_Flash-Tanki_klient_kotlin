package alternativa.tanks.battle
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   import obfuscation.rofa.Kahaciw;
   import obfuscation.rofa.Kekebeky;
   import obfuscation.zuhelo.Halibukyd;
   import obfuscation.zuhelo.Tezy;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Dust
   {
      
      private static const raku:Number = 0.2;
      
      private static const zowibyro:Number = 1;
      
      private static const bias:Vector3 = new Vector3(100,0,0);
      
      private static const dygyfuma:Vector3 = new Vector3();
      
      private static const zylane:Vector3 = new Vector3();
      
      private var battleService:BattleService;
      
      private var dustSize:Number = 0;
      
      private var animation:TextureAnimation;
      
      private var tanks:Dictionary = new Dictionary();
      
      private var camera:GameCamera;
      
      private var nearDistance:Number;
      
      private var farDistance:Number;
      
      public var enabled:Boolean = true;
      
      private var intensity:Number;
      
      private var micubew:Number;
      
      public function Dust(_arg_1:BattleService)
      {
         super();
         this.battleService = _arg_1;
         this.camera = _arg_1.getBattleScene3D().cewubu();
      }
      
      private static function hireno(_arg_1:Vector3, _arg_2:Number) : void
      {
         _arg_1.x += (Math.random() - 0.5) * 2 * _arg_2;
         _arg_1.y += (Math.random() - 0.5) * 2 * _arg_2;
         _arg_1.z += (Math.random() - 0.5) * 2 * _arg_2;
      }
      
      public function init(_arg_1:MultiframeImageResource, _arg_2:TextureMaterialRegistry, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number) : void
      {
         this.animation = GraphicsUtils.getTextureAnimationFromResource(_arg_2,_arg_1);
         this.farDistance = _arg_3;
         this.nearDistance = _arg_4;
         this.dustSize = _arg_5;
         this.intensity = _arg_6;
         this.micubew = _arg_7;
      }
      
      public function gema(_arg_1:Tank) : void
      {
         this.tanks[_arg_1] = _arg_1.wilurip() / 600;
      }
      
      public function hebymos(_arg_1:Tank) : void
      {
         delete this.tanks[_arg_1];
      }
      
      public function update() : void
      {
         var _local_2:Tank = null;
         var _local_1:* = undefined;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            for(_local_1 in this.tanks)
            {
               _local_2 = _local_1 as Tank;
               if(Boolean(_local_2) && _local_2.state == ClientTankState.neqahi)
               {
                  this.cinizyz(_local_2,100,this.micubew);
               }
            }
         }
      }
      
      public function cinizyz(_arg_1:Tank, _arg_2:Number = 100, _arg_3:Number = 0.2) : void
      {
         var _local_4:Number = Number(this.tanks[_arg_1]);
         var _local_5:Halibukyd = _arg_1.hot();
         var _local_6:Halibukyd = _arg_1.tanazisom();
         if(_local_5.mugylyvef * _local_6.mugylyvef < 0)
         {
            _arg_2 = 5;
         }
         var _local_7:Matrix3 = _arg_1.qiniwu().baseMatrix;
         bias.x *= -1;
         _local_7.transformVector(bias,dygyfuma);
         this.conadopy(_local_5,_local_4,dygyfuma,_arg_2,_arg_3);
         bias.x *= -1;
         _local_7.transformVector(bias,dygyfuma);
         this.conadopy(_local_6,_local_4,dygyfuma,_arg_2,_arg_3);
      }
      
      private function conadopy(_arg_1:Halibukyd, _arg_2:Number, _arg_3:Vector3, _arg_4:Number, _arg_5:Number) : void
      {
         var _local_6:Tezy = null;
         var _local_9:int = 0;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         while(_local_9 < _arg_1.gavime)
         {
            _local_6 = _arg_1.racycac[_local_9];
            _local_7 = _local_6.speed;
            if(_local_7 > _arg_4 && Math.random() < _arg_5)
            {
               _local_8 = _local_7 > 500 ? Number(1) : Number(0.3 + _local_7 / 712);
               zylane.copy(_local_6.dopicow());
               hireno(zylane,50);
               _arg_3.z = 100;
               hireno(_arg_3,20);
               this.pifukit(_arg_2,zylane,_arg_3,_local_8);
            }
            _local_9++;
         }
      }
      
      private function pifukit(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number) : void
      {
         var _local_5:Kahaciw = null;
         var _local_6:Kekebeky = null;
         var _local_7:Number = NaN;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            _local_5 = Kahaciw(this.battleService.getObjectPool().getObject(Kahaciw));
            _local_5.init(_arg_2,_arg_3,0.01);
            _local_6 = Kekebeky(this.battleService.getObjectPool().getObject(Kekebeky));
            _local_7 = this.dustSize * _arg_1 * (1 + zowibyro * Math.random());
            _local_6.init(_local_7,_local_7,this.animation,Math.random() * 2 * Math.PI,_local_5,0.5,0.5,null,130,BlendMode.NORMAL,this.nearDistance,this.farDistance,this.intensity * _arg_4 * this.camera.softTransparencyStrength,true);
            this.battleService.getBattleScene3D().addGraphicEffect(_local_6);
         }
      }
   }
}

