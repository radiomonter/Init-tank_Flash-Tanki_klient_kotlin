package obfuscation.zoniseg
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   internal class Mibip extends Mesh
   {
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var face:Face;
      
      private var revyjus:Number;
      
      private var tahud:Number;
      
      public function Mibip()
      {
         super();
         this.a = addVertex(-1,1,0);
         this.b = addVertex(-1,0,0);
         this.c = addVertex(1,0,0);
         this.d = addVertex(1,1,0);
         this.face = addQuadFace(this.a,this.b,this.c,this.d);
         calculateFacesNormals();
         sorting = Sorting.DYNAMIC_BSP;
         softAttenuation = 80;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:Material, _arg_4:Number) : void
      {
         var _local_5:Number = _arg_1 * 0.5;
         this.a.x = -_local_5;
         this.a.y = _arg_2;
         this.a.u = 0;
         this.b.x = -_local_5;
         this.b.y = 0;
         this.b.u = 0;
         this.c.x = _local_5;
         this.c.y = 0;
         this.c.u = 1;
         this.d.x = _local_5;
         this.d.y = _arg_2;
         this.d.u = 1;
         boundMinX = -_local_5;
         boundMinY = 0;
         boundMinZ = 0;
         boundMaxX = _local_5;
         boundMaxY = _arg_2;
         boundMaxZ = 0;
         this.face.material = _arg_3;
         var _local_6:TextureMaterial = _arg_3 as TextureMaterial;
         if(_local_6 != null && _local_6.texture != null)
         {
            this.revyjus = _arg_2 / (_arg_1 * _local_6.texture.height / _local_6.texture.width);
            this.tahud = _arg_4 / _arg_1;
         }
         else
         {
            this.revyjus = 1;
            this.tahud = 0;
         }
      }
      
      public function clear() : void
      {
         this.face.material = null;
      }
      
      public function update(_arg_1:Number) : void
      {
         var _local_2:Number = this.tahud * _arg_1;
         this.a.v = _local_2;
         this.b.v = this.revyjus + _local_2;
         this.c.v = this.revyjus + _local_2;
         this.d.v = _local_2;
      }
   }
}

