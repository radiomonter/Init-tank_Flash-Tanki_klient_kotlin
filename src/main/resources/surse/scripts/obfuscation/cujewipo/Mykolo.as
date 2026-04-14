package obfuscation.cujewipo
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   internal class Mykolo extends Mesh
   {
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var face:Face;
      
      public function Mykolo()
      {
         super();
         this.a = this.createVertex(-1,-1,0,0,1);
         this.b = this.createVertex(1,-1,0,1,1);
         this.c = this.createVertex(1,0,0,1,0);
         this.d = this.createVertex(-1,0,0,0,0);
         this.face = this.createQuad(this.a,this.b,this.c,this.d);
         calculateFacesNormals();
         sorting = Sorting.DYNAMIC_BSP;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Material) : void
      {
         alpha = 1;
         var _local_5:Number = _arg_1 / 2;
         boundMinX = this.a.x = this.d.x = -_local_5;
         boundMaxX = this.b.x = this.c.x = _local_5;
         boundMinY = this.a.y = this.b.y = -_arg_2;
         boundMaxY = 0;
         boundMinZ = boundMaxZ = 0;
         this.a.v = this.b.v = _arg_3;
         this.face.material = _arg_4;
      }
      
      public function set width(_arg_1:Number) : void
      {
         var _local_2:Number = _arg_1 / 2;
         boundMinX = this.a.x = this.d.x = -_local_2;
         boundMaxX = this.b.x = this.c.x = _local_2;
      }
      
      public function get length() : Number
      {
         return -this.a.y;
      }
      
      public function set length(_arg_1:Number) : void
      {
         if(_arg_1 < 10)
         {
            _arg_1 = 10;
         }
         boundMinY = this.a.y = this.b.y = -_arg_1;
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
      
      private function createQuad(_arg_1:Vertex, _arg_2:Vertex, _arg_3:Vertex, _arg_4:Vertex) : Face
      {
         var _local_5:Face = new Face();
         _local_5.next = faceList;
         faceList = _local_5;
         _local_5.wrapper = new Wrapper();
         _local_5.wrapper.vertex = _arg_1;
         _local_5.wrapper.next = new Wrapper();
         _local_5.wrapper.next.vertex = _arg_2;
         _local_5.wrapper.next.next = new Wrapper();
         _local_5.wrapper.next.next.vertex = _arg_3;
         _local_5.wrapper.next.next.next = new Wrapper();
         _local_5.wrapper.next.next.next.vertex = _arg_4;
         return _local_5;
      }
   }
}

