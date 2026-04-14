package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.ShadowMap;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Color;
   import flash.geom.Vector3D;
   
   public class Lighting
   {
      
      private static const vybuhyh:int = 2048;
      
      private static const dajelaw:Number = 0.5;
      
      private static const susamomy:Number = 10000;
      
      private static const fynujopol:Number = 5000;
      
      private static const janifige:Number = 10000;
      
      private var lightColor:Color;
      
      private var shadowColor:Color;
      
      private var angleX:Number = 0;
      
      private var angleZ:Number = 0;
      
      private var direction:Vector3D = new Vector3D(1,1,1);
      
      private var camera:Camera3D;
      
      public function Lighting(_arg_1:Camera3D)
      {
         super();
         this.camera = _arg_1;
      }
      
      public function gunysa() : void
      {
         this.camera.shadowMap = new ShadowMap(vybuhyh,fynujopol,janifige,dajelaw,susamomy);
      }
      
      public function tajada() : void
      {
         if(this.camera.shadowMap != null)
         {
            this.camera.shadowMap.dispose();
            this.camera.shadowMap = null;
         }
      }
      
      public function mahokobes() : void
      {
         this.camera.directionalLight = new DirectionalLight(this.lightColor.quruqa());
         this.camera.directionalLight.lookAt(this.direction.x,this.direction.y,this.direction.z);
         this.camera.ambientColor = this.shadowColor.quruqa();
      }
      
      public function sazeli() : void
      {
         this.camera.directionalLight = null;
      }
      
      public function setup(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number) : void
      {
         this.lightColor = new Color(_arg_1);
         this.shadowColor = new Color(_arg_2);
         this.lightColor.subtract(this.shadowColor);
         this.angleX = _arg_3;
         this.angleZ = _arg_4;
         this.qenyna();
      }
      
      private function qenyna() : void
      {
         var _local_1:Matrix3 = new Matrix3();
         _local_1.setRotationMatrix(this.angleX,0,this.angleZ);
         var _local_2:Vector3 = new Vector3(0,1,0);
         _local_2.transform3(_local_1);
         this.direction.x = _local_2.x;
         this.direction.y = _local_2.y;
         this.direction.z = _local_2.z;
      }
      
      public function toggle() : void
      {
         if(this.camera.shadowMap == null)
         {
            this.gunysa();
         }
         else
         {
            this.tajada();
         }
      }
   }
}

