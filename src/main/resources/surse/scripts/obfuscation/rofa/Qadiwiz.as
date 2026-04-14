package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Qadiwiz extends PooledObject implements Toli
   {
      
      private var position:Vector3 = new Vector3();
      
      public function Qadiwiz(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function setPosition(_arg_1:Vector3) : void
      {
         this.position.copy(_arg_1);
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         _arg_1.x = this.position.x;
         _arg_1.y = this.position.y;
         _arg_1.z = this.position.z;
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

