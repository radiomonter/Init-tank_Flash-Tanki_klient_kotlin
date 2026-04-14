package alternativa.tanks.camera
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.CameraFovCalculator;
   
   public class GameCamera extends Camera3D
   {
      
      private static const m:Matrix3 = new Matrix3();
      
      public var position:Vector3 = new Vector3();
      
      public var ziko:Vector3 = new Vector3();
      
      public var viludane:Vector3 = new Vector3();
      
      public var kifotabim:Vector3 = new Vector3();
      
      public function GameCamera()
      {
         super();
         nearClipping = 40;
         farClipping = 200000;
         z = 10000;
         rotationX = -0.01;
         diagramVerticalMargin = 35;
      }
      
      public function qigicowap() : void
      {
         var _local_1:Number = NaN;
         var _local_2:Number = Math.cos(rotationX);
         var _local_3:Number = Math.sin(rotationX);
         var _local_4:Number = Math.cos(rotationY);
         var _local_5:Number = Math.sin(rotationY);
         _local_1 = Math.cos(rotationZ);
         var _local_6:Number = Math.sin(rotationZ);
         var _local_7:Number = _local_1 * _local_5;
         var _local_8:Number = _local_6 * _local_5;
         this.ziko.x = _local_1 * _local_4;
         this.viludane.x = _local_7 * _local_3 - _local_6 * _local_2;
         this.kifotabim.x = _local_7 * _local_2 + _local_6 * _local_3;
         this.ziko.y = _local_6 * _local_4;
         this.viludane.y = _local_8 * _local_3 + _local_1 * _local_2;
         this.kifotabim.y = _local_8 * _local_2 - _local_1 * _local_3;
         this.ziko.z = -_local_5;
         this.viludane.z = _local_4 * _local_3;
         this.kifotabim.z = _local_4 * _local_2;
         this.position.x = x;
         this.position.y = y;
         this.position.z = z;
      }
      
      public function tywaho(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         m.setRotationMatrix(rotationX,rotationY,rotationZ);
         m.transformVector(_arg_1,_arg_2);
      }
      
      public function qifojyzi(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         m.setRotationMatrix(rotationX,rotationY,rotationZ);
         m.transformVectorInverse(_arg_1,_arg_2);
      }
      
      public function setPosition(_arg_1:Vector3) : void
      {
         x = _arg_1.x;
         y = _arg_1.y;
         z = _arg_1.z;
      }
      
      public function buwasuduv() : void
      {
         fov = CameraFovCalculator.mysepokuw(view.width,view.height);
      }
   }
}

