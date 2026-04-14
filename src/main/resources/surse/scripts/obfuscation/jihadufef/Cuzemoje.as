package obfuscation.jihadufef
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BlendMode;
   
   use namespace alternativa3d;
   
   internal class Cuzemoje extends Mesh
   {
      
      public function Cuzemoje(_arg_1:Number, _arg_2:Material)
      {
         super();
         var _local_3:Number = 4;
         var _local_4:Number = 240 * _arg_1;
         var _local_5:Vertex = this.createVertex(-_local_3,0,0,0,0);
         var _local_6:Vertex = this.createVertex(_local_3,0,0,0,1);
         var _local_7:Vertex = this.createVertex(0,_local_4,0,1,0.5);
         this.createFace(_local_5,_local_6,_local_7).material = _arg_2;
         this.createFace(_local_7,_local_6,_local_5).material = _arg_2;
         calculateFacesNormals(true);
         calculateBounds();
         blendMode = BlendMode.SCREEN;
         alpha = 0.3;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      private function createVertex(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Vertex
      {
         var _local_6:Vertex = new Vertex();
         _local_6.next = vertexList;
         vertexList = _local_6;
         _local_6.x = _arg_1;
         _local_6.y = _arg_2;
         _local_6.z = _arg_3;
         _local_6.u = _arg_4;
         _local_6.v = _arg_5;
         return _local_6;
      }
      
      private function createFace(_arg_1:Vertex, _arg_2:Vertex, _arg_3:Vertex) : Face
      {
         var _local_4:Face = new Face();
         _local_4.next = faceList;
         faceList = _local_4;
         _local_4.wrapper = new Wrapper();
         _local_4.wrapper.vertex = _arg_1;
         _local_4.wrapper.next = new Wrapper();
         _local_4.wrapper.next.vertex = _arg_2;
         _local_4.wrapper.next.next = new Wrapper();
         _local_4.wrapper.next.next.vertex = _arg_3;
         return _local_4;
      }
   }
}

