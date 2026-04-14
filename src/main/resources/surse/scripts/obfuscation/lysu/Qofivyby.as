package obfuscation.lysu
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   public class Qofivyby extends Mesh
   {
      
      public var mugylyvef:Number;
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var e:Vertex;
      
      private var f:Vertex;
      
      private var g:Vertex;
      
      private var h:Vertex;
      
      private var i:Vertex;
      
      private var j:Vertex;
      
      private var k:Vertex;
      
      private var l:Vertex;
      
      private var mypezi:Number;
      
      private var vOffset:Number = 0;
      
      public function Qofivyby(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.mypezi = _arg_3;
         this.mugylyvef = _arg_4;
         useShadowMap = false;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         var _local_5:Number = _arg_1 / 2;
         var _local_6:Vector.<Number> = Vector.<Number>([-_local_5,0,0,_local_5,0,0,_local_5,_arg_2,0,-_local_5,_arg_2,0,-_local_5,_arg_2,0,_local_5,_arg_2,0,_local_5,_arg_2 + 1,0,-_local_5,_arg_2 + 1,0,-_local_5,_arg_2 + 1,0,_local_5,_arg_2 + 1,0,_local_5,2 * _arg_2 + 1,0,-_local_5,2 * _arg_2 + 1,0]);
         var _local_7:Vector.<Number> = Vector.<Number>([0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,1,1,0,1]);
         var _local_8:Vector.<int> = Vector.<int>([4,0,1,2,3,4,4,5,6,7,4,8,9,10,11]);
         addVerticesAndFaces(_local_6,_local_7,_local_8,true);
         sorting = Sorting.DYNAMIC_BSP;
         this.boze();
         calculateFacesNormals();
         this.zowagok();
         boundMinX = -_local_5;
         boundMaxX = _local_5;
         boundMinY = 0;
         boundMaxY = length;
         boundMinZ = 0;
         boundMaxZ = 0;
      }
      
      public function gig(_arg_1:TextureMaterial, _arg_2:TextureMaterial) : void
      {
         var _local_3:Face = faceList;
         _local_3.material = _arg_1;
         _local_3.next.material = _arg_2;
         _local_3.next.next.material = _arg_1;
      }
      
      private function boze() : void
      {
         var _local_1:Vector.<Vertex> = this.vertices;
         this.a = _local_1[0];
         this.b = _local_1[1];
         this.c = _local_1[2];
         this.d = _local_1[3];
         this.e = _local_1[4];
         this.f = _local_1[5];
         this.g = _local_1[6];
         this.h = _local_1[7];
         this.i = _local_1[8];
         this.j = _local_1[9];
         this.k = _local_1[10];
         this.l = _local_1[11];
      }
      
      private function zowagok() : void
      {
         this.e.v = this.vOffset;
         this.f.v = this.vOffset;
         var _local_1:Number = (this.g.y - this.f.y) / this.mypezi + this.vOffset;
         this.g.v = _local_1;
         this.h.v = _local_1;
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
      }
      
      public function fubabetor(_arg_1:Number) : void
      {
         var _local_2:Number = this.c.y;
         this.c.y = _arg_1;
         this.d.y = _arg_1;
         this.e.y = _arg_1;
         this.f.y = _arg_1;
         this.setLength(this.k.y + _arg_1 - _local_2);
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         this.setWidth(_arg_1);
         this.setLength(_arg_2);
      }
      
      public function setWidth(_arg_1:Number) : void
      {
         var _local_2:Number = _arg_1 / 2;
         boundMinX = -_local_2;
         boundMaxX = _local_2;
         this.a.x = -_local_2;
         this.d.x = -_local_2;
         this.e.x = -_local_2;
         this.h.x = -_local_2;
         this.i.x = -_local_2;
         this.l.x = -_local_2;
         this.b.x = _local_2;
         this.c.x = _local_2;
         this.f.x = _local_2;
         this.g.x = _local_2;
         this.j.x = _local_2;
         this.k.x = _local_2;
      }
      
      public function setLength(_arg_1:Number) : void
      {
         if(_arg_1 < 1 + 2 * this.c.y)
         {
            visible = false;
         }
         else
         {
            visible = true;
            boundMaxY = _arg_1;
            this.g.y = _arg_1 - this.c.y;
            this.h.y = this.g.y;
            this.i.y = this.g.y;
            this.j.y = this.g.y;
            this.k.y = _arg_1;
            this.l.y = _arg_1;
            this.zowagok();
         }
      }
      
      public function wusojofu(_arg_1:Number) : void
      {
         this.a.u = 0.5 * (1 - _arg_1);
         this.d.u = this.a.u;
         this.e.u = this.a.u;
         this.h.u = this.a.u;
         this.i.u = this.a.u;
         this.l.u = this.a.u;
         this.b.u = 0.5 * (1 + _arg_1);
         this.c.u = this.b.u;
         this.f.u = this.b.u;
         this.g.u = this.b.u;
         this.j.u = this.b.u;
         this.k.u = this.b.u;
      }
      
      public function update(_arg_1:Number) : void
      {
         this.vOffset += this.mugylyvef * _arg_1;
         if(this.vOffset < 0)
         {
            this.vOffset += 1;
         }
         else if(this.vOffset > 1)
         {
            --this.vOffset;
         }
         this.zowagok();
      }
      
      public function nelokoreh(_arg_1:Number) : void
      {
         this.mypezi = _arg_1;
         this.zowagok();
      }
   }
}

