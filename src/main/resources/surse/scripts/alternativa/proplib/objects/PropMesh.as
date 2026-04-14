package alternativa.proplib.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.loaders.Parser3DS;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.proplib.utils.ByteArrayMap;
   import alternativa.proplib.utils.TextureByteDataMap;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.utils.ByteArray;
   
   public class PropMesh extends PropObject
   {
      
      public static const DEFAULT_TEXTURE:String = "$$$_DEFAULT_TEXTURE_$$$";
      
      public static var threshold:Number = 0.01;
      
      public static var occluderDistanceThreshold:Number = 0.01;
      
      public static var occluderAngleThreshold:Number = 0.01;
      
      public static var occluderConvexThreshold:Number = 0.01;
      
      public static var occluderUvThreshold:int = 1;
      
      public static var meshDistanceThreshold:Number = 0.001;
      
      public static var meshUvThreshold:Number = 0.001;
      
      public static var meshAngleThreshold:Number = 0.001;
      
      public static var meshConvexThreshold:Number = 0.01;
      
      public var textures:TextureByteDataMap;
      
      public var occluders:Vector.<Occluder>;
      
      public function PropMesh(_arg_1:ByteArray, _arg_2:String, _arg_3:Object, _arg_4:ByteArrayMap, _arg_5:TextureByteDataMap)
      {
         super(PropObjectType.MESH);
         this.parseModel(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      private function parseModel(_arg_1:ByteArray, _arg_2:String, _arg_3:Object, _arg_4:ByteArrayMap, _arg_5:TextureByteDataMap) : void
      {
         var _local_7:String = null;
         var _local_8:TextureByteData = null;
         var _local_6:* = null;
         var _local_9:Mesh = this.processObjects(_arg_1,_arg_2);
         this.initMesh(_local_9);
         this.object = _local_9;
         var _local_10:String = this.getTextureFileName(_local_9);
         if(_local_10 == null && _arg_3 == null)
         {
            throw new Error("PropMesh: no textures found");
         }
         if(_arg_3 == null)
         {
            _arg_3 = {};
         }
         if(_local_10 != null)
         {
            _arg_3[PropMesh.DEFAULT_TEXTURE] = _local_10;
         }
         this.textures = new TextureByteDataMap();
         for(_local_6 in _arg_3)
         {
            _local_7 = _arg_3[_local_6];
            if(_arg_5 == null)
            {
               _local_8 = new TextureByteData(_arg_4.getValue(_local_7),null);
            }
            else
            {
               _local_8 = _arg_5.getValue(_local_7);
            }
            this.textures.putValue(_local_6,_local_8);
         }
      }
      
      private function processObjects(_arg_1:ByteArray, _arg_2:String) : Mesh
      {
         var _local_3:Object3D = null;
         var _local_4:String = null;
         var _local_8:Mesh = null;
         var _local_9:int = 0;
         _arg_1.position = 0;
         var _local_5:Parser3DS = new Parser3DS();
         _local_5.parse(_arg_1);
         var _local_6:Vector.<Object3D> = _local_5.objects;
         var _local_7:int = int(_local_6.length);
         while(_local_9 < _local_7)
         {
            _local_3 = _local_6[_local_9];
            _local_4 = _local_3.name.toLowerCase();
            if(_local_4.indexOf("occl") == 0)
            {
               this.addOccluder(Mesh(_local_3));
            }
            else if(_arg_2 == _local_4)
            {
               _local_8 = Mesh(_local_3);
            }
            _local_9++;
         }
         return _local_8 != null ? _local_8 : Mesh(_local_6[0]);
      }
      
      private function getTextureFileName(_arg_1:Mesh) : String
      {
         var _local_2:TextureMaterial = null;
         var _local_3:Face = _arg_1.alternativa3d::faceList;
         while(_local_3 != null)
         {
            _local_2 = _local_3.material as TextureMaterial;
            if(_local_2 != null)
            {
               return _local_2.diffuseMapURL.toLowerCase();
            }
            _local_3 = _local_3.alternativa3d::next;
         }
         return null;
      }
      
      private function addOccluder(_arg_1:Mesh) : void
      {
         _arg_1.weldVertices(occluderDistanceThreshold,occluderUvThreshold);
         _arg_1.weldFaces(occluderAngleThreshold,occluderUvThreshold,occluderConvexThreshold);
         var _local_2:Occluder = new Occluder();
         _local_2.createForm(_arg_1,true);
         _local_2.x = _arg_1.x;
         _local_2.y = _arg_1.y;
         _local_2.z = _arg_1.z;
         _local_2.rotationX = _arg_1.rotationX;
         _local_2.rotationY = _arg_1.rotationY;
         _local_2.rotationZ = _arg_1.rotationZ;
         if(this.occluders == null)
         {
            this.occluders = new Vector.<Occluder>();
         }
         this.occluders.push(_local_2);
      }
      
      private function initMesh(_arg_1:Mesh) : void
      {
         _arg_1.weldVertices(meshDistanceThreshold,meshUvThreshold);
         _arg_1.weldFaces(meshAngleThreshold,meshUvThreshold,meshConvexThreshold);
         _arg_1.threshold = threshold;
      }
      
      override public function traceProp() : void
      {
         var _local_2:TextureByteData = null;
         var _local_1:* = null;
         super.traceProp();
         for(_local_1 in this.textures)
         {
            _local_2 = this.textures[_local_1];
         }
      }
   }
}

