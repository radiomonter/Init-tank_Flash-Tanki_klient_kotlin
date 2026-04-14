package obfuscation.rofa
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Vyfeqyfy extends PooledObject implements GraphicEffect
   {
      
      public static const jeq:Number = 1 / 2.2;
      
      private var light:OmniLight;
      
      private var time:int;
      
      private var currentTime:int;
      
      private var jefez:Number;
      
      private var container:Scene3DContainer;
      
      private var topo:Number;
      
      public function Vyfeqyfy(_arg_1:Pool)
      {
         super(_arg_1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(_arg_1:OmniLight, _arg_2:int, _arg_3:Number = 0.454545454545455) : void
      {
         this.light.intensity = _arg_1.intensity;
         this.light.color = _arg_1.color;
         this.light.attenuationBegin = _arg_1.attenuationBegin;
         this.light.attenuationEnd = _arg_1.attenuationEnd;
         this.light.x = _arg_1.x;
         this.light.y = _arg_1.y;
         this.light.z = _arg_1.z;
         this.light.calculateBounds();
         this.time = _arg_2;
         this.jefez = _arg_3;
         this.topo = _arg_1.intensity;
         this.currentTime = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.light);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         this.currentTime += _arg_1;
         this.currentTime = Math.min(this.currentTime,this.time);
         var _local_3:Number = 1 - this.currentTime / this.time;
         this.light.intensity = this.topo * Math.pow(_local_3,this.jefez);
         return this.currentTime < this.time;
      }
      
      public function destroy() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.light);
            this.container = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.light = null;
      }
   }
}

