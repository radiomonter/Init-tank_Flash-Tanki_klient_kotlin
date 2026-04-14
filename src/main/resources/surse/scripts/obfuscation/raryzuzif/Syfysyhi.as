package obfuscation.raryzuzif
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class Syfysyhi implements Kedetino
   {
      
      private var qynuraq:PropMesh;
      
      private var textureName:String;
      
      private var desahi:Vector.<BSP> = new Vector.<BSP>();
      
      public function Syfysyhi(_arg_1:PropMesh, _arg_2:String)
      {
         super();
         this.qynuraq = _arg_1;
         this.textureName = _arg_2;
      }
      
      public function jakef(_arg_1:BSP) : void
      {
         this.desahi.push(_arg_1);
      }
      
      public function nobozin(_arg_1:TextureMaterial) : void
      {
         var _local_2:BSP = null;
         for each(_local_2 in this.desahi)
         {
            _local_2.setMaterialToAllFaces(_arg_1);
         }
      }
      
      public function renezyleh() : TextureByteData
      {
         return this.qynuraq.textures.getValue(this.textureName);
      }
   }
}

