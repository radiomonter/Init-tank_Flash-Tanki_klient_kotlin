package alternativa.tanks.services.bonusregion
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.bonus.region.BonusRegion;
   import alternativa.tanks.models.bonus.region.GoldBonusRegion;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import obfuscation.kyre.TanksCollisionDetector;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.client.battlefield.models.bonus.battle.bonusregions.BonusRegionResource;
   
   public class BonusRegionService
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var settings:ISettingsService;
      
      private static var stubBitmapData:BitmapData;
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const m1:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const angles:Vector3 = new Vector3();
      
      private static const v:Vector3 = new Vector3();
      
      private static const REGION_SIZE:int = 500;
      
      private static const REGION_DECAL_ACSENSION:Number = 5;
      
      private var _goldRegions:Dictionary = new Dictionary();
      
      private var _bonusRegions:Array = new Array();
      
      private var _forceShow:Boolean;
      
      private var _forceHide:Boolean;
      
      public function BonusRegionService(_arg_1:BattleEventDispatcher)
      {
         super();
         this.prepare();
      }
      
      private static function createRegion(_arg_1:Vector3, _arg_2:Vector3, _arg_3:TextureMaterial) : Mesh
      {
         var _local_4:Decal = new Decal();
         var _local_5:Number = REGION_SIZE / 2;
         var _local_6:Number = 0.5;
         var _local_7:Vertex = _local_4.addVertex(-_local_5,_local_5,_local_6,0,0);
         var _local_8:Vertex = _local_4.addVertex(-_local_5,-_local_5,_local_6,0,1);
         var _local_9:Vertex = _local_4.addVertex(_local_5,-_local_5,_local_6,1,1);
         var _local_10:Vertex = _local_4.addVertex(_local_5,_local_5,_local_6,1,0);
         _local_4.addQuadFace(_local_7,_local_8,_local_9,_local_10,_arg_3);
         _local_4.calculateFacesNormals();
         _local_4.calculateVerticesNormals();
         _local_4.x = _arg_1.x;
         _local_4.y = _arg_1.y;
         _local_4.z = _arg_1.z + REGION_DECAL_ACSENSION;
         _local_4.rotationX = _arg_2.x;
         _local_4.rotationY = _arg_2.y;
         _local_4.rotationZ = _arg_2.z;
         return _local_4;
      }
      
      private static function getStubBitmapData() : BitmapData
      {
         if(stubBitmapData == null)
         {
            stubBitmapData = new StubBitmapData(65280);
         }
         return stubBitmapData;
      }
      
      private static function getMaterial(name:String) : BitmapData
      {
         switch(name)
         {
            case "health":
               return BonusRegionResource.healthTexture;
            case "armor":
               return BonusRegionResource.armorTexture;
            case "damage":
               return BonusRegionResource.damageTexture;
            case "nitro":
               return BonusRegionResource.nitroTexture;
            case "gold":
               return BonusRegionResource.goldTexture;
            default:
               return null;
         }
      }
      
      public function prepare() : void
      {
         this._forceShow = settings.showDropZones;
         this._forceHide = !this._forceShow;
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccept);
      }
      
      private function onSettingsAccept(_arg_1:SettingsServiceEvent) : void
      {
         if(this._forceShow != settings.showDropZones)
         {
            this.toggleRegionsVisible();
         }
      }
      
      private function getGroundPointAndNormal(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:RayHit) : void
      {
         var _local_4:TanksCollisionDetector = battleService.getBattleRunner().soc();
         if(_local_4.raycast(_arg_1,Vector3.DOWN,64,10000000000,null,_arg_4))
         {
            _arg_2.copy(_arg_4.position);
            _arg_3.copy(_arg_4.normal);
         }
         else
         {
            _arg_2.copy(_arg_1);
            _arg_2.z -= 1000;
            _arg_3.copy(Vector3.Z_AXIS);
         }
      }
      
      private function checkCorner(_arg_1:Vector3) : Boolean
      {
         return _arg_1.z > Math.cos(Math.PI / 180);
      }
      
      public function calculateRotation(_arg_2:RayHit) : Vector3
      {
         var _local_7:Number = NaN;
         var _arg_1:Vector3 = _arg_2.position;
         var _local_2:Vector3 = new Vector3();
         var _local_3:Vector3 = new Vector3();
         var _local_6:Vector3 = new Vector3(_arg_1.x,_arg_1.y,_arg_1.z);
         this.getGroundPointAndNormal(_local_6,_local_2,_local_3,_arg_2);
         if(this.checkCorner(_local_3))
         {
            _local_3.reset();
         }
         else
         {
            _local_7 = NaN;
            axis.cross2(Vector3.Z_AXIS,_local_3);
            axis.normalize();
            _local_7 = Math.acos(_local_3.z);
            m.fromAxisAngle(axis,_local_7);
            m1.setRotationMatrix(0,0,0);
            m1.append(m);
            m1.getEulerAngles(angles);
            v.transform3(m);
            _local_3.copy(angles);
         }
         return _local_3;
      }
      
      public function addAndShowGoldRegion(pos:Vector3, id:String) : void
      {
         var _local_3:Mesh = null;
         var _local_4:BonusRegion = null;
         var _rayHit:RayHit = new RayHit();
         if(battleService.getBattleRunner().soc().raycastStatic(pos,Vector3.DOWN,64,10000000000,null,_rayHit))
         {
            _rayHit.position.z += 1;
            _local_3 = createRegion(_rayHit.position,this.calculateRotation(_rayHit),new TextureMaterial(getMaterial("gold")));
            _local_4 = new GoldBonusRegion(_local_3,_rayHit.position);
            this._goldRegions[id.toString()] = _local_4;
            _local_4.addToGame();
            _local_4.show();
         }
      }
      
      public function addAndShowRegion(pos:Vector3, name:String) : void
      {
         var _local_3:Mesh = null;
         var _local_4:BonusRegion = null;
         var _rayHit:RayHit = new RayHit();
         if(battleService.getBattleRunner().soc().raycastStatic(pos,Vector3.DOWN,64,10000000000,null,_rayHit))
         {
            _rayHit.position.z += 1;
            _local_3 = createRegion(_rayHit.position,this.calculateRotation(_rayHit),new TextureMaterial(getMaterial(name)));
            _local_4 = new BonusRegion(_local_3,_rayHit.position,this._forceShow);
            _local_4.addToGame();
            _local_4.show();
            this._bonusRegions.push(_local_4);
         }
      }
      
      public function enableForceShow() : void
      {
         var _local_1:BonusRegion = null;
         this._forceShow = true;
         this._forceHide = false;
         settings.showDropZones = true;
         for each(_local_1 in this._bonusRegions)
         {
            if(!(_local_1 is GoldBonusRegion))
            {
               _local_1.showForce();
            }
         }
      }
      
      public function enableForceHide() : void
      {
         var _local_1:BonusRegion = null;
         this._forceHide = true;
         this._forceShow = false;
         settings.showDropZones = false;
         for each(_local_1 in this._bonusRegions)
         {
            if(!(_local_1 is GoldBonusRegion))
            {
               _local_1.hideForce();
            }
         }
      }
      
      public function hideAndRemoveGoldRegion(param1:String) : void
      {
         var _local_3:BonusRegion = null;
         if(Boolean(this._goldRegions[param1.toString()]))
         {
            _local_3 = this._goldRegions[param1.toString()];
            _local_3.hideAndRemoveFromGame();
         }
      }
      
      public function hideAndRemoveGoldRegions() : void
      {
         var _local_1:BonusRegion = null;
         var _local_2:* = undefined;
         for each(_local_1 in this._goldRegions)
         {
            if(_local_1 is GoldBonusRegion)
            {
               _local_1.hideAndRemoveFromGame();
               delete this._bonusRegions[_local_2];
            }
         }
      }
      
      public function toggleRegionsVisible() : void
      {
         if(this._forceShow)
         {
            this.enableForceHide();
         }
         else if(this._forceHide)
         {
            this.enableForceShow();
         }
      }
   }
}

