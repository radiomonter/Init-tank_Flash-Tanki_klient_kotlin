package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.Dust;
   import alternativa.tanks.battle.FPSCounter;
   import alternativa.tanks.battle.PerformanceControllerWithThrottling;
   import alternativa.tanks.battle.UserTitleRenderer;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Object3DContainerProxy;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.camera.Jojaver;
   import alternativa.tanks.camera.Zynomy;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import obfuscation.dinas.Nisyqikic;
   import obfuscation.jebucahu.Bike;
   import obfuscation.kisagehy.Waqi;
   import obfuscation.raryzuzif.Pabotemet;
   import obfuscation.ronadylez.Jypig;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class BattleScene3D
   {
      
      private static const bekenotys:int = 10;
      
      private static const vepyhefy:int = 20000;
      
      private static const gomihu:Vector3D = new Vector3D();
      
      private static const ticysuzo:Vector3D = new Vector3D();
      
      private const vahokih:Dictionary = new Dictionary();
      
      private const syzalec:Dictionary = new Dictionary();
      
      private const wifirihy:Nisyqikic = new Nisyqikic();
      
      private const ratibum:Dictionary = new Dictionary();
      
      private const sawifa:FPSCounter = new FPSCounter(100);
      
      public const tiziqec:Jypig = new Jypig();
      
      private var rootContainer:Object3DContainer;
      
      private var gone:Object3DContainer;
      
      private var mainContainer:Object3DContainer;
      
      private var wylisefod:Object3DContainer;
      
      public var mojigu:Object3DContainer;
      
      private var wufecagog:Object3DContainerProxy = new Object3DContainerProxy();
      
      private var fel:Object3DContainerProxy;
      
      private var camera:GameCamera;
      
      private var kezusiba:Vector.<RenderGroup> = Vector.<RenderGroup>([new RenderGroup(),new RenderGroup()]);
      
      private var ziqowa:Zynomy = Jojaver.INSTANCE;
      
      private var effects:Vector.<GraphicEffect> = new Vector.<GraphicEffect>();
      
      private var rahihu:int;
      
      private var muwohaw:UserTitleRenderer;
      
      private var misoz:FadingDecalsRenderer;
      
      private var kamewosu:DecalFactory;
      
      private var fog:Fog;
      
      private var ambientShadows:AmbientShadows;
      
      private var lighting:Lighting;
      
      private var perfomanceController:PerformanceControllerWithThrottling;
      
      private var stage:Stage;
      
      private var lesa:Dust;
      
      private var zyfuqi:Pabotemet;
      
      private var suner:TextureMaterialRegistry;
      
      private var dugyhucy:Number;
      
      private var lyten:BattleScene3DDebugCommands;
      
      private var bazerek:Boolean;
      
      private var tanks:Vector.<Tank> = new Vector.<Tank>();
      
      public function BattleScene3D(_arg_1:Stage, _arg_2:TextureMaterialRegistry, _arg_3:Number)
      {
         super();
         this.suner = _arg_2;
         this.stage = _arg_1;
         this.dugyhucy = _arg_3;
         this.bapevysam();
         this.voryqehi();
         this.qyr();
         this.zyfuqi = new Pabotemet();
         this.fog = new Fog(this.camera);
         this.ambientShadows = new AmbientShadows(this.camera);
         this.lighting = new Lighting(this.camera);
      }
      
      public function vujez() : Scene3DContainer
      {
         return this.fel;
      }
      
      public function jidokezyp() : Scene3DContainer
      {
         return this.wufecagog;
      }
      
      public function colulif(_arg_1:View) : void
      {
         this.camera.view = _arg_1;
      }
      
      public function nonobili(_arg_1:Number, _arg_2:uint, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
      }
      
      public function zyz() : void
      {
         this.toqok(this.tiziqec,0);
      }
      
      public function tihajyw(_arg_1:BattleService, _arg_2:Waqi) : void
      {
         this.lesa = new Dust(_arg_1);
         this.lesa.init(_arg_2.dustParticle,this.suner,_arg_2.dustFarDistance,_arg_2.dustNearDistance,_arg_2.dustSize,_arg_2.alpha,_arg_2.micubew);
      }
      
      public function tyq() : Dust
      {
         return this.lesa;
      }
      
      public function qedunevy() : void
      {
         this.qahakuve(this.tiziqec,0);
         this.tiziqec.restore();
      }
      
      public function gumy(_arg_1:Boolean, _arg_2:String) : void
      {
         if(_arg_1)
         {
            if(this.perfomanceController == null)
            {
               this.dewecul(true);
               this.finifep(true);
               this.zyboh(true);
               this.qazid(true);
               this.tytole(true);
               this.woc(true);
               this.mahokobes(true);
               this.garocifuf(true);
               this.qaqedy(true);
               this.perfomanceController = new PerformanceControllerWithThrottling();
               this.perfomanceController.start1(this.stage,this.camera,_arg_2);
            }
         }
         else if(this.perfomanceController != null)
         {
            this.perfomanceController.stop();
            this.perfomanceController = null;
         }
      }
      
      public function horidawu(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         this.fog.setup(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function muge(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number) : void
      {
         this.lighting.setup(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function dewecul(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(_arg_1)
            {
               this.ambientShadows.enable();
            }
            else
            {
               this.ambientShadows.disable();
            }
         }
      }
      
      public function finifep(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(_arg_1)
            {
               this.lighting.gunysa();
            }
            else
            {
               this.lighting.tajada();
            }
         }
      }
      
      public function zyboh(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(_arg_1)
            {
               this.fog.enable();
            }
            else
            {
               this.fog.disable();
            }
         }
      }
      
      public function tecihefew() : void
      {
         this.zyboh(this.camera.fogAlpha == 0);
      }
      
      public function gipa(_arg_1:DecalFactory) : void
      {
         this.kamewosu = _arg_1;
      }
      
      public function cemo(_arg_1:Dictionary) : void
      {
         var _local_2:* = undefined;
         for(_local_2 in this.ratibum)
         {
            _arg_1[_local_2] = true;
         }
      }
      
      public function kyj(_arg_1:Object3D) : void
      {
         this.vahokih[_arg_1] = true;
      }
      
      public function vup(_arg_1:Object3D) : void
      {
         delete this.vahokih[_arg_1];
      }
      
      public function zamume() : Dictionary
      {
         return this.vahokih;
      }
      
      public function diwupisi() : Dictionary
      {
         return this.syzalec;
      }
      
      private function bapevysam() : void
      {
         this.rootContainer = new Object3DContainer();
         this.rootContainer.addChild(this.gone = new Object3DContainer());
         this.rootContainer.addChild(this.mainContainer = new Object3DContainer());
         this.rootContainer.addChild(this.wylisefod = new Object3DContainer());
         this.fel = new Object3DContainerProxy(this.wylisefod);
      }
      
      private function voryqehi() : void
      {
         this.camera = new GameCamera();
         this.camera.ssaoRadius = 400;
         this.camera.ssaoRange = 1200;
         this.camera.ssaoColor = 0;
         this.camera.ssaoAlpha = 1.4;
         this.camera.addToDebug(Debug.BOUNDS,Object3D);
         this.camera.addToDebug(Debug.EDGES,Object3D);
         this.rootContainer.addChild(this.camera);
      }
      
      public function ziwic(_arg_1:uint) : void
      {
         this.camera.ssaoColor = _arg_1;
      }
      
      private function qyr() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.misoz = new FadingDecalsRenderer(vepyhefy);
            this.toqok(this.misoz,0);
         }
      }
      
      public function kaporirum(_arg_1:Shadow) : void
      {
         this.ambientShadows.add(_arg_1);
      }
      
      public function nam(_arg_1:Shadow) : void
      {
         this.ambientShadows.remove(_arg_1);
      }
      
      public function kugyq(_arg_1:Bike) : void
      {
         this.addObject(_arg_1.qenokeru());
      }
      
      public function nohibi(_arg_1:Bike) : void
      {
         this.removeObject(_arg_1.qenokeru());
      }
      
      public function henitupo(_arg_1:Boolean) : void
      {
         this.camera.debug = _arg_1;
      }
      
      public function isDebug() : Boolean
      {
         return this.camera.debug;
      }
      
      public function lace() : void
      {
         this.bazerek = true;
      }
      
      public function hizemena() : void
      {
         this.bazerek = false;
      }
      
      public function qomasabyg(_arg_1:UserTitleRenderer) : void
      {
         this.muwohaw = _arg_1;
      }
      
      public function gema(_arg_1:Tank) : void
      {
         this.tanks.push(_arg_1);
      }
      
      public function hebymos(_arg_1:Tank) : void
      {
         var _local_2:int = this.tanks.indexOf(_arg_1);
         if(_local_2 != -1)
         {
            this.tanks.splice(_local_2,1);
         }
      }
      
      public function toqok(_arg_1:Renderer, _arg_2:int = 0) : void
      {
         var _local_3:RenderGroup = this.kezusiba[_arg_2];
         _local_3.toqok(_arg_1);
      }
      
      public function qahakuve(_arg_1:Renderer, _arg_2:int = 0) : void
      {
         var _local_3:RenderGroup = this.kezusiba[_arg_2];
         _local_3.qahakuve(_arg_1);
      }
      
      public function addGraphicEffect(_arg_1:GraphicEffect) : void
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError();
         }
         var _local_2:* = this.rahihu++;
         this.effects[_local_2] = _arg_1;
         _arg_1.qojyf(this.wufecagog);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         if(this.bazerek)
         {
            this.sawifa.update();
            this.ambientShadows.wavy(this.sawifa.ruji());
            this.lesa.update();
            this.mubic(_arg_1,_arg_2);
            this.ziqowa.update(_arg_1,_arg_2);
            this.camera.qigicowap();
            this.rakytimi(_arg_1,_arg_2);
            this.fovu(_arg_2);
            if(this.muwohaw != null)
            {
               this.muwohaw.zadajav();
            }
            _local_3 = this.camera.shadowMap != null ? Number(this.camera.shadowMapStrength) : Number(0);
            if(this.camera.directionalLight != null)
            {
               this.camera.directionalLight.intensity = this.dugyhucy + _local_3 * (1 - this.dugyhucy);
            }
            this.camera.render();
         }
      }
      
      private function mubic(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Tank = null;
         for each(_local_3 in this.tanks)
         {
            _local_3.render(_arg_1,_arg_2);
         }
      }
      
      private function fovu(_arg_1:int) : void
      {
         var _local_2:GraphicEffect = null;
         var _local_3:int = 0;
         var _local_4:* = undefined;
         while(_local_3 < this.rahihu)
         {
            _local_2 = this.effects[_local_3];
            if(!_local_2.play(_arg_1,this.camera))
            {
               _local_2.destroy();
               _local_4 = _local_3--;
               this.effects[_local_4] = this.effects[--this.rahihu];
               this.effects[this.rahihu] = null;
            }
            _local_3++;
         }
      }
      
      public function cewubu() : GameCamera
      {
         return this.camera;
      }
      
      public function johoqup(_arg_1:Object3D) : void
      {
         if(this.gone.numChildren > 0)
         {
            this.gone.removeChildAt(0);
         }
         this.gone.addChild(_arg_1);
      }
      
      public function woc(_arg_1:Boolean) : void
      {
         this.camera.ssao = _arg_1;
      }
      
      public function konorazo(_arg_1:Object3DContainer) : void
      {
         if(this.mojigu != null)
         {
            this.mainContainer.removeChild(this.mojigu);
            this.mojigu = null;
         }
         this.wufecagog.zad(_arg_1);
         this.mojigu = _arg_1;
         if(this.mojigu != null)
         {
            this.mainContainer.addChild(this.mojigu);
            this.camera.farClipping = 1.5 * this.cimuzeco(this.mojigu);
         }
      }
      
      public function cimuzeco(_arg_1:Object3D) : Number
      {
         var _local_2:Number = _arg_1.boundMaxX - _arg_1.boundMinX;
         var _local_3:Number = _arg_1.boundMaxY - _arg_1.boundMinY;
         var _local_4:Number = _arg_1.boundMaxZ - _arg_1.boundMinZ;
         return Math.sqrt(_local_2 * _local_2 + _local_3 * _local_3 + _local_4 * _local_4);
      }
      
      public function addObject(_arg_1:Object3D) : void
      {
         this.wufecagog.addChild(_arg_1);
         if(_arg_1.name != Object3DNames.dyhan && _arg_1.name != Object3DNames.TANK_PART)
         {
            this.syzalec[_arg_1] = true;
         }
      }
      
      public function removeObject(_arg_1:Object3D) : void
      {
         this.wufecagog.removeChild(_arg_1);
         if(_arg_1.name != Object3DNames.dyhan && _arg_1.name != Object3DNames.TANK_PART)
         {
            delete this.syzalec[_arg_1];
         }
      }
      
      public function raycast(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Dictionary, _arg_4:Camera3D = null) : RayIntersectionData
      {
         var _local_5:Object3D = null;
         BattleUtils.vyb(_arg_1,gomihu);
         BattleUtils.vyb(_arg_2,ticysuzo);
         var _local_6:RayIntersectionData = this.mojigu.intersectRay(gomihu,ticysuzo,_arg_3,_arg_4);
         if(Boolean(_local_6))
         {
            _local_5 = _local_6.object;
            while(_local_5 != null && !_local_5.mouseEnabled)
            {
               _local_5 = _local_5.parent;
            }
            _local_6.object = _local_5;
         }
         return _local_6;
      }
      
      public function huc(_arg_1:Boolean) : void
      {
         var _local_2:Object3D = this.gymevu();
         if(_local_2 != null)
         {
            _local_2.visible = _arg_1;
         }
      }
      
      public function cifizi() : Boolean
      {
         var _local_1:Object3D = this.gymevu();
         if(_local_1 != null)
         {
            return _local_1.visible;
         }
         return false;
      }
      
      public function addDecal(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:TextureMaterial, _arg_5:RotationState = null) : void
      {
         var _local_6:Decal = this.createDecal(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         if(_local_6 != null)
         {
            this.wifirihy.put(_local_6);
            if(this.wifirihy.getSize() > bekenotys)
            {
               this.misoz.add(this.wifirihy.pop());
            }
         }
      }
      
      public function kequ(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:TextureMaterial) : Decal
      {
         return this.createDecal(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      private function createDecal(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:TextureMaterial, _arg_5:RotationState = null) : Decal
      {
         var _local_6:Decal = null;
         if(_arg_5 == null)
         {
            _arg_5 = RotationState.nuru;
         }
         if(GPUCapabilities.gpuEnabled && this.mojigu is KDContainer)
         {
            _local_6 = this.kamewosu.createDecal(_arg_1,_arg_2,_arg_3,_arg_4,KDContainer(this.mojigu),_arg_5);
            this.wufecagog.addChildAt(_local_6,0);
            this.ratibum[_local_6] = true;
            this.kyj(_local_6);
            this.syzalec[_local_6] = true;
            return _local_6;
         }
         return null;
      }
      
      public function vomuh(_arg_1:Decal) : void
      {
         if(_arg_1 != null && GPUCapabilities.gpuEnabled)
         {
            this.wufecagog.removeChild(_arg_1);
            this.vup(_arg_1);
            delete this.syzalec[_arg_1];
            delete this.ratibum[_arg_1];
         }
      }
      
      public function sefu(_arg_1:Zynomy) : void
      {
         this.ziqowa = _arg_1;
      }
      
      public function zuv() : Zynomy
      {
         return this.ziqowa;
      }
      
      private function gymevu() : Object3D
      {
         if(this.gone.numChildren == 0)
         {
            return null;
         }
         return this.gone.getChildAt(0);
      }
      
      private function rakytimi(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:RenderGroup = null;
         for each(_local_3 in this.kezusiba)
         {
            _local_3.render(_arg_1,_arg_2);
         }
      }
      
      public function shutdown() : void
      {
         if(this.ziqowa != null)
         {
            this.ziqowa.deactivate();
         }
         this.gumy(false,"");
         this.nonowyfag(this.gone);
         this.nonowyfag(this.mainContainer);
         this.nonowyfag(this.wylisefod);
         this.nonowyfag(this.rootContainer);
         this.tiziqec.clear();
      }
      
      private function nonowyfag(_arg_1:Object3DContainer) : void
      {
         while(_arg_1.numChildren > 0)
         {
            _arg_1.removeChildAt(0);
         }
      }
      
      public function qazid(_arg_1:Boolean) : void
      {
         this.camera.softTransparency = _arg_1;
      }
      
      public function tytole(_arg_1:Boolean) : void
      {
         this.tyq().enabled = _arg_1;
      }
      
      public function hin() : void
      {
         this.lighting.toggle();
      }
      
      public function kyveculoh(_arg_1:Mesh) : void
      {
         this.zyfuqi.add(_arg_1);
      }
      
      public function cybe(_arg_1:BitmapData) : void
      {
         this.zyfuqi.setImage(_arg_1);
      }
      
      public function mahokobes(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(_arg_1)
            {
               this.lighting.mahokobes();
            }
            else
            {
               this.lighting.sazeli();
            }
         }
      }
      
      public function garocifuf(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.deferredLighting = _arg_1;
         }
      }
      
      public function qaqedy(_arg_1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.view.antiAliasEnabled = _arg_1;
         }
      }
      
      public function bimyputab() : Number
      {
         return this.mojigu == null ? Number(0) : Number(this.mojigu.boundMinZ);
      }
   }
}

