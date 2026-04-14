package obfuscation.jebucahu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   public class Jybupow
   {
      
      private var namibe:Vector3;
      
      private var transform:Matrix4;
      
      public function Jybupow(_arg_1:Object3D)
      {
         super();
         this.namibe = new Vector3(_arg_1.boundMaxX - _arg_1.boundMinX,_arg_1.boundMaxY - _arg_1.boundMinY,_arg_1.boundMaxZ - _arg_1.boundMinZ);
         this.namibe = this.namibe.scale(0.5);
         this.transform = new Matrix4();
         var _local_2:Vector3 = new Vector3(_arg_1.boundMaxX + _arg_1.boundMinX,_arg_1.boundMinY + _arg_1.boundMaxY,_arg_1.boundMinZ + _arg_1.boundMaxZ);
         _local_2.scale(0.5);
         this.transform.setMatrix(_local_2.x + _arg_1.x,_local_2.y + _arg_1.y,_local_2.z + _arg_1.z,_arg_1.rotationX,_arg_1.rotationY,_arg_1.rotationZ);
      }
      
      public function gewi() : Vector3
      {
         return this.namibe;
      }
      
      public function cubysys() : Matrix4
      {
         return this.transform;
      }
   }
}

