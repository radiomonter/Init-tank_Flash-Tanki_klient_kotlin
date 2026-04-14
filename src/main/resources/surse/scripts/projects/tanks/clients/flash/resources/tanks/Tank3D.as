package projects.tanks.clients.flash.resources.tanks
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.battle.objects.tank.tankskin.TrackSurfaceSkin;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Tank3D extends Object3DContainer
   {
      
      private static var defaultColormap:BitmapData;
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*)/i;
      
      public static const TANK_PART:String = "tankPart";
      
      private static const HULL_PART:int = 0;
      
      private static const TURRET_PART:int = 1;
      
      private var hullResource:Tanks3DSResource;
      
      private var turretResource:Tanks3DSResource;
      
      private var hull:Mesh;
      
      private var turret:MeshContainer;
      
      private var colormap:BitmapData;
      
      private var multiframeImageResource:MultiframeImageResource;
      
      private var leftTrackSkin:TrackSurfaceSkin;
      
      private var rightTrackSkin:TrackSurfaceSkin;
      
      private var materials:Vector.<TextureMaterial> = new Vector.<TextureMaterial>(2);
      
      public var shadow:Shadow;
      
      public function Tank3D()
      {
         super();
      }
      
      private static function getDefaultColorMap() : BitmapData
      {
         if(defaultColormap == null)
         {
            defaultColormap = new BitmapData(1,1,false,6710886);
         }
         return defaultColormap;
      }
      
      public static function cloneMesh(_arg_1:Mesh) : Mesh
      {
         var _local_2:Mesh = null;
         _local_2 = Mesh(_arg_1.clone());
         _local_2.name = TANK_PART;
         _local_2.colorTransform = new ColorTransform();
         _local_2.shadowMapAlphaThreshold = 0.1;
         _local_2.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _local_2;
      }
      
      public function setColorMap(_arg_1:BitmapData) : void
      {
         this.multiframeImageResource = null;
         this.destroyMaterials();
         this.colormap = _arg_1 != null ? _arg_1 : getDefaultColorMap();
         this.updateTurretTexture(this.turretResource,this.turret);
         this.updatePartTexture(this.hullResource,this.hull,HULL_PART);
      }
      
      public function setTextureAnimation(_arg_1:MultiframeImageResource) : void
      {
         this.colormap = null;
         this.destroyMaterials();
         this.multiframeImageResource = _arg_1;
         this.updateTurretTexture(this.turretResource,this.turret);
         this.updatePartTexture(this.hullResource,this.hull,HULL_PART);
      }
      
      public function setHull(_arg_1:Tanks3DSResource) : void
      {
         if(this.hull != null)
         {
            this.hull.setMaterialToAllFaces(null);
            removeChild(this.hull);
         }
         if(_arg_1 == null)
         {
            return;
         }
         this.hullResource = _arg_1;
         this.hull = this.initMesh(cloneMesh(_arg_1.objects[0] as Mesh));
         addChild(this.hull);
         if(this.turret != null)
         {
            addChild(this.turret);
         }
         this.hull.x = 0;
         this.hull.y = 0;
         this.hull.z = 0;
         this.updatePartTexture(_arg_1,this.hull,HULL_PART);
         this.updateMountPoint();
      }
      
      public function setTurret(_arg_1:Tanks3DSResource) : void
      {
         var _local_2:Mesh = null;
         if(this.turret != null)
         {
            for each(_local_2 in this.turret.getMeshes())
            {
               _local_2.setMaterialToAllFaces(null);
            }
            removeChild(this.turret);
         }
         if(_arg_1 == null)
         {
            return;
         }
         this.turretResource = _arg_1;
         this.turret = new MeshContainer();
         this.turret.setMeshes(this.getMeshes(_arg_1));
         addChild(this.turret);
         this.updateTurretTexture(_arg_1,this.turret);
         this.updateMountPoint();
      }
      
      private function getMeshes(_arg_1:Tanks3DSResource) : Vector.<Mesh>
      {
         var _local_2:Object3D = null;
         var _local_3:Vector.<Mesh> = new Vector.<Mesh>();
         for each(_local_2 in _arg_1.objects)
         {
            if(_local_2 is Mesh && !EXCLUDED.test(_local_2.name))
            {
               _local_3.push(this.initMesh(cloneMesh(_local_2 as Mesh)));
            }
         }
         return _local_3;
      }
      
      private function updateTurretTexture(_arg_1:Tanks3DSResource, _arg_2:MeshContainer) : void
      {
         if(_arg_2 == null)
         {
            return;
         }
         var _local_3:Vector.<Mesh> = _arg_2.getMeshes();
         var _local_4:TextureMaterial = this.updatePartTexture(_arg_1,_local_3[0],TURRET_PART);
         var _local_5:int = 1;
         while(_local_5 < _local_3.length)
         {
            _local_3[_local_5].setMaterialToAllFaces(_local_4);
            _local_5++;
         }
      }
      
      private function updatePartTexture(_arg_1:Tanks3DSResource, _arg_2:Mesh, _arg_3:int) : TextureMaterial
      {
         var _local_4:TextureMaterial = null;
         if(_arg_1 == null || _arg_2 == null || this.colormap == null && this.multiframeImageResource == null)
         {
            return null;
         }
         if(this.multiframeImageResource != null)
         {
            _local_4 = this.createAnimatedTexture(_arg_1,_arg_3);
         }
         else
         {
            _local_4 = this.createTexture(_arg_1,_arg_3);
         }
         this.createTrackSkins(_arg_2,_arg_1);
         _arg_2.setMaterialToAllFaces(_local_4);
         return _local_4;
      }
      
      private function createAnimatedTexture(_arg_1:Tanks3DSResource, _arg_2:int) : TextureMaterial
      {
         var _local_3:BitmapData = _arg_1.textures["lightmap.jpg"];
         var _local_4:BitmapData = _arg_1.textures["details.png"];
         var _local_5:int = int(this.multiframeImageResource.data.width / this.multiframeImageResource.frameWidth);
         var _local_6:int = int(this.multiframeImageResource.data.height / this.multiframeImageResource.frameHeight);
         var _local_7:AnimatedPaintMaterial = new AnimatedPaintMaterial(this.multiframeImageResource.data,_local_3,_local_4,_local_5,_local_6,this.multiframeImageResource.fps,this.multiframeImageResource.numFrames);
         if(this.materials[_arg_2] != null)
         {
            this.materials[_arg_2].dispose();
         }
         this.materials[_arg_2] = _local_7;
         return _local_7;
      }
      
      private function createTexture(_arg_1:Tanks3DSResource, _arg_2:int) : TextureMaterial
      {
         var _local_3:BitmapData = _arg_1.textures["lightmap.jpg"];
         var _local_4:BitmapData = _arg_1.textures["details.png"];
         var _local_5:TextureMaterial = new PaintMaterial(this.colormap,_local_3,_local_4);
         if(this.materials[_arg_2] != null)
         {
            this.materials[_arg_2].dispose();
         }
         this.materials[_arg_2] = _local_5;
         return _local_5;
      }
      
      public function createTrackSkins(_arg_1:Mesh, _arg_2:Tanks3DSResource) : void
      {
         var _local_3:Face = null;
         this.leftTrackSkin = new TrackSurfaceSkin();
         this.rightTrackSkin = new TrackSurfaceSkin();
         for each(_local_3 in _arg_1.faces)
         {
            if(_local_3.id == "track" || _local_3.material.name == "track")
            {
               this.addFaceToTrackSkin(_local_3);
            }
         }
         this.leftTrackSkin.init();
         this.rightTrackSkin.init();
      }
      
      private function addFaceToTrackSkin(_arg_1:Face) : void
      {
         var _local_2:Vertex = _arg_1.vertices[0];
         if(_local_2.x < 0)
         {
            this.leftTrackSkin.addFace(_arg_1);
         }
         else
         {
            this.rightTrackSkin.addFace(_arg_1);
         }
      }
      
      private function updateMountPoint() : void
      {
         if(this.hull == null || this.turret == null)
         {
            return;
         }
         var _local_1:Object3D = this.hullResource.getObjectsByName(/mount/i)[0];
         this.turret.x = _local_1.x;
         this.turret.y = _local_1.y;
         this.turret.z = _local_1.z;
      }
      
      public function destroy() : void
      {
         this.destroyMaterials();
         this.materials = null;
         this.multiframeImageResource = null;
         this.hull = null;
         this.turret = null;
         this.colormap = null;
         this.hullResource = null;
         this.turretResource = null;
      }
      
      private function destroyMaterials() : void
      {
         if(this.materials[HULL_PART] != null)
         {
            this.materials[HULL_PART].dispose();
            this.materials[HULL_PART] = null;
         }
         if(this.materials[TURRET_PART] != null)
         {
            this.materials[TURRET_PART].dispose();
            this.materials[TURRET_PART] = null;
         }
      }
      
      protected function initMesh(_arg_1:Mesh) : Mesh
      {
         if(_arg_1.sorting != Sorting.DYNAMIC_BSP)
         {
            _arg_1.sorting = Sorting.DYNAMIC_BSP;
            _arg_1.calculateFacesNormals(true);
            _arg_1.optimizeForDynamicBSP();
            _arg_1.threshold = 0.01;
         }
         return _arg_1;
      }
   }
}

