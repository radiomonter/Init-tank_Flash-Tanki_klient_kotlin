package obfuscation.sujovigup
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.display.BlendMode;
   
   public class Rajola extends PooledObject implements GraphicEffect
   {
      
      private static const vector:Vector3 = new Vector3();
      
      private var fufuvyvan:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var bodef:Number;
      
      private var direction:Boolean;
      
      private var turret:Object3D;
      
      private var state:int;
      
      private var container:Scene3DContainer;
      
      public function Rajola(_arg_1:Pool)
      {
         super(_arg_1);
         this.fufuvyvan = new Sprite3D(10,10);
         this.fufuvyvan.blendMode = BlendMode.ADD;
      }
      
      public function init(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Boolean, _arg_5:Object3D, _arg_6:TextureMaterial) : void
      {
         this.delay = _arg_1;
         this.fufuvyvan.width = _arg_2;
         this.fufuvyvan.height = _arg_2;
         this.fufuvyvan.calculateBounds();
         this.bodef = _arg_3;
         this.direction = _arg_4;
         this.turret = _arg_5;
         _arg_6.resolution = 5;
         this.fufuvyvan.material = _arg_6;
         this.fufuvyvan.scaleX = 1;
         this.fufuvyvan.scaleY = 1;
         this.fufuvyvan.scaleZ = 1;
         this.fufuvyvan.rotation = 0;
         this.fufuvyvan.alpha = 0;
         this.state = 0;
         this.fufuvyvan.softAttenuation = 150;
         this.fufuvyvan.depthMapAlphaThreshold = 2;
         this.fufuvyvan.shadowMapAlphaThreshold = 2;
         this.fufuvyvan.useShadowMap = false;
         this.fufuvyvan.useLight = false;
         this.time = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.fufuvyvan);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         if(this.state == 2)
         {
            return false;
         }
         var _local_6:Number = 0.7 * 5;
         var _local_7:Number = _local_6 / 3;
         var _local_8:Number = 0.2;
         _local_3 = 300;
         vector.x = _arg_2.x - this.turret.x;
         vector.y = _arg_2.y - this.turret.y;
         vector.z = _arg_2.z - this.turret.z;
         vector.normalize();
         vector.scale(_local_3);
         this.fufuvyvan.x = this.turret.x + vector.x;
         this.fufuvyvan.y = this.turret.y + vector.y;
         this.fufuvyvan.z = this.turret.z + vector.z + 30;
         this.time += _arg_1;
         if(this.time >= this.delay)
         {
            if(this.direction)
            {
               this.fufuvyvan.rotation += _local_8 * _arg_1 * 0.001;
            }
            else
            {
               this.fufuvyvan.rotation -= _local_8 * _arg_1 * 0.001;
            }
            if(this.state == 0)
            {
               _local_4 = _local_6 * _arg_1 * 0.001;
               this.fufuvyvan.scaleX += _local_4;
               this.fufuvyvan.scaleY += _local_4;
               this.fufuvyvan.scaleZ += _local_4;
               if(this.fufuvyvan.scaleX > this.bodef)
               {
                  this.fufuvyvan.scaleX = this.bodef;
                  this.fufuvyvan.scaleY = this.bodef;
                  this.fufuvyvan.scaleZ = this.bodef;
                  this.state = 1;
               }
               this.fufuvyvan.alpha = (this.fufuvyvan.scaleX - 1) / (this.bodef - 1);
            }
            else if(this.state == 1)
            {
               _local_5 = _local_7 * _arg_1 * 0.001;
               this.fufuvyvan.scaleX -= _local_5;
               this.fufuvyvan.scaleY -= _local_5;
               this.fufuvyvan.scaleZ -= _local_5;
               if(this.fufuvyvan.scaleX < 1)
               {
                  this.fufuvyvan.scaleX = 1;
                  this.fufuvyvan.scaleY = 1;
                  this.fufuvyvan.scaleZ = 1;
                  this.state = 2;
               }
               this.fufuvyvan.alpha = (this.fufuvyvan.scaleX - 1) / (this.bodef - 1) - 0.1;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.fufuvyvan);
         this.container = null;
         this.fufuvyvan.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.state = 2;
         this.fufuvyvan.alpha = 0;
      }
   }
}

