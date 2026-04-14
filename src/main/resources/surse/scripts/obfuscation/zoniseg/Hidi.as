package obfuscation.zoniseg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.Bizotevuf;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.rofa.Nyr;
   
   public class Hidi extends PooledObject implements GraphicEffect
   {
      
      private static const gija:Vector3 = new Vector3();
      
      private static const matrix:Matrix4 = new Matrix4();
      
      protected var sprite:Sprite3D;
      
      private var rahypeta:Number;
      
      private var tepe:Number;
      
      private var sakito:Vector.<Bizotevuf>;
      
      private var numFrames:int;
      
      private var somip:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var listener:Nyr;
      
      private var container:Scene3DContainer;
      
      public function Hidi(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new Sprite3D(1,1);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:TextureAnimation, _arg_4:Vector3, _arg_5:Object3D, _arg_6:Number, _arg_7:Number, _arg_8:Nyr) : void
      {
         this.kyf(_arg_1,_arg_2,_arg_6,_arg_3.material);
         this.sakito = _arg_3.sakito;
         this.rahypeta = 0.001 * _arg_7;
         this.somip.copy(_arg_4);
         this.somip.y += 10;
         this.turret = _arg_5;
         this.listener = _arg_8;
         this.numFrames = this.sakito.length;
         this.tepe = 0;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.sprite);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.tepe >= this.numFrames)
         {
            return false;
         }
         matrix.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         matrix.transformVector(this.somip,gija);
         this.sprite.x = gija.x;
         this.sprite.y = gija.y;
         this.sprite.z = gija.z;
         this.metobe(this.sakito[int(this.tepe)]);
         this.tepe += this.rahypeta * _arg_1;
         return true;
      }
      
      private function metobe(_arg_1:Bizotevuf) : void
      {
         this.sprite.topLeftU = _arg_1.topLeftU;
         this.sprite.topLeftV = _arg_1.topLeftV;
         this.sprite.bottomRightU = _arg_1.bottomRightU;
         this.sprite.bottomRightV = _arg_1.bottomRightV;
      }
      
      public function destroy() : void
      {
         this.listener.sabeva(this);
         this.listener = null;
         this.container.removeChild(this.sprite);
         this.sprite.material = null;
         this.sakito = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.tepe = this.numFrames + 1;
      }
      
      private function kyf(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:TextureMaterial) : void
      {
         this.sprite.width = _arg_1;
         this.sprite.height = _arg_2;
         this.sprite.rotation = _arg_3;
         this.sprite.material = _arg_4;
      }
   }
}

