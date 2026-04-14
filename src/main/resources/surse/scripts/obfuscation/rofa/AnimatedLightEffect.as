package obfuscation.rofa
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public final class AnimatedLightEffect extends PooledObject implements GraphicEffect
   {
      
      public static const govav:Number = 99999;
      
      private var light:OmniLight;
      
      private var dugoceq:Toli;
      
      private var animation:LightAnimation;
      
      private var currentTime:int;
      
      private var taqa:int;
      
      private var qawokyb:Boolean;
      
      private var alive:Boolean;
      
      private var fesuhum:Number;
      
      private var donofa:Number;
      
      private var position:Vector3 = new Vector3();
      
      private var container:Scene3DContainer;
      
      public function AnimatedLightEffect(_arg_1:Pool)
      {
         super(_arg_1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(_arg_1:Toli, _arg_2:LightAnimation, _arg_3:Number = 99999, _arg_4:Boolean = false) : void
      {
         this.rugil(_arg_1,_arg_2.tudy(),_arg_2,_arg_3,_arg_4);
      }
      
      public function rugil(_arg_1:Toli, _arg_2:int, _arg_3:LightAnimation, _arg_4:Number = 99999, _arg_5:Boolean = false) : void
      {
         this.dugoceq = _arg_1;
         this.taqa = _arg_2;
         this.currentTime = 0;
         this.animation = _arg_3;
         this.qawokyb = _arg_5;
         this.alive = true;
         this.fesuhum = _arg_4;
         this.donofa = _arg_4 / 4 * 3;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.light);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.alive)
         {
            this.animation.raci(this.light,this.currentTime,this.taqa);
            this.dugoceq.lulik(this.light,_arg_2,_arg_1);
            this.currentTime += _arg_1;
            if(this.currentTime > this.taqa)
            {
               if(this.qawokyb)
               {
                  this.currentTime %= this.taqa;
               }
               else
               {
                  this.alive = false;
               }
            }
            this.position.x = this.light.x;
            this.position.y = this.light.y;
            this.position.z = this.light.z;
            _local_3 = Vector3.distanceBetween(this.position,_arg_2.position);
            if(_local_3 > this.donofa)
            {
               _local_4 = 1 - (_local_3 - this.donofa) / (this.fesuhum - this.donofa);
               this.light.intensity *= _local_4;
               this.light.visible = _local_3 < this.fesuhum;
            }
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.animation = null;
         this.dugoceq.destroy();
         this.dugoceq = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

