package obfuscation.sujovigup
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   public class Myhosyz extends Mesh
   {
      
      public function Myhosyz(_arg_1:Number)
      {
         super();
         var _local_2:Number = _arg_1 / 2;
         var _local_3:Number = 0;
         var _local_4:Vertex = addVertex(-_local_2,0,_arg_1 + _local_3,0,0);
         var _local_5:Vertex = addVertex(-_local_2,0,0 + _local_3,0,1);
         var _local_6:Vertex = addVertex(_local_2,0,0 + _local_3,1,1);
         var _local_7:Vertex = addVertex(_local_2,0,_arg_1 + _local_3,1,0);
         addQuadFace(_local_4,_local_5,_local_6,_local_7);
         sorting = Sorting.DYNAMIC_BSP;
         calculateBounds();
         calculateFacesNormals();
      }
      
      public function init(_arg_1:TextureMaterial) : void
      {
         setMaterialToAllFaces(_arg_1);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
      }
   }
}

