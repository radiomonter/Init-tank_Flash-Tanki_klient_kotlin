package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Dujezomi extends PooledObject implements GraphicEffect
   {
      
      private static const raweryduj:Number = 1.5;
      
      private static const position:Vector3 = new Vector3();
      
      private static const wekoqyt:Vector3 = new Vector3();
      
      private var light:TubeLight;
      
      private var dugoceq:Toli;
      
      private var mycijilyz:Toli;
      
      private var animation:LightAnimation;
      
      private var currentTime:int;
      
      private var taqa:int;
      
      private var qawokyb:Boolean;
      
      private var alive:Boolean;
      
      private var target:Object3D;
      
      private var container:Scene3DContainer;
      
      public function Dujezomi(_arg_1:Pool)
      {
         super(_arg_1);
         this.light = new TubeLight(0,0,0,0,0);
         this.target = new Object3D();
      }
      
      public function init(_arg_1:Toli, _arg_2:Toli, _arg_3:LightAnimation, _arg_4:Boolean = false) : void
      {
         this.rugil(_arg_1,_arg_2,_arg_3.tudy(),_arg_3,_arg_4);
      }
      
      public function rugil(_arg_1:Toli, _arg_2:Toli, _arg_3:int, _arg_4:LightAnimation, _arg_5:Boolean = false) : void
      {
         this.dugoceq = _arg_1;
         this.mycijilyz = _arg_2;
         this.taqa = _arg_3;
         this.currentTime = 0;
         this.animation = _arg_4;
         this.qawokyb = _arg_5;
         this.alive = true;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.light);
         _arg_1.addChild(this.target);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.alive)
         {
            this.animation.raci(this.light,this.currentTime,this.taqa);
            this.dugoceq.lulik(this.light,_arg_2,_arg_1);
            this.mycijilyz.lulik(this.target,_arg_2,_arg_1);
            this.currentTime += _arg_1;
            position.x = this.light.x;
            position.y = this.light.y;
            position.z = this.light.z;
            wekoqyt.x = this.target.x;
            wekoqyt.y = this.target.y;
            wekoqyt.z = this.target.z;
            _local_3 = Vector3.distanceBetween(position,wekoqyt);
            _local_4 = _arg_2.farClipping / raweryduj;
            _local_3 = _local_3 > _local_4 ? Number(_local_4) : Number(_local_3);
            this.light.length = _local_3;
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
            this.light.lookAt(this.target.x,this.target.y,this.target.z);
            this.light.falloff = this.light.attenuationEnd - this.light.attenuationBegin;
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container.removeChild(this.target);
         this.container = null;
         this.animation = null;
         this.dugoceq = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

