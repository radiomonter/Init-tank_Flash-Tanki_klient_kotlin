package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Duqudi extends PooledObject implements Toli
   {
      
      private var jedicegi:Vector3 = new Vector3();
      
      private var velocity:Vector3 = new Vector3();
      
      private var acceleration:Number;
      
      public function Duqudi(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         _arg_1.x = this.jedicegi.x;
         _arg_1.y = this.jedicegi.y;
         _arg_1.z = this.jedicegi.z;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         this.jedicegi.copy(_arg_1);
         this.velocity.copy(_arg_2);
         this.acceleration = _arg_3;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         var _local_4:Number = NaN;
         _local_4 = 0.001 * _arg_3;
         _arg_1.x += this.velocity.x * _local_4;
         _arg_1.y += this.velocity.y * _local_4;
         _arg_1.z += this.velocity.z * _local_4;
         var _local_5:Number = this.velocity.length();
         _local_5 += this.acceleration * _local_4;
         if(_local_5 <= 0)
         {
            this.velocity.reset();
         }
         else
         {
            this.velocity.normalize();
            this.velocity.scale(_local_5);
         }
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

