package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   
   public class Dyqiw extends Zyzy
   {
      
      public function Dyqiw()
      {
         super();
      }
      
      protected function setPosition(_arg_1:Vector3) : void
      {
         var _local_2:GameCamera = cewubu();
         _local_2.x = _arg_1.x;
         _local_2.y = _arg_1.y;
         _local_2.z = _arg_1.z;
      }
      
      protected function setOrientation(_arg_1:Vector3) : void
      {
         var _local_2:GameCamera = null;
         _local_2 = cewubu();
         _local_2.rotationX = _arg_1.x;
         _local_2.rotationY = _arg_1.y;
         _local_2.rotationZ = _arg_1.z;
      }
      
      protected function wawaj(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         var _local_4:GameCamera = null;
         _local_4 = null;
         _local_4 = cewubu();
         _local_4.rotationX += _arg_1;
         _local_4.rotationY += _arg_2;
         _local_4.rotationZ += _arg_3;
      }
      
      protected function turono() : Vector3
      {
         var _local_1:GameCamera = cewubu();
         return _local_1.position;
      }
      
      protected function pemyw() : Number
      {
         var _local_1:GameCamera = cewubu();
         return _local_1.rotationX;
      }
      
      protected function topihog() : Number
      {
         var _local_1:GameCamera = cewubu();
         return _local_1.rotationY;
      }
      
      protected function fofiza() : Number
      {
         var _local_1:GameCamera = cewubu();
         return _local_1.rotationZ;
      }
   }
}

