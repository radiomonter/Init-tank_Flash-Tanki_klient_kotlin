package obfuscation.gur
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.camera.Zynomy;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Wonesegy implements Zynomy
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var lorunar:IDisplay;
      
      [Inject]
      public static var settings:ISettingsService;
      
      private static const vycihazy:Number = 15;
      
      private static const ropig:Number = vycihazy * Math.PI / 180;
      
      private static var wegytufe:Vector3 = new Vector3();
      
      private static var motomepah:Matrix4 = new Matrix4();
      
      private static var zowypa:Matrix4 = new Matrix4();
      
      private static var majymyv:Vector3 = new Vector3();
      
      private var stage:Stage;
      
      private var veh:Point = new Point();
      
      private var wenuz:Boolean = false;
      
      private var camera:GameCamera;
      
      private var wut:Number;
      
      private var mybofof:Number;
      
      private var movementX:Number;
      
      private var movementY:Number;
      
      private var rotationX:Number;
      
      private var rotationZ:Number;
      
      private var zasah:Number;
      
      public function Wonesegy(_arg_1:Number, _arg_2:Number)
      {
         super();
         this.wut = _arg_1;
         this.mybofof = _arg_2;
         this.stage = lorunar.stage;
      }
      
      public function activate() : void
      {
         this.camera = battleService.getBattleScene3D().cewubu();
         this.movementX = 0;
         this.movementY = 0;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.ruzedotus();
         this.zasah = Num.cimise.tank.zoju();
         this.rotationX = 0;
         this.rotationZ = 0;
      }
      
      public function deactivate() : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.kujepecew();
      }
      
      private function ruzedotus() : void
      {
         this.veh.x = this.stage.mouseX;
         this.veh.y = this.stage.mouseY;
         this.wenuz = true;
      }
      
      public function kujepecew(_arg_1:Event = null) : void
      {
         this.wenuz = false;
      }
      
      private function onMouseMove(_arg_1:MouseEvent) : void
      {
         this.movementX += _arg_1["movementX"];
         this.movementY += _arg_1["movementY"] * this.siho();
      }
      
      private function pusekafo(_arg_1:Number, _arg_2:Number) : Number
      {
         return Math.atan2(Math.sin(_arg_1 - _arg_2),Math.cos(_arg_1 - _arg_2));
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Tank = null;
         var _local_4:Object3D = null;
         var _local_5:Mesh = null;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Number = NaN;
         var _local_13:Number = NaN;
         var _local_14:Number = NaN;
         if(this.wenuz)
         {
            _local_3 = Num.cimise.tank;
            if(this.movementX != 0 || this.movementY != 0)
            {
               this.veh.x = this.stage.mouseX;
               this.veh.y = this.stage.mouseY;
               _local_6 = this.zejisaho();
               _local_7 = -this.movementY * _local_6 / this.stage.stageHeight;
               this.rotationX = MathUtils.clamp(MathUtils.clampAngle(this.rotationX + _local_7),this.mybofof,this.wut);
               _local_8 = this.pejyta();
               _local_9 = _local_3.zoju();
               _local_10 = this.rotationZ - this.movementX * _local_8 / this.stage.stageWidth;
               _local_11 = _local_10 + this.zasah;
               _local_12 = this.pusekafo(_local_11,_local_9);
               _local_12 = MathUtils.clamp(_local_12,-ropig,ropig);
               _local_13 = _local_9 + _local_12;
               _local_14 = _local_13 - this.zasah;
               this.rotationZ = _local_14;
               this.movementX = 0;
               this.movementY = 0;
            }
            wegytufe.copy(_local_3.getynos());
            wegytufe.y = 0;
            motomepah.setPosition(wegytufe);
            _local_4 = _local_3.qenokeru();
            zowypa.setMatrix(_local_4.x,_local_4.y,_local_4.z,_local_4.rotationX,_local_4.rotationY,_local_4.rotationZ);
            motomepah.append(zowypa);
            this.camera.x = motomepah.m03;
            this.camera.y = motomepah.m13;
            this.camera.z = motomepah.m23;
            _local_5 = _local_3.bij().repijumu();
            motomepah.setMatrix(0,0,0,-Math.PI / 2 + this.rotationX,0,this.rotationZ + this.zasah);
            zowypa.setMatrix(0,0,0,_local_5.rotationX,_local_5.rotationY,_local_5.rotationZ);
            motomepah.append(zowypa);
            motomepah.getEulerAngles(majymyv);
            this.camera.rotationX = MathUtils.clampAngle(majymyv.x);
            this.camera.rotationY = MathUtils.clampAngle(majymyv.y);
            this.camera.rotationZ = MathUtils.clampAngle(majymyv.z);
         }
      }
      
      private function zejisaho() : Number
      {
         return 2 * Math.atan(this.stage.stageHeight / (2 * this.dyjibar()));
      }
      
      private function pejyta() : Number
      {
         return 2 * Math.atan(this.stage.stageWidth / (2 * this.dyjibar()));
      }
      
      private function dyjibar() : Number
      {
         return Math.sqrt(this.stage.stageWidth * this.stage.stageWidth + this.stage.stageHeight * this.stage.stageHeight) / (2 * Math.tan(this.camera.fov * 0.5));
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
      }
      
      private function siho() : int
      {
         return !settings.mouseYInverseShaftAim ? int(1) : int(-1);
      }
   }
}

