package alternativa.tanks.bonuses
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   use namespace alternativa3d;
   
   public class Cords extends BonusObject3DBase
   {
      
      private static const meshMatrix:Matrix4 = new Matrix4();
      
      private var topVertices:Vector.<Vertex>;
      
      private var topLocalPoints:Vector.<Vector3>;
      
      private var boxVertex:Vertex;
      
      private var boxLocalPoint:Vector3;
      
      private var numStraps:int;
      
      private var bonusMesh:BonusMesh;
      
      private var parachute:Parachute;
      
      private var mesh:Mesh;
      
      public function Cords(_arg_1:Number, _arg_2:Number, _arg_3:int, _arg_4:Material)
      {
         super();
         this.numStraps = _arg_3;
         this.mesh = new Mesh();
         object = this.mesh;
         this.topVertices = new Vector.<Vertex>(2 * _arg_3);
         this.topLocalPoints = new Vector.<Vector3>(_arg_3);
         this.createGeometry(_arg_1,_arg_2);
         this.mesh.setMaterialToAllFaces(_arg_4);
         this.mesh.shadowMapAlphaThreshold = 2;
         this.mesh.depthMapAlphaThreshold = 2;
      }
      
      public function init(_arg_1:BonusMesh, _arg_2:Parachute) : void
      {
         this.bonusMesh = _arg_1;
         this.parachute = _arg_2;
         this.mesh.scaleX = 1;
         this.mesh.scaleY = 1;
         this.mesh.scaleZ = 1;
         setAlpha(1);
         setAlphaMultiplier(1);
      }
      
      public function recycle() : void
      {
         removeFromScene();
         this.bonusMesh = null;
         this.parachute = null;
         BonusCache.putCords(this);
      }
      
      public function updateVertices() : void
      {
         var _local_1:Vector3 = null;
         var _local_5:Vertex = null;
         var _local_6:int = 0;
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         this.parachute.readTransform(meshMatrix);
         while(_local_6 < this.numStraps)
         {
            _local_1 = this.topLocalPoints[_local_6];
            _local_2 = _local_1.x * meshMatrix.m00 + _local_1.y * meshMatrix.m01 + _local_1.z * meshMatrix.m02 + meshMatrix.m03;
            _local_3 = _local_1.x * meshMatrix.m10 + _local_1.y * meshMatrix.m11 + _local_1.z * meshMatrix.m12 + meshMatrix.m13;
            _local_4 = _local_1.x * meshMatrix.m20 + _local_1.y * meshMatrix.m21 + _local_1.z * meshMatrix.m22 + meshMatrix.m23;
            _local_5 = this.topVertices[2 * _local_6];
            _local_5.x = _local_2;
            _local_5.y = _local_3;
            _local_5.z = _local_4;
            _local_5 = this.topVertices[2 * _local_6 + 1];
            _local_5.x = _local_2;
            _local_5.y = _local_3;
            _local_5.z = _local_4;
            _local_6++;
         }
         this.bonusMesh.readTransform(meshMatrix);
         _local_1 = this.boxLocalPoint;
         this.boxVertex.x = _local_1.x * meshMatrix.m00 + _local_1.y * meshMatrix.m01 + _local_1.z * meshMatrix.m02 + meshMatrix.m03;
         this.boxVertex.y = _local_1.x * meshMatrix.m10 + _local_1.y * meshMatrix.m11 + _local_1.z * meshMatrix.m12 + meshMatrix.m13;
         this.boxVertex.z = _local_1.x * meshMatrix.m20 + _local_1.y * meshMatrix.m21 + _local_1.z * meshMatrix.m22 + meshMatrix.m23;
         this.mesh.calculateBounds();
         this.mesh.calculateFacesNormals();
      }
      
      private function createGeometry(_arg_1:Number, _arg_2:Number) : void
      {
         var _local_4:Vector3 = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_8:int = 0;
         var _local_9:int = 0;
         var _local_3:Number = NaN;
         this.boxLocalPoint = new Vector3(0,0,_arg_2);
         this.boxVertex = this.createVertex(0,0,_arg_2,0,1);
         var _local_7:Number = 2 * Math.PI / this.numStraps;
         while(_local_8 < this.numStraps)
         {
            _local_3 = _local_8 * _local_7;
            _local_4 = new Vector3(_arg_1 * Math.cos(_local_3),_arg_1 * Math.sin(_local_3),0);
            this.topLocalPoints[_local_8] = _local_4;
            this.topVertices[2 * _local_8] = this.createVertex(_local_4.x,_local_4.y,_local_4.z,0,0);
            this.topVertices[2 * _local_8 + 1] = this.createVertex(_local_4.x,_local_4.y,_local_4.z,1,1);
            _local_8++;
         }
         while(_local_9 < this.numStraps)
         {
            _local_5 = 2 * _local_9;
            _local_6 = _local_5 + 3;
            if(_local_6 >= 2 * this.numStraps)
            {
               _local_6 -= 2 * this.numStraps;
            }
            this.createTriFace(this.boxVertex,this.topVertices[_local_5],this.topVertices[_local_6]);
            this.createTriFace(this.boxVertex,this.topVertices[_local_6],this.topVertices[_local_5]);
            _local_9++;
         }
      }
      
      private function createVertex(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Vertex
      {
         var _local_6:Vertex = new Vertex();
         _local_6.next = this.mesh.vertexList;
         this.mesh.vertexList = _local_6;
         _local_6.x = _arg_1;
         _local_6.y = _arg_2;
         _local_6.z = _arg_3;
         _local_6.u = _arg_4;
         _local_6.v = _arg_5;
         return _local_6;
      }
      
      private function createTriFace(_arg_1:Vertex, _arg_2:Vertex, _arg_3:Vertex) : Face
      {
         var _local_4:Face = new Face();
         _local_4.next = this.mesh.faceList;
         this.mesh.faceList = _local_4;
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

