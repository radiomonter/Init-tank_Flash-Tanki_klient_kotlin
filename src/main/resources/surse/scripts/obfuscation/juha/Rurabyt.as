package obfuscation.juha
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.utils.MathUtils;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class Rurabyt extends Mesh
   {
      
      private static const MAX_PROGRESS:Number = 100;
      
      private var progress:Number = 0;
      
      private var mywujy:Material;
      
      private var jel:Material;
      
      private var gipo:Material;
      
      private var desu:Material;
      
      private var pil:Material;
      
      private var cynylisas:Vector.<Face>;
      
      private var uvs:Vector.<Point> = new Vector.<Point>();
      
      private var peziruqus:Vector.<Vector3D> = new Vector.<Vector3D>();
      
      public function Rurabyt(_arg_1:Number, _arg_2:Number, _arg_3:Material, _arg_4:Material, _arg_5:Material, _arg_6:Material, _arg_7:Material)
      {
         super();
         this.mywujy = _arg_3;
         this.jel = _arg_4;
         this.gipo = _arg_5;
         this.desu = _arg_6;
         this.pil = _arg_7;
         useShadowMap = false;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         this.createGeometry(_arg_1,_arg_2);
      }
      
      private function createGeometry(_arg_1:Number, _arg_2:Number) : void
      {
         var _local_3:Vertex = null;
         var _local_4:Vertex = null;
         var _local_5:Vertex = null;
         var _local_6:Number = _arg_1 * 0.5;
         var _local_7:Number = _arg_2 * 0.5;
         this.peziruqus[0] = new Vector3D(0,_local_7,0);
         this.peziruqus[1] = new Vector3D(-_local_6,0,0);
         this.peziruqus[2] = new Vector3D(0,-_local_7,0);
         this.peziruqus[3] = new Vector3D(_local_6,0,0);
         this.uvs[0] = new Point(0.5,-0.5);
         this.uvs[1] = new Point(-0.5,0.5);
         this.uvs[2] = new Point(0.5,1.5);
         this.uvs[3] = new Point(1.5,0.5);
         this.cynylisas = new Vector.<Face>();
         _local_3 = this.createVertex(-_local_6,0,0,-0.5,0.5);
         _local_4 = this.createVertex(0,0,0,0.5,0.5);
         _local_5 = this.createVertex(0,_local_7,0,0.5,-0.5);
         this.cynylisas[0] = this.createFace(_local_3,_local_4,_local_5,this.mywujy);
         _local_3 = this.createVertex(0,-_local_7,0,0.5,1.5);
         _local_4 = this.createVertex(0,0,0,0.5,0.5);
         _local_5 = this.createVertex(-_local_6,0,0,-0.5,0.5);
         this.cynylisas[1] = this.createFace(_local_3,_local_4,_local_5,this.mywujy);
         _local_3 = this.createVertex(_local_6,0,0,1.5,0.5);
         _local_4 = this.createVertex(0,0,0,0.5,0.5);
         _local_5 = this.createVertex(0,-_local_7,0,0.5,1.5);
         this.cynylisas[2] = this.createFace(_local_3,_local_4,_local_5,this.mywujy);
         _local_3 = this.createVertex(0,_local_7,0,0.5,-0.5);
         _local_4 = this.createVertex(0,0,0,0.5,0.5);
         _local_5 = this.createVertex(_local_6,0,0,1.5,0.5);
         this.cynylisas[3] = this.createFace(_local_3,_local_4,_local_5,this.mywujy);
         _local_3 = this.createVertex(0,0,0,0,0);
         _local_4 = this.createVertex(0,0,0,0.5,0.5);
         _local_5 = this.createVertex(0,0,0,0,0);
         this.cynylisas[4] = this.createFace(_local_3,_local_4,_local_5,this.mywujy);
      }
      
      private function createVertex(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Vertex
      {
         var _local_6:Vertex = new Vertex();
         _local_6.x = _arg_1;
         _local_6.y = _arg_2;
         _local_6.z = _arg_3;
         _local_6.u = _arg_4;
         _local_6.v = _arg_5;
         _local_6.next = vertexList;
         vertexList = _local_6;
         return _local_6;
      }
      
      private function createFace(_arg_1:Vertex, _arg_2:Vertex, _arg_3:Vertex, _arg_4:Material) : Face
      {
         var _local_5:Face = null;
         _local_5 = new Face();
         _local_5.material = _arg_4;
         _local_5.wrapper = new Wrapper();
         _local_5.wrapper.vertex = _arg_1;
         _local_5.wrapper.next = new Wrapper();
         _local_5.wrapper.next.vertex = _arg_2;
         _local_5.wrapper.next.next = new Wrapper();
         _local_5.wrapper.next.next.vertex = _arg_3;
         _local_5.normalX = 0;
         _local_5.normalY = 0;
         _local_5.normalZ = 1;
         _local_5.offset = 0;
         _local_5.next = faceList;
         faceList = _local_5;
         return _local_5;
      }
      
      public function vaciji(_arg_1:Camera3D) : void
      {
         rotationX = _arg_1.rotationX - Math.PI;
         rotationY = 0;
         rotationZ = _arg_1.rotationZ;
      }
      
      public function setProgress(_arg_1:Number) : void
      {
         var _local_2:Number = MathUtils.clamp(_arg_1,-MAX_PROGRESS,MAX_PROGRESS);
         if(this.progress != _local_2)
         {
            this.progress = _local_2;
            this.update();
         }
      }
      
      private function update() : void
      {
         var _local_1:Face = null;
         var _local_2:Vertex = null;
         var _local_3:Vertex = null;
         var _local_4:Vector3D = null;
         var _local_5:Vector3D = null;
         var _local_6:Point = null;
         var _local_7:Point = null;
         var _local_8:Face = null;
         var _local_9:int = 0;
         var _local_19:int = 0;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Number = NaN;
         var _local_13:Number = this.progress / MAX_PROGRESS;
         var _local_14:Number = Math.abs(_local_13);
         var _local_15:int = 4 * _local_14;
         var _local_16:int = (_local_15 + 1) % 4;
         var _local_17:Material = _local_13 < 0 ? this.desu : this.jel;
         var _local_18:Material = _local_13 < 0 ? this.pil : this.gipo;
         while(_local_19 < 4)
         {
            _local_1 = this.cynylisas[_local_19];
            if(_local_19 < _local_15)
            {
               _local_1.material = _local_14 == 1 ? _local_18 : _local_17;
            }
            else if(_local_19 > _local_15)
            {
               _local_1.material = this.mywujy;
            }
            _local_2 = _local_1.wrapper.vertex;
            _local_9 = (_local_19 + 1) % 4;
            _local_5 = this.peziruqus[_local_9];
            _local_7 = this.uvs[_local_9];
            _local_2.x = _local_5.x;
            _local_2.y = _local_5.y;
            _local_2.u = _local_7.x;
            _local_2.v = _local_7.y;
            _local_19++;
         }
         _local_8 = this.cynylisas[4];
         if(_local_14 == 1)
         {
            _local_3 = _local_8.wrapper.next.next.vertex;
            _local_3.x = 0;
            _local_3.y = 0;
            _local_3.u = 0;
            _local_3.v = 0;
            _local_3 = _local_8.wrapper.vertex;
            _local_3.x = 0;
            _local_3.y = 0;
            _local_3.u = 0;
            _local_3.v = 0;
         }
         else
         {
            _local_1 = this.cynylisas[_local_15];
            _local_1.material = _local_17;
            _local_4 = this.peziruqus[0];
            _local_6 = this.uvs[0];
            _local_5 = this.peziruqus[_local_16];
            _local_7 = this.uvs[_local_16];
            _local_2 = _local_1.wrapper.vertex;
            _local_10 = 2 * _local_14 * Math.PI;
            _local_11 = Math.cos(_local_10);
            _local_12 = Math.sin(_local_10);
            _local_2.x = _local_4.x * _local_11 - _local_4.y * _local_12;
            _local_2.y = _local_4.x * _local_12 + _local_4.y * _local_11;
            _local_12 = -_local_12;
            _local_2.u = 0.5 + (_local_6.x - 0.5) * _local_11 - (_local_6.y - 0.5) * _local_12;
            _local_2.v = 0.5 + (_local_6.x - 0.5) * _local_12 + (_local_6.y - 0.5) * _local_11;
            _local_3 = _local_8.wrapper.vertex;
            _local_3.x = _local_5.x;
            _local_3.y = _local_5.y;
            _local_3.u = _local_7.x;
            _local_3.v = _local_7.y;
            _local_3 = _local_8.wrapper.next.next.vertex;
            _local_3.x = _local_2.x;
            _local_3.y = _local_2.y;
            _local_3.u = _local_2.u;
            _local_3.v = _local_2.v;
         }
      }
   }
}

