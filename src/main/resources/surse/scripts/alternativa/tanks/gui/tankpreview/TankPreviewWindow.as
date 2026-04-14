package alternativa.tanks.gui.tankpreview
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowInner;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Timer;
   import forms.TankWindowWithHeader;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.flash.resources.tanks.Tank3D;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.disposeBitmapsData;
   
   use namespace alternativa3d;
   
   public class TankPreviewWindow extends TankWindowWithHeader
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const kohimev:Number = -1;
      
      private static const INITIAL_CAMERA_DIRECTION:Number = -150;
      
      private static const WINDOW_MARGIN:int = 11;
      
      private static const CAMERA_ANGLE:Number = -108;
      
      private static const CAMERA_DISTANCE:Number = -950;
      
      private static const kep:Number = 0.7;
      
      private static const masis:Number = 13;
      
      private static const gyzimuror:Number = 2.5;
      
      private static const zapoqat:Vector3D = new Vector3D(0,0,-1);
      
      private var innerBevel:TankWindowInner;
      
      private var backgroundEraser:Shape;
      
      private var rootContainer:Object3DContainer;
      
      private var kyk:Object3DContainer;
      
      private var cameraContainer:Object3DContainer;
      
      private var camera:Camera3D;
      
      private var stateMachine:TankPreviewStateMachine;
      
      private var tank:Tank3D;
      
      private var loadedPartsCounter:int = 0;
      
      private var backgroundEraserTimer:Timer;
      
      private var shadow:Mesh;
      
      private var _hull:Tanks3DSResource;
      
      private var _turret:Tanks3DSResource;
      
      private var bitmapsData:Array;
      
      public function TankPreviewWindow(_arg_1:Tanks3DSResource)
      {
         super();
         this.bitmapsData = [];
         setHeaderId("YOUR_TANK");
         this.init3D();
         this.createWindowInnerBevel();
         this.addGarageObjectsToScene(_arg_1);
         this.createTank();
         this.resize(400,300);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function init3D() : void
      {
         this.rootContainer = new Object3DContainer();
         this.camera = new Camera3D();
         this.camera.view = new View(100,100,GPUCapabilities.constrained);
         this.camera.view.hideLogo();
         addChild(this.camera.view);
         this.cameraContainer = new Object3DContainer();
         this.rootContainer.addChild(this.cameraContainer);
         this.kyk = new Object3DContainer();
         this.rootContainer.addChild(this.kyk);
         this.cameraContainer.addChild(this.camera);
         this.cameraContainer.rotationX = CAMERA_ANGLE * Math.PI / 180;
         this.camera.z = CAMERA_DISTANCE;
         this.cameraContainer.rotationZ = INITIAL_CAMERA_DIRECTION * Math.PI / 180;
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraser = new Shape();
            this.backgroundEraser.blendMode = BlendMode.ERASE;
         }
      }
      
      private function createWindowInnerBevel() : void
      {
         this.innerBevel = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.innerBevel);
         this.innerBevel.mouseEnabled = true;
      }
      
      private function createTank() : void
      {
         this.tank = new Tank3D();
         this.rootContainer.addChild(this.tank);
         this.tank.matrix.appendTranslation(-17,0,0);
      }
      
      private function addGarageObjectsToScene(_arg_1:Tanks3DSResource) : void
      {
         var _local_2:Mesh = null;
         var _local_3:TextureMaterial = null;
         var _local_4:BSP = null;
         var _local_6:int = 0;
         var _local_5:int = int(_arg_1.objects.length);
         while(_local_6 < _local_5)
         {
            _local_2 = _arg_1.objects[_local_6] as Mesh;
            if(_local_2 != null)
            {
               _local_3 = TextureMaterial(_local_2.faceList.material);
               _local_3.texture = _arg_1.getTextureForObject(_local_6);
               _local_2.setMaterialToAllFaces(_local_3);
               _local_4 = new BSP();
               _local_4.createTree(_local_2);
               _local_4.matrix = _local_2.matrix;
               this.kyk.addChild(_local_4);
            }
            _local_6++;
         }
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,kohimev);
         this.initStateMachine();
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraserTimer = new Timer(1000,1);
            this.backgroundEraserTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
            this.backgroundEraserTimer.start();
         }
      }
      
      private function onBackgroundEraserTimerComplete(_arg_1:TimerEvent) : void
      {
         addChild(this.backgroundEraser);
         this.backgroundEraserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
         this.backgroundEraserTimer = null;
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         this.stateMachine.updateCurrentState();
         this.camera.render();
      }
      
      private function initStateMachine() : void
      {
         this.stateMachine = new TankPreviewStateMachine();
         var _local_1:TankPreviewContext = new TankPreviewContext();
         var _local_2:ManualRotationState = new ManualRotationState(this.stateMachine,stage,_local_1,this.camera,this.cameraContainer);
         var _local_3:RotationDecelerationState = new RotationDecelerationState(this.stateMachine,this.innerBevel,_local_1,this.cameraContainer);
         var _local_4:IdleState = new IdleState(this.stateMachine,this.innerBevel);
         var _local_5:AutoRotationState = new AutoRotationState(this.stateMachine,this.innerBevel,this.cameraContainer);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_local_3,_local_2);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_local_4,_local_2);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_local_5,_local_2);
         this.stateMachine.addTransition(TankPreviewEvent.STOP_MANUAL_ROTATION,_local_2,_local_3);
         this.stateMachine.addTransition(TankPreviewEvent.ROTATION_STOPPED,_local_3,_local_4);
         this.stateMachine.addTransition(TankPreviewEvent.IDLE_STATE_TIMEOUT,_local_4,_local_5);
         this.stateMachine.setCurrentState(_local_4);
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         if(this.backgroundEraserTimer != null)
         {
            this.backgroundEraserTimer.stop();
            this.backgroundEraserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
            this.backgroundEraserTimer = null;
         }
         this.innerBevel = null;
         this.rootContainer = null;
         this.cameraContainer = null;
         this.camera.view.clear();
         this.camera = null;
         this.tank.destroy();
         this.tank = null;
         this.shadow = null;
         this._hull = null;
         this._turret = null;
         disposeBitmapsData(this.bitmapsData);
      }
      
      public function setHull(_arg_1:Tanks3DSResource) : void
      {
         this._hull = _arg_1;
         this.tank.setHull(this._hull);
         this.onTankPartLoaded();
      }
      
      public function setTurret(_arg_1:Tanks3DSResource) : void
      {
         this._turret = _arg_1;
         this.tank.setTurret(this._turret);
         this.onTankPartLoaded();
      }
      
      public function setColorMap(_arg_1:BitmapData) : void
      {
         this.tank.setColorMap(_arg_1);
         this.onTankPartLoaded();
      }
      
      public function setTextureAnimation(_arg_1:MultiframeImageResource) : void
      {
         this.tank.setTextureAnimation(_arg_1);
         this.onTankPartLoaded();
      }
      
      private function onTankPartLoaded() : void
      {
         if(this.loadedPartsCounter < 3)
         {
            ++this.loadedPartsCounter;
         }
         if(this.loadedPartsCounter == 3)
         {
            if(this.shadow != null && this.tank.contains(this.shadow))
            {
               this.tank.removeChild(this.shadow);
            }
            this.shadow = this.mysomoqez(Mesh(this._hull.objects[0]),zapoqat,gyzimuror,masis,kep);
            this.tank.addChildAt(this.shadow,0);
            if(!GPUCapabilities.gpuEnabled)
            {
               this.camera.render();
            }
         }
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         this.width = _arg_1;
         this.height = _arg_2;
         this.adjustInnerBevel(_arg_1,_arg_2);
         this.adjustView3D(_arg_1,_arg_2);
         this.zubapymu();
         if(!GPUCapabilities.gpuEnabled)
         {
            this.camera.render();
         }
      }
      
      private function adjustInnerBevel(_arg_1:Number, _arg_2:Number) : void
      {
         this.innerBevel.width = _arg_1 - WINDOW_MARGIN * 2;
         this.innerBevel.height = _arg_2 - WINDOW_MARGIN * 2;
         this.innerBevel.x = WINDOW_MARGIN;
         this.innerBevel.y = WINDOW_MARGIN;
      }
      
      private function adjustView3D(_arg_1:Number, _arg_2:Number) : void
      {
         this.camera.view.width = _arg_1 - WINDOW_MARGIN * 2 - 2;
         this.camera.view.height = _arg_2 - WINDOW_MARGIN * 2 - 2;
         this.camera.view.x = WINDOW_MARGIN;
         this.camera.view.y = WINDOW_MARGIN;
      }
      
      private function zubapymu() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraser.x = this.camera.view.x;
            this.backgroundEraser.y = this.camera.view.y;
            this.backgroundEraser.graphics.clear();
            this.backgroundEraser.graphics.beginFill(16711680);
            this.backgroundEraser.graphics.drawRect(0,0,this.camera.view.width,this.camera.view.height);
            this.backgroundEraser.graphics.endFill();
         }
      }
      
      private function mysomoqez(_arg_1:Mesh, _arg_2:Vector3D, _arg_3:Number, _arg_4:int, _arg_5:Number, _arg_6:uint = 0) : Mesh
      {
         var _local_7:Wrapper = null;
         var _local_8:Vertex = null;
         var _local_12:Decal = null;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         _arg_2 = _arg_2.clone();
         _arg_2.normalize();
         var _local_13:Number = 1e+22;
         var _local_14:Number = 1e+22;
         var _local_15:Number = -1e+22;
         var _local_16:Number = -1e+22;
         var _local_17:Shape = new Shape();
         var _local_18:Face = _arg_1.faceList;
         while(_local_18 != null)
         {
            _local_7 = _local_18.wrapper;
            while(_local_7 != null)
            {
               _local_8 = _local_7.vertex;
               _local_9 = -_local_8.z / _arg_2.z;
               _local_10 = _local_8.x + _arg_2.x * _local_9;
               _local_11 = _local_8.y + _arg_2.y * _local_9;
               if(_local_10 < _local_13)
               {
                  _local_13 = _local_10;
               }
               if(_local_10 > _local_15)
               {
                  _local_15 = _local_10;
               }
               if(_local_11 < _local_14)
               {
                  _local_14 = _local_11;
               }
               if(_local_11 > _local_16)
               {
                  _local_16 = _local_11;
               }
               if(_local_7 == _local_18.wrapper)
               {
                  _local_17.graphics.beginFill(_arg_6);
                  _local_17.graphics.moveTo(_local_10,_local_11);
               }
               else
               {
                  _local_17.graphics.lineTo(_local_10,_local_11);
               }
               _local_7 = _local_7.next;
            }
            _local_18 = _local_18.next;
         }
         _local_13 = (Math.floor(_local_13 / _arg_3) - _arg_4) * _arg_3;
         _local_14 = (Math.floor(_local_14 / _arg_3) - _arg_4) * _arg_3;
         _local_15 = (Math.ceil(_local_15 / _arg_3) + _arg_4) * _arg_3;
         _local_16 = (Math.ceil(_local_16 / _arg_3) + _arg_4) * _arg_3;
         var _local_19:BitmapData = new BitmapData(Math.round((_local_15 - _local_13) / _arg_3),Math.round((_local_16 - _local_14) / _arg_3),true,0);
         this.bitmapsData.push(_local_19);
         _local_19.draw(_local_17,new Matrix(1 / _arg_3,0,0,-1 / _arg_3,-_local_13 / _arg_3,_local_16 / _arg_3));
         _local_19.applyFilter(_local_19,_local_19.rect,new Point(),new BlurFilter(_arg_4,_arg_4,BitmapFilterQuality.MEDIUM));
         var _local_20:TextureMaterial = new TextureMaterial(_local_19,false,true,MipMapping.PER_PIXEL,_arg_3);
         var _local_21:Mesh = new Mesh();
         var _local_22:Vertex = _local_21.addVertex(_local_13,_local_16,0,0,0);
         var _local_23:Vertex = _local_21.addVertex(_local_13,_local_14,0,0,1);
         var _local_24:Vertex = _local_21.addVertex(_local_15,_local_14,0,1,1);
         var _local_25:Vertex = _local_21.addVertex(_local_15,_local_16,0,1,0);
         _local_21.addQuadFace(_local_22,_local_23,_local_24,_local_25,_local_20);
         _local_21.calculateFacesNormals();
         _local_21.calculateBounds();
         _local_21.alpha = _arg_5;
         if(GPUCapabilities.gpuEnabled)
         {
            _local_12 = new Decal();
            _local_12.createGeometry(_local_21,true);
            _local_12.x = _local_21.x;
            _local_12.y = _local_21.y;
            _local_12.z = _local_21.z;
            _local_12.alpha = _local_21.alpha;
            return _local_12;
         }
         return _local_21;
      }
   }
}

