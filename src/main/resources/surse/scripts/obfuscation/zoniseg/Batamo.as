package obfuscation.zoniseg
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   internal class Batamo extends Mesh
   {
      
      private static const GAP:Number = 10;
      
      private static const cydiwok:Number = 5;
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var san:Face;
      
      private var e:Vertex;
      
      private var f:Vertex;
      
      private var g:Vertex;
      
      private var h:Vertex;
      
      private var muweko:Face;
      
      private var length:Number;
      
      private var middle:Number;
      
      private var kajy:Number;
      
      private var qejyvu:Number;
      
      private var material:Material;
      
      public function Batamo()
      {
         super();
         this.a = addVertex(-1,1,-GAP);
         this.b = addVertex(-1,0,-GAP);
         this.c = addVertex(1,0,-GAP);
         this.d = addVertex(1,1,-GAP);
         this.san = addQuadFace(this.a,this.b,this.c,this.d);
         this.e = addVertex(-1,1,-GAP);
         this.f = addVertex(-1,0,-GAP);
         this.g = addVertex(1,0,-GAP);
         this.h = addVertex(1,1,-GAP);
         this.muweko = addQuadFace(this.e,this.f,this.g,this.h);
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
         var _local_6:Number = NaN;
         this.length = _arg_2;
         this.material = _arg_3;
         this.qejyvu = _arg_4;
         var _local_5:TextureMaterial = _arg_3 as TextureMaterial;
         if(_local_5 != null && _local_5.texture != null)
         {
            this.kajy = _arg_1 * _local_5.texture.height * 2 / _local_5.texture.width;
            this.middle = _arg_2 - this.kajy;
         }
         else
         {
            this.kajy = _arg_1 / 2;
            this.middle = 0;
         }
         this.kajy *= 1.25;
         _local_6 = _arg_1 * 0.5;
         this.a.x = -_local_6;
         this.a.y = _arg_2;
         this.a.u = 0;
         this.b.x = -_local_6;
         this.b.u = 0;
         this.c.x = _local_6;
         this.c.u = 0.5;
         this.d.x = _local_6;
         this.d.y = _arg_2;
         this.d.u = 0.5;
         this.e.x = -_local_6;
         this.e.u = 0.5;
         this.e.v = 0;
         this.f.x = -_local_6;
         this.f.y = 0;
         this.f.u = 0.5;
         this.g.x = _local_6;
         this.g.y = 0;
         this.g.u = 1;
         this.h.x = _local_6;
         this.h.u = 1;
         this.h.v = 0;
         boundMinX = -_local_6;
         boundMinY = 0;
         boundMinZ = 0;
         boundMaxX = _local_6;
         boundMaxY = _arg_2;
         boundMaxZ = 0;
      }
      
      public function clear() : void
      {
         this.san.material = null;
         this.muweko.material = null;
         this.material = null;
      }
      
      public function update(_arg_1:Number) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = this.middle + this.qejyvu * _arg_1;
         if(_local_3 < cydiwok)
         {
            _local_2 = _local_3 < 0 ? Number(0) : Number(_local_3);
            this.b.y = _local_2;
            this.c.y = _local_2;
            this.a.v = 1 - (this.length - _local_3) / this.kajy;
            this.d.v = this.a.v;
            this.b.v = this.a.v + (this.length - _local_2) / this.kajy;
            this.c.v = this.b.v;
            this.e.y = cydiwok;
            this.h.y = cydiwok;
            this.san.material = this.material;
            this.muweko.material = null;
         }
         else if(_local_3 > this.length - cydiwok)
         {
            _local_2 = _local_3 > this.length ? Number(this.length) : Number(_local_3);
            this.e.y = _local_2;
            this.h.y = _local_2;
            this.e.v = -(_local_3 - _local_2) / this.kajy;
            this.h.v = this.e.v;
            this.f.v = this.e.v + _local_3 / this.kajy;
            this.g.v = this.f.v;
            this.b.y = this.length - cydiwok;
            this.b.y = this.length - cydiwok;
            this.san.material = null;
            this.muweko.material = this.material;
         }
         else
         {
            this.a.v = 1 - (this.length - _local_3) / this.kajy;
            this.d.v = this.a.v;
            this.b.y = _local_3;
            this.c.y = _local_3;
            this.e.y = _local_3;
            this.h.y = _local_3;
            this.b.v = 1;
            this.c.v = 1;
            this.e.v = 0;
            this.f.v = _local_3 / this.kajy;
            this.g.v = _local_3 / this.kajy;
            this.h.v = 0;
            this.san.material = this.material;
            this.muweko.material = this.material;
         }
      }
   }
}

