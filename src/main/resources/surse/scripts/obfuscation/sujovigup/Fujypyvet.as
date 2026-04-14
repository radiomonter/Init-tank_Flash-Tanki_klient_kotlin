package obfuscation.sujovigup
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.display.BlendMode;
   
   public class Fujypyvet extends PooledObject implements GraphicEffect
   {
      
      private static const vysepy:Number = 300;
      
      private var tin:Myhosyz;
      
      private var delay:int;
      
      private var time:int;
      
      private var height:Number;
      
      private var lorycaji:Number;
      
      private var wetidam:Number;
      
      private var lydy:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var turret:Object3D;
      
      private var container:Scene3DContainer;
      
      public function Fujypyvet(_arg_1:Pool)
      {
         super(_arg_1);
         this.tin = new Myhosyz(vysepy);
         this.tin.blendMode = BlendMode.ADD;
      }
      
      public function init(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Object3D, _arg_11:TextureMaterial) : void
      {
         this.delay = _arg_1;
         this.tin.scaleX = _arg_2 / vysepy;
         this.height = _arg_3;
         this.lorycaji = _arg_4;
         this.wetidam = _arg_5;
         this.lydy = _arg_6;
         this.x = _arg_7;
         this.y = _arg_8;
         this.z = _arg_9;
         this.turret = _arg_10;
         this.tin.init(_arg_11);
         this.tin.softAttenuation = 150;
         this.tin.depthMapAlphaThreshold = 2;
         this.tin.shadowMapAlphaThreshold = 2;
         this.tin.useShadowMap = false;
         this.tin.useLight = false;
         this.tin.alpha = 0;
         this.time = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.tin);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.height >= this.lorycaji && this.tin.alpha <= 0)
         {
            return false;
         }
         this.tin.x = this.turret.x + this.x;
         this.tin.y = this.turret.y + this.y;
         this.tin.z = this.turret.z + this.z;
         this.tin.rotationZ = _arg_2.rotationZ;
         this.time += _arg_1;
         if(this.time >= this.delay)
         {
            if(this.height < this.lorycaji)
            {
               this.height += this.lorycaji * this.wetidam * _arg_1 * 0.001;
               if(this.height >= this.lorycaji)
               {
                  this.height = this.lorycaji;
               }
               this.tin.scaleZ = this.height / vysepy;
               this.tin.alpha = this.height / this.lorycaji;
            }
            else
            {
               this.tin.alpha -= this.lydy * _arg_1 * 0.001;
               if(this.tin.alpha < 0)
               {
                  this.tin.alpha = 0;
               }
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.tin);
         this.container = null;
         this.turret = null;
         this.tin.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.height = this.lorycaji;
         this.tin.alpha = 0;
      }
   }
}

