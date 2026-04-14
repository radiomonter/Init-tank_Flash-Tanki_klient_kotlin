package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Kahaciw extends PooledObject implements Toli
   {
      
      private var jedicegi:Vector3 = new Vector3();
      
      private var velocity:Vector3 = new Vector3();
      
      private var hofipefam:Number;
      
      public function Kahaciw(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         _arg_1.x = this.jedicegi.x;
         _arg_1.y = this.jedicegi.y;
         _arg_1.z = this.jedicegi.z;
         _arg_1.scaleX = 1;
         _arg_1.scaleY = 1;
         _arg_1.scaleZ = 1;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         this.jedicegi.copy(_arg_1);
         this.velocity.copy(_arg_2);
         this.hofipefam = _arg_3;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         var _local_4:Number = 0.001 * _arg_3;
         _arg_1.x += this.velocity.x * _local_4;
         _arg_1.y += this.velocity.y * _local_4;
         _arg_1.z += this.velocity.z * _local_4;
         _arg_1.scaleX += this.hofipefam;
         _arg_1.scaleY += this.hofipefam;
         _arg_1.scaleZ += this.hofipefam;
      }
      
      public function destroy() : void
      {
      }
   }
}

