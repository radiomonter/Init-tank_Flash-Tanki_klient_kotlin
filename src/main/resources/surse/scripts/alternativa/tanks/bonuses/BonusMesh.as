package alternativa.tanks.bonuses
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   import flash.geom.ColorTransform;
   
   public class BonusMesh extends BonusObject3DBase
   {
      
      private var bonusColorTransform:ColorTransform;
      
      private var combinedColorTransform:ColorTransform = new ColorTransform();
      
      private var objectId:String;
      
      public function BonusMesh(_arg_1:String, _arg_2:Mesh)
      {
         super();
         this.objectId = _arg_1;
         object = this.createMesh(_arg_2);
      }
      
      private function createMesh(_arg_1:Mesh) : Mesh
      {
         var _local_2:Mesh = Mesh(_arg_1.clone());
         var _local_3:Face = _arg_1.faces[0];
         _local_2.setMaterialToAllFaces(_local_3.material);
         _local_2.sorting = Sorting.DYNAMIC_BSP;
         return _local_2;
      }
      
      public function init() : void
      {
         object.rotationX = 0;
         object.rotationY = 0;
         object.rotationZ = 0;
         this.setScale(1);
         setAlpha(1);
         setAlphaMultiplier(1);
      }
      
      public function setScale(_arg_1:Number) : void
      {
         object.scaleX = _arg_1;
         object.scaleY = _arg_1;
         object.scaleZ = _arg_1;
      }
      
      public function getObjectId() : String
      {
         return this.objectId;
      }
      
      public function recycle() : void
      {
         removeFromScene();
         object.colorTransform = null;
         BonusCache.putBonusMesh(this);
      }
      
      public function setRotationZ(_arg_1:Number) : void
      {
         object.rotationZ = _arg_1;
      }
      
      public function setColorTransform(_arg_1:ColorTransform) : void
      {
         if(this.bonusColorTransform != null)
         {
            if(_arg_1 == null)
            {
               object.colorTransform = this.bonusColorTransform;
            }
            else
            {
               this.copyColorTransform(this.bonusColorTransform,this.combinedColorTransform);
               this.combinedColorTransform.concat(_arg_1);
               object.colorTransform = this.combinedColorTransform;
            }
         }
         else
         {
            object.colorTransform = _arg_1;
         }
      }
      
      public function addRotationZ(_arg_1:Number) : void
      {
         object.rotationZ += _arg_1;
      }
      
      public function getScale() : Number
      {
         return object.scaleX;
      }
      
      private function copyColorTransform(_arg_1:ColorTransform, _arg_2:ColorTransform) : void
      {
         _arg_2.redMultiplier = _arg_1.redMultiplier;
         _arg_2.greenMultiplier = _arg_1.greenMultiplier;
         _arg_2.blueMultiplier = _arg_1.blueMultiplier;
         _arg_2.alphaMultiplier = _arg_1.alphaMultiplier;
         _arg_2.redOffset = _arg_1.redOffset;
         _arg_2.greenOffset = _arg_1.greenOffset;
         _arg_2.blueOffset = _arg_1.blueOffset;
         _arg_2.alphaOffset = _arg_1.alphaOffset;
      }
   }
}

