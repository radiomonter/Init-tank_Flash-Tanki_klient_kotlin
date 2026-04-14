package alternativa.tanks.models.battle.battlefield
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renderer;
   
   public class Object3DRevolver implements Renderer
   {
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private var object:Object3D;
      
      private var axis:Vector3;
      
      private var angularSpeed:Number;
      
      private var orientation:Quaternion = new Quaternion();
      
      public function Object3DRevolver(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Number)
      {
         super();
         this.object = _arg_1;
         this.axis = _arg_2.clone().normalize();
         this.angularSpeed = _arg_3 / 1000;
         this.orientation.setFromEulerAnglesXYZ(_arg_1.rotationX,_arg_1.rotationY,_arg_1.rotationZ);
      }
      
      public function lelipeq(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.axis.reset(_arg_1,_arg_2,_arg_3).normalize();
      }
      
      public function gyzilunyju(_arg_1:Number) : void
      {
         this.angularSpeed = _arg_1 / 1000;
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.angularSpeed != 0)
         {
            this.orientation.addScaledVector(this.axis,this.angularSpeed * _arg_2);
            this.orientation.getEulerAngles(eulerAngles);
            this.object.rotationX = eulerAngles.x;
            this.object.rotationY = eulerAngles.y;
            this.object.rotationZ = eulerAngles.z;
         }
      }
   }
}

