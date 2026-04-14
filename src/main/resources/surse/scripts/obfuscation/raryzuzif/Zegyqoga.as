package obfuscation.raryzuzif
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class Zegyqoga implements Kedetino
   {
      
      private var meshes:Vector.<Mesh> = new Vector.<Mesh>();
      
      private var qynuraq:PropMesh;
      
      private var textureName:String;
      
      private var kucabok:String;
      
      public function Zegyqoga(_arg_1:PropMesh, _arg_2:String)
      {
         super();
         this.qynuraq = _arg_1;
         this.textureName = _arg_2;
      }
      
      public function add(_arg_1:Mesh, _arg_2:String = null) : void
      {
         this.kucabok = _arg_2;
         this.meshes.push(_arg_1);
      }
      
      public function renezyleh() : TextureByteData
      {
         return this.qynuraq.textures.getValue(this.textureName);
      }
      
      public function nobozin(_arg_1:TextureMaterial) : void
      {
         var _local_2:Mesh = null;
         var _local_3:Face = null;
         for each(_local_2 in this.meshes)
         {
            for each(_local_3 in _local_2.faces)
            {
               if(Boolean(this.kucabok) && _local_3.material.name != this.kucabok)
               {
                  _local_3.material = _arg_1;
               }
            }
            _local_2.removeVertex(_local_2.addVertex(0,0,0));
         }
      }
   }
}

