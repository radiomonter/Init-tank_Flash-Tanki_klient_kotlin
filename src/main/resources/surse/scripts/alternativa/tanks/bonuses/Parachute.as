package alternativa.tanks.bonuses
{
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.Mesh;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Parachute extends BonusObject3DBase implements AutoClosable
   {
      
      public static const RADIUS:Number = 266;
      
      public static const NUM_STRAPS:int = 12;
      
      public function Parachute(_arg_1:Mesh, _arg_2:Mesh)
      {
         super();
         var _local_3:Object3DContainer = new Object3DContainer();
         _local_3.addChild(this.createMesh(_arg_1));
         _local_3.addChild(this.createMesh(_arg_2));
         object = _local_3;
      }
      
      private function createMesh(_arg_1:Mesh) : Mesh
      {
         var _local_2:Mesh = Mesh(_arg_1.clone());
         _local_2.shadowMapAlphaThreshold = 2;
         return _local_2;
      }
      
      public function recycle() : void
      {
         removeFromScene();
         setAlpha(1);
         setAlphaMultiplier(1);
         object.scaleX = 1;
         object.scaleY = 1;
         object.scaleZ = 1;
         BonusCache.putParachute(this);
      }
      
      public function addScaleXY(_arg_1:Number) : void
      {
         object.scaleX += _arg_1;
         object.scaleY += _arg_1;
      }
      
      public function addScaleZ(_arg_1:Number) : void
      {
         object.scaleZ += _arg_1;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         var _local_1:Object3DContainer = Object3DContainer(object);
         while(_local_1.numChildren > 0)
         {
            _local_1.removeChildAt(0);
         }
         object = null;
      }
   }
}

