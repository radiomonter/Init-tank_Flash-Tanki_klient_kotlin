package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class StaticObject3DPositionProvider extends PooledObject implements Toli
   {
      
      private static const tewif:Vector3 = new Vector3();
      
      private var position:Vector3 = new Vector3();
      
      private var luhal:Number;
      
      public function StaticObject3DPositionProvider(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Vector3, _arg_2:Number) : void
      {
         this.position.copy(_arg_1);
         this.luhal = _arg_2;
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         _arg_1.x = this.position.x;
         _arg_1.y = this.position.y;
         _arg_1.z = this.position.z;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         tewif.x = _arg_2.x - this.position.x;
         tewif.y = _arg_2.y - this.position.y;
         tewif.z = _arg_2.z - this.position.z;
         tewif.normalize();
         _arg_1.x = this.position.x + this.luhal * tewif.x;
         _arg_1.y = this.position.y + this.luhal * tewif.y;
         _arg_1.z = this.position.z + this.luhal * tewif.z;
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

