package obfuscation.jewyti
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.camera.Dyqiw;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.camera.Zynomy;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class Duso extends Dyqiw implements Zynomy
   {
      
      public static var display:Stage;
      
      private static const gol:ConsoleVarFloat = new ConsoleVarFloat("cam_smooth",0.1,0.001,1);
      
      private static const bot:ConsoleVarFloat = new ConsoleVarFloat("m_pitch",-0.006,-100,100);
      
      private static const pacy:ConsoleVarFloat = new ConsoleVarFloat("m_yaw",-0.006,-100,100);
      
      private static const nasyrypyq:ConsoleVarFloat = new ConsoleVarFloat("cam_spd",1300,0,10000);
      
      private static const fyjynog:ConsoleVarFloat = new ConsoleVarFloat("cam_acc",4,0,1000000);
      
      private static const pol:ConsoleVarFloat = new ConsoleVarFloat("yaw_speed",1,-10,10);
      
      private static const cuciha:ConsoleVarFloat = new ConsoleVarFloat("pitch_speed",1,-10,10);
      
      private var waka:Boolean;
      
      private var gap:Number;
      
      private var hufitoma:Number;
      
      private var jaq:Number;
      
      private var vykumi:Number;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var zus:Vector3;
      
      private var rygewuho:Lazuc;
      
      private var tibyguc:Vector.<Gonatedog>;
      
      private var mupedok:Sytyrojuq;
      
      public var lemy:Feb;
      
      private var vyv:Boolean = false;
      
      public function Duso()
      {
         super();
         display = IDisplay(OSGi.getInstance().getService(IDisplay)).stage;
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.zus = new Vector3();
         this.mupedok = new Habobada();
         this.lemy = new Feb(this);
         this.tibyguc = Vector.<Gonatedog>([new Kydyvawa(this),this.mupedok,this.lemy,new Fecivum()]);
         this.jazuhunum();
         this.rygewuho = new Lazuc(Vector.<Detuqyz>([new Zatyholoc(nasyrypyq,fyjynog),new Pocapah(nasyrypyq,fyjynog)]));
      }
      
      private static function jozy(_arg_1:Number, _arg_2:Number) : Number
      {
         var _local_3:Number = (_arg_2 - _arg_1) % (2 * Math.PI);
         if(_local_3 > Math.PI)
         {
            return _local_3 - 2 * Math.PI;
         }
         if(_local_3 < -Math.PI)
         {
            return 2 * Math.PI + _local_3;
         }
         return _local_3;
      }
      
      public function biv(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.lemy.syrekimuz();
         this.position.copy(_arg_1);
         this.rotation.copy(_arg_2);
         var _local_3:GameCamera = cewubu();
         this.zus.x = jozy(_local_3.rotationX,_arg_2.x);
         this.zus.y = jozy(_local_3.rotationY,_arg_2.y);
         this.zus.z = jozy(_local_3.rotationZ,_arg_2.z);
      }
      
      override public function update(_arg_1:int, _arg_2:int) : void
      {
         if(cewubu() != null)
         {
            this.momafone(_arg_2);
            this.mopir(_arg_2 / 1000);
            this.murajoq();
         }
      }
      
      private function momafone(_arg_1:int) : void
      {
         var _local_2:Vector3 = null;
         _local_2 = this.rygewuho.qudica().buloqonus(this.mupedok,cewubu(),_arg_1 / 1000);
         this.position.x += _local_2.x;
         this.position.y += _local_2.y;
         this.position.z += _local_2.z;
      }
      
      private function mopir(_arg_1:Number) : void
      {
         var _local_2:GameCamera = null;
         _local_2 = cewubu();
         if(this.waka)
         {
            this.rotation.x = this.jaq + (display.mouseY - this.hufitoma) * bot.value;
            this.rotation.x = MathUtils.clamp(this.rotation.x,-Math.PI,0);
            this.zus.x = this.rotation.x - _local_2.rotationX;
            this.rotation.z = this.vykumi + (display.mouseX - this.gap) * pacy.value;
            this.zus.z = this.rotation.z - _local_2.rotationZ;
         }
         else if(this.mupedok.isRotating())
         {
            this.rotation.x += this.mupedok.qita() * cuciha.value * _arg_1;
            this.rotation.x = MathUtils.clamp(this.rotation.x,-Math.PI,0);
            this.zus.x = this.rotation.x - _local_2.rotationX;
            this.zus.z += this.mupedok.cyfywac() * pol.value * _arg_1;
         }
      }
      
      private function murajoq() : void
      {
         this.tifev();
         this.pesyzasuj();
      }
      
      private function tifev() : void
      {
         var _local_1:GameCamera = cewubu();
         _local_1.x += (this.position.x - _local_1.x) * gol.value;
         _local_1.y += (this.position.y - _local_1.y) * gol.value;
         _local_1.z += (this.position.z - _local_1.z) * gol.value;
      }
      
      private function pesyzasuj() : void
      {
         var _local_1:GameCamera = null;
         _local_1 = cewubu();
         var _local_2:Number = this.zus.x * gol.value;
         _local_1.rotationX += _local_2;
         this.zus.x -= _local_2;
         var _local_3:Number = this.zus.y * gol.value;
         _local_1.rotationY += _local_3;
         this.zus.y -= _local_3;
         var _local_4:Number = this.zus.z * gol.value;
         _local_1.rotationZ += _local_4;
         this.zus.z -= _local_4;
      }
      
      override public function activate() : void
      {
         super.activate();
         this.zus.reset();
         this.ficik();
      }
      
      public function jazuhunum() : void
      {
         var _local_1:GameCamera = null;
         _local_1 = cewubu();
         this.position.x = _local_1.x;
         this.position.y = _local_1.y;
         this.position.z = _local_1.z;
         this.rotation.x = _local_1.rotationX;
         this.rotation.y = _local_1.rotationY;
         this.rotation.z = _local_1.rotationZ;
      }
      
      override public function deactivate() : void
      {
         this.mupedok.reset();
         this.zus.reset();
         this.benos();
      }
      
      private function onMouseDown(_arg_1:MouseEvent) : void
      {
         this.waka = true;
         this.gap = _arg_1.stageX;
         this.hufitoma = _arg_1.stageY;
         var _local_2:GameCamera = cewubu();
         this.jaq = _local_2.rotationX;
         this.vykumi = _local_2.rotationZ;
         display.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         var _local_2:Gonatedog = null;
         for each(_local_2 in this.tibyguc)
         {
            _local_2.mokuby(_arg_1);
         }
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:Gonatedog = null;
         if(_arg_1.keyCode == Keyboard.SPACE)
         {
            this.rygewuho.byrok();
         }
         for each(_local_2 in this.tibyguc)
         {
            _local_2.tabuduhy(_arg_1);
         }
      }
      
      private function hum() : void
      {
         if(this.waka)
         {
            display.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.waka = false;
         }
      }
      
      private function onMouseUp(_arg_1:MouseEvent) : void
      {
         this.hum();
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         this.lemy.close();
      }
      
      public function benos() : void
      {
         var _local_1:Stage = null;
         this.hum();
         if(this.vyv)
         {
            _local_1 = display;
            _local_1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _local_1.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _local_1.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.vyv = false;
         }
      }
      
      public function ficik() : void
      {
         var _local_1:Stage = null;
         if(!this.vyv)
         {
            _local_1 = display;
            _local_1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _local_1.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _local_1.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.vyv = true;
         }
      }
   }
}

