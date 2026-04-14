package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Jiby extends PooledObject implements Toli
   {
      
      private var normal:Vector3 = new Vector3();
      
      private var position:Vector3 = new Vector3();
      
      private var distance:Number;
      
      private var sudam:Vector3 = new Vector3();
      
      public function Jiby(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         this.position.copy(_arg_1);
         this.normal.copy(_arg_2);
         this.distance = _arg_3;
         this.normal.normalize();
         this.compute();
      }
      
      private function compute() : void
      {
         this.sudam.copy(this.normal);
         this.sudam.scale(this.distance);
         this.sudam.add(this.position);
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         _arg_1.x = this.sudam.x;
         _arg_1.y = this.sudam.y;
         _arg_1.z = this.sudam.z;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         this.zosow(_arg_1);
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

