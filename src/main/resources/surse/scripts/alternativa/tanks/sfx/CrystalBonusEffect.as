package alternativa.tanks.sfx
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.kofen.Vector3d;
   
   public class CrystalBonusEffect extends PooledObject implements GraphicEffect
   {
      
      private var sprite:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var maxHeight:Number;
      
      private var visibleHeight:Number;
      
      private var heightSpeed:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var startPosition:Vector3d;
      
      private var container:Scene3DContainer;
      
      public function CrystalBonusEffect(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new Sprite3D(10,10);
      }
      
      public function init(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Vector3d, _arg_12:TextureMaterial, _arg_13:String) : void
      {
         this.delay = _arg_1;
         this.sprite.width = _arg_2;
         this.sprite.height = _arg_3;
         this.sprite.calculateBounds();
         this.sprite.rotation = _arg_4;
         this.maxHeight = _arg_5;
         this.visibleHeight = _arg_6;
         this.heightSpeed = _arg_7;
         this.x = _arg_8;
         this.y = _arg_9;
         this.z = _arg_10;
         this.startPosition = _arg_11;
         _arg_12.resolution = 1;
         this.sprite.material = _arg_12;
         this.sprite.softAttenuation = 150;
         this.sprite.depthMapAlphaThreshold = 2;
         this.sprite.shadowMapAlphaThreshold = 2;
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
         this.sprite.blendMode = _arg_13;
         this.sprite.alpha = 0;
         this.time = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.sprite);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         if(this.z >= this.maxHeight)
         {
            return false;
         }
         this.sprite.x = this.startPosition.x + this.x;
         this.sprite.y = this.startPosition.y + this.y;
         this.sprite.z = this.startPosition.z + this.z;
         this.time += _arg_1;
         if(this.time >= this.delay)
         {
            this.z += this.maxHeight * this.heightSpeed * _arg_1 * 0.001;
            if(this.z < this.visibleHeight)
            {
               this.sprite.alpha = this.z / this.visibleHeight;
            }
            else
            {
               _local_3 = (this.z - this.visibleHeight) / (this.maxHeight - this.visibleHeight);
               this.sprite.alpha = 1 - _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3 * _local_3;
            }
            if(this.sprite.alpha < 0)
            {
               this.sprite.alpha = 0;
            }
            if(this.sprite.alpha > 1)
            {
               this.sprite.alpha = 1;
            }
         }
         else
         {
            this.sprite.alpha = 0;
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         this.sprite.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.z = this.maxHeight;
         this.sprite.alpha = 0;
      }
   }
}

