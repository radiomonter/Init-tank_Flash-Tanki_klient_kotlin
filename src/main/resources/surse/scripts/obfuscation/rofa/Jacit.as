package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.kyre.Myw;
   
   public class Jacit extends PooledObject implements Toli
   {
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const hiwanu:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const cipyqolo:Vector3 = new Vector3();
      
      private static const cugu:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private static const sodasyjek:Number = 20;
      
      private static const ranycuqeh:Number = 0.2;
      
      private var fesuhum:Number;
      
      private var collisionDetector:CollisionDetector;
      
      private var somip:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var coeff:Number;
      
      private var zytadifo:Number = 0;
      
      public function Jacit(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      private function nop() : void
      {
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cipyqolo.x = cojo.m00;
         cipyqolo.y = cojo.m10;
         cipyqolo.z = cojo.m20;
         direction.x = cojo.m01;
         direction.y = cojo.m11;
         direction.z = cojo.m21;
         cojo.transformVector(this.somip,cugu);
         var _local_1:Number = this.somip.y;
         hiwanu.x = cugu.x - _local_1 * direction.x;
         hiwanu.y = cugu.y - _local_1 * direction.y;
         hiwanu.z = cugu.z - _local_1 * direction.z;
      }
      
      public function init(_arg_1:Object3D, _arg_2:Vector3, _arg_3:CollisionDetector, _arg_4:Number, _arg_5:Number = 0.5) : void
      {
         this.turret = _arg_1;
         this.somip = _arg_2;
         this.collisionDetector = _arg_3;
         this.fesuhum = _arg_4;
         this.coeff = _arg_5;
         this.zytadifo = 0;
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         this.nop();
         var _local_2:Number = this.fesuhum * this.coeff;
         if(this.collisionDetector.raycastStatic(hiwanu,direction,Myw.dyhan,this.fesuhum,null,intersection))
         {
            _local_2 = Vector3.distanceBetween(hiwanu,intersection.position) * this.coeff;
         }
         var _local_3:Number = _local_2 - this.zytadifo;
         if(Math.abs(_local_3) <= sodasyjek)
         {
            this.zytadifo = _local_2;
         }
         else
         {
            this.zytadifo += _local_3 * ranycuqeh;
         }
         _arg_1.x = hiwanu.x + direction.x * this.zytadifo;
         _arg_1.y = hiwanu.y + direction.y * this.zytadifo;
         _arg_1.z = hiwanu.z + direction.z * this.zytadifo;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         this.zosow(_arg_1);
      }
      
      public function destroy() : void
      {
         this.turret = null;
         this.collisionDetector = null;
         recycle();
      }
   }
}

