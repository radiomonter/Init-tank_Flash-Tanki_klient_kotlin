package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.rofa.AnimatedPlane;
   import obfuscation.rofa.Jyj;
   
   public class Maweci extends PooledObject implements GraphicEffect
   {
      
      private var position:Vector3 = new Vector3();
      
      private var direction:Vector3 = new Vector3();
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var caru:AnimatedPlane;
      
      private var container:Scene3DContainer;
      
      public function Maweci(_arg_1:Pool)
      {
         super(_arg_1);
         this.caru = new AnimatedPlane(30,200,0,-100,0);
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:TextureAnimation) : void
      {
         this.position.copy(_arg_1);
         this.direction.copy(_arg_2);
         this.caru.init(_arg_3,0.001 * _arg_3.fps);
         this.maxTime = this.caru.sykypypob();
         this.currentTime = 0;
         this.caru.x = _arg_1.x;
         this.caru.y = _arg_1.y;
         this.caru.z = _arg_1.z;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.caru.setTime(this.currentTime);
         this.currentTime += _arg_1;
         Jyj.moruqogi(this.caru,this.position,this.direction,_arg_2.position);
         return true;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.caru);
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

