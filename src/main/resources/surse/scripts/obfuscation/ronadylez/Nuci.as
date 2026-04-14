package obfuscation.ronadylez
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   
   public class Nuci implements Vyhesuz
   {
      
      private var object:Object3D;
      
      public function Nuci(_arg_1:Object3D)
      {
         super();
         this.object = _arg_1;
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.object.x;
         _arg_1.y = this.object.y;
         _arg_1.z = this.object.z;
      }
      
      public function setAlphaMultiplier(_arg_1:Number) : void
      {
         this.object.alpha = _arg_1;
      }
   }
}

