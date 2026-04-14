package obfuscation.beteg
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   internal class Haqutuf extends Mesh
   {
      
      private var peziruqus:Vector.<Vertex>;
      
      private var rivy:int = 0;
      
      private var direction:int = 1;
      
      private var width:Number;
      
      private var kajy:Number = 1;
      
      private var offset:Number = 0;
      
      private var jehap:Number = 0;
      
      private var gilyser:Number = 0;
      
      public function Haqutuf()
      {
         var _local_1:Vertex = null;
         var _local_2:Vertex = null;
         var _local_5:int = 0;
         this.peziruqus = new Vector.<Vertex>();
         super();
         var _local_3:Vertex = addVertex(-1,0,0);
         var _local_4:Vertex = addVertex(1,0,0);
         this.peziruqus[this.rivy] = _local_3;
         ++this.rivy;
         this.peziruqus[this.rivy] = _local_4;
         ++this.rivy;
         while(_local_5 < Tolife.pomy)
         {
            _local_1 = addVertex(-1,-_local_5 - 1,0);
            _local_2 = addVertex(1,-_local_5 - 1,0);
            this.peziruqus[this.rivy] = _local_1;
            ++this.rivy;
            this.peziruqus[this.rivy] = _local_2;
            ++this.rivy;
            addQuadFace(_local_3,_local_1,_local_2,_local_4);
            _local_3 = _local_1;
            _local_4 = _local_2;
            _local_5++;
         }
         calculateFacesNormals();
         sorting = Sorting.DYNAMIC_BSP;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(_arg_1:Number, _arg_2:Number) : void
      {
         var _local_5:Number = NaN;
         var _local_3:Vertex = null;
         var _local_4:Vertex = null;
         var _local_6:int = 0;
         this.width = _arg_1;
         _local_5 = _arg_1 * 0.5;
         while(_local_6 < this.rivy)
         {
            _local_3 = this.peziruqus[_local_6];
            _local_4 = this.peziruqus[++_local_6];
            _local_3.x = -_local_5;
            _local_3.u = 0;
            _local_4.x = _local_5;
            _local_4.u = 1;
            _local_6++;
         }
         boundMinX = -_local_5;
         boundMaxX = _local_5;
         boundMinY = 0;
         boundMinZ = 0;
         boundMaxZ = 0;
      }
      
      public function nobozin(_arg_1:Material, _arg_2:int) : void
      {
         this.direction = _arg_2;
         setMaterialToAllFaces(_arg_1);
         var _local_3:TextureMaterial = _arg_1 as TextureMaterial;
         if(_local_3 != null && _local_3.texture != null)
         {
            this.kajy = this.width * _local_3.texture.height / _local_3.texture.width;
         }
         else
         {
            this.kajy = this.width;
         }
         this.offset = 0;
         this.jehap = 0;
         this.gilyser = 0;
      }
      
      public function update(_arg_1:int, _arg_2:Number) : void
      {
         var _local_3:Vertex = null;
         var _local_4:Vertex = null;
         var _local_15:int = 0;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = Tolife.nef / this.width;
         var _local_9:Number = this.direction * Tolife.wopiqa;
         var _local_10:Number = this.direction * Tolife.kafetit;
         var _local_11:Number = this.direction * Tolife.suqopunun / this.kajy;
         this.jehap += _local_9 * _arg_1 / 1000;
         this.gilyser += _local_10 * _arg_1 / 1000;
         this.offset += _local_11 * _arg_1 / 1000;
         var _local_12:Number = _arg_2 / Tolife.pomy;
         var _local_13:Number = _arg_2 / 2;
         var _local_14:Number = 1;
         while(_local_15 < this.rivy)
         {
            _local_3 = this.peziruqus[_local_15];
            _local_4 = this.peziruqus[++_local_15];
            _local_3.y = _arg_2 - (_local_15 >> 1) * _local_12;
            _local_4.y = _local_3.y;
            _local_5 = _local_13 - _local_3.y;
            _local_3.v = _local_5 / this.kajy + this.offset;
            _local_4.v = _local_3.v;
            if(_local_3.y < _local_13)
            {
               _local_14 = _local_3.y / Tolife.tacidywa;
            }
            else
            {
               _local_14 = (_arg_2 - _local_3.y) / Tolife.tacidywa;
            }
            if(_local_14 > 1)
            {
               _local_14 = 1;
            }
            _local_6 = Math.sin(Math.PI * 2 * (_local_5 + this.jehap) / Tolife.wozev);
            _local_7 = Math.sin(Math.PI * 2 * (_local_5 + this.gilyser) / Tolife.hopakivil);
            _local_3.u = (_local_6 + _local_7) * 0.5 * _local_8 * _local_14;
            _local_4.u = 1 + _local_3.u;
            _local_15++;
         }
         boundMaxY = _arg_2;
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
      }
   }
}

