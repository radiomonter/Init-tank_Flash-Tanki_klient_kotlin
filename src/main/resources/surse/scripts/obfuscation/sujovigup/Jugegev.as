package obfuscation.sujovigup
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Jugegev extends PooledObject implements GraphicEffect
   {
      
      private var fijel:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var lorycaji:Number;
      
      private var botir:Number;
      
      private var wetidam:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var object:Object3D;
      
      private var container:Scene3DContainer;
      
      public function Jugegev(_arg_1:Pool)
      {
         super(_arg_1);
         this.fijel = new Sprite3D(10,10);
      }
      
      public function init(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Object3D, _arg_12:TextureMaterial, _arg_13:String) : void
      {
         this.delay = _arg_1;
         this.fijel.width = _arg_2;
         this.fijel.height = _arg_3;
         this.fijel.calculateBounds();
         this.fijel.rotation = _arg_4;
         this.lorycaji = _arg_5;
         this.botir = _arg_6;
         this.wetidam = _arg_7;
         this.x = _arg_8;
         this.y = _arg_9;
         this.z = _arg_10;
         this.object = _arg_11;
         this.fijel.material = _arg_12;
         this.fijel.softAttenuation = 150;
         this.fijel.depthMapAlphaThreshold = 2;
         this.fijel.shadowMapAlphaThreshold = 2;
         this.fijel.useShadowMap = false;
         this.fijel.useLight = false;
         this.fijel.blendMode = _arg_13;
         this.fijel.alpha = 0;
         this.time = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.fijel);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         if(this.z >= this.lorycaji)
         {
            return false;
         }
         this.fijel.x = this.object.x + this.x;
         this.fijel.y = this.object.y + this.y;
         this.fijel.z = this.object.z + this.z;
         this.time += _arg_1;
         if(this.time >= this.delay)
         {
            this.z += this.lorycaji * this.wetidam * _arg_1 * 0.001;
            if(this.z < this.botir)
            {
               this.fijel.alpha = this.z / this.botir;
            }
            else
            {
               _local_3 = (this.z - this.botir) / (this.lorycaji - this.botir);
               this.fijel.alpha = 1 - _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3;
            }
            if(this.fijel.alpha < 0)
            {
               this.fijel.alpha = 0;
            }
            if(this.fijel.alpha > 1)
            {
               this.fijel.alpha = 1;
            }
         }
         else
         {
            this.fijel.alpha = 0;
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.fijel);
         this.container = null;
         this.fijel.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.z = this.lorycaji;
         this.fijel.alpha = 0;
      }
   }
}

