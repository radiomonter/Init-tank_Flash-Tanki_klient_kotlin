package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Jywaca extends PooledObject implements GraphicEffect
   {
      
      private static const vysepy:Number = 100;
      
      private var modaqe:Number;
      
      protected var scale:Number;
      
      protected var wagunuzo:Number;
      
      protected var caru:Tuhu;
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var container:Scene3DContainer;
      
      public function Jywaca(_arg_1:Pool)
      {
         super(_arg_1);
         this.caru = new Tuhu(vysepy);
         this.caru.useShadowMap = false;
         this.caru.useLight = false;
         this.caru.shadowMapAlphaThreshold = 2;
         this.caru.depthMapAlphaThreshold = 2;
         this.caru.softAttenuation = 0;
      }
      
      public function init(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3, _arg_4:TextureAnimation, _arg_5:Number) : void
      {
         this.caru.init(_arg_4,0.001 * _arg_4.fps);
         this.maxTime = this.caru.sykypypob();
         this.currentTime = 0;
         this.modaqe = 0.001 * _arg_5;
         this.wagunuzo = _arg_1 / vysepy;
         this.scale = this.wagunuzo;
         this.caru.x = _arg_2.x;
         this.caru.y = _arg_2.y;
         this.caru.z = _arg_2.z;
         this.caru.rotationX = _arg_3.x;
         this.caru.rotationY = _arg_3.y;
         this.caru.rotationZ = _arg_3.z;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.caru);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.caru.setTime(this.currentTime);
         this.currentTime += _arg_1;
         this.caru.scaleX = this.scale;
         this.caru.scaleY = this.scale;
         this.scale = this.wagunuzo + this.wagunuzo * this.modaqe * this.currentTime;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.caru);
         this.container = null;
         this.caru.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.currentTime = this.maxTime;
      }
   }
}

