package obfuscation.rofa
{
   import alternativa.engine3d.core.Light3D;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Tykehyl extends PooledObject implements GraphicEffect
   {
      
      private static const zyse:int = 250;
      
      protected var light:Light3D;
      
      protected var baboqawu:LightAnimation;
      
      protected var zowijiha:LightAnimation;
      
      protected var startTime:int;
      
      protected var biw:int;
      
      protected var bub:int;
      
      protected var currentTime:int;
      
      protected var boritaqah:Boolean;
      
      protected var dugoceq:Toli;
      
      protected var alive:Boolean;
      
      protected var random:int;
      
      protected var qygity:Boolean;
      
      protected var fadeTime:int;
      
      protected var container:Scene3DContainer;
      
      public function Tykehyl(_arg_1:Pool, _arg_2:Light3D)
      {
         super(_arg_1);
         this.light = _arg_2;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.light);
      }
      
      private function vafoz() : void
      {
         this.bub = this.biw + (Math.random() * this.random - this.random / 2);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         if(this.boritaqah)
         {
            this.currentTime += _arg_1;
            this.baboqawu.raci(this.light,this.currentTime,this.startTime);
            if(this.currentTime >= this.startTime)
            {
               this.boritaqah = false;
               this.currentTime = 0;
               this.vafoz();
            }
         }
         else
         {
            this.currentTime += _arg_1;
            if(this.currentTime > this.bub)
            {
               this.currentTime %= this.bub;
               this.vafoz();
            }
            this.zowijiha.raci(this.light,this.currentTime,this.biw);
         }
         this.dugoceq.lulik(this.light,_arg_2,_arg_1);
         if(this.qygity)
         {
            this.fadeTime += _arg_1;
            if(this.fadeTime <= zyse)
            {
               this.light.intensity *= 1 - this.fadeTime / zyse;
            }
            else
            {
               this.light.intensity = 0;
               this.kill();
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.baboqawu = null;
         this.zowijiha = null;
         this.dugoceq.destroy();
         this.dugoceq = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function stop() : void
      {
         this.qygity = true;
         this.fadeTime = 0;
      }
   }
}

