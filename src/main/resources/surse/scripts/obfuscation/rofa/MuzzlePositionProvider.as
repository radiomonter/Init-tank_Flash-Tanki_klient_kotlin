package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class MuzzlePositionProvider extends PooledObject implements Toli
   {
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const gija:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var zeteqysig:Vector3 = new Vector3();
      
      public function MuzzlePositionProvider(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Number = 0) : void
      {
         this.turret = _arg_1;
         this.zeteqysig.copy(_arg_2);
         this.zeteqysig.y += _arg_3;
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cojo.transformVector(this.zeteqysig,gija);
         _arg_1.x = gija.x;
         _arg_1.y = gija.y;
         _arg_1.z = gija.z;
      }
      
      public function destroy() : void
      {
         this.turret = null;
      }
   }
}

