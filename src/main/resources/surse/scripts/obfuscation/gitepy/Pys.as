package obfuscation.gitepy
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.weapon.shaft.Byjujoqum;
   import alternativa.tanks.models.weapon.shaft.Dodaly;
   import alternativa.tanks.models.weapon.shaft.Hefad;
   import alternativa.tanks.models.weapon.shaft.Qyj;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.geom.Point;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Vaba;
   import obfuscation.zajun.Qiqa;
   
   public class Pys implements Boc
   {
      
      [Inject]
      public static var display:IDisplay;
      
      private var context:Pypoqa;
      
      private var weapon:Byjujoqum;
      
      private var vicasuza:int;
      
      private var kimi:Number;
      
      private var ranoc:Vector3;
      
      private var camera:GameCamera;
      
      private var skin:TankSkin;
      
      private var hiwu:int;
      
      private var vekir:Dodaly = new Dodaly();
      
      private var rabumupo:Dodaly = new Dodaly();
      
      private var silasos:Dodaly = new Dodaly();
      
      private var cypevoqyd:Dodaly = new Dodaly();
      
      private var rypekys:Dodaly = new Dodaly();
      
      private var rava:Quaternion;
      
      private var wijorypo:Quaternion;
      
      private var fodu:Quaternion;
      
      private var ralab:Vector3;
      
      private var sinesi:Vector3;
      
      private var loroninar:Matrix4 = new Matrix4();
      
      private var cojo:Matrix4 = new Matrix4();
      
      private var mipimy:Vector3 = new Vector3();
      
      private var cahosarih:Qiqa;
      
      private var myhop:Vaba;
      
      private var wijeju:Number;
      
      private var nywyv:WeaponPlatform;
      
      private var kivuqav:TankSpecification;
      
      public function Pys(_arg_1:Pypoqa, _arg_2:Byjujoqum, _arg_3:int, _arg_4:Number, _arg_5:Vector3, _arg_6:GameCamera, _arg_7:TankSkin, _arg_8:WeaponPlatform, _arg_9:Vaba, _arg_10:Qiqa, _arg_11:TankSpecification)
      {
         super();
         this.context = _arg_1;
         this.weapon = _arg_2;
         this.vicasuza = _arg_3;
         this.kimi = _arg_4;
         this.ranoc = _arg_5.clone();
         this.camera = _arg_6;
         this.skin = _arg_7;
         this.rava = new Quaternion();
         this.wijorypo = Quaternion.createFromAxisAngle(Vector3.X_AXIS,-Math.PI / 2);
         this.ralab = new Vector3();
         this.sinesi = new Vector3();
         this.fodu = new Quaternion();
         this.silasos.setInterval(0,1);
         this.myhop = _arg_9;
         this.cahosarih = _arg_10;
         this.nywyv = _arg_8;
         this.kivuqav = _arg_11;
      }
      
      public function enter(_arg_1:int) : void
      {
         this.nywyv.stopMovement();
         this.nywyv.finypa(true);
         this.wijeju = Rib(this.myhop.sowiq()).getTurnAcceleration();
         Rib(this.myhop.sowiq()).setTurnAcceleration(this.cahosarih.targetingAcceleration);
         Rib(this.myhop.sowiq()).setMaxTurnSpeed(this.cahosarih.roz * this.kivuqav.turretTurnAcceleration,false);
         this.context.niba = this.weapon.nase(_arg_1);
         this.hiwu = this.vicasuza;
         this.vekir.setInterval(this.skin.repijumu().alpha,0);
         this.rabumupo.setInterval(this.camera.fov,this.kimi);
         var _local_2:Point = new Point();
         var _local_3:Point = new Point();
         this.weapon.nisu(_local_2,_local_3);
         this.cypevoqyd.setInterval(_local_2.x,_local_3.x);
         this.rypekys.setInterval(_local_2.y,_local_3.y);
         this.weapon.soqymuce(0);
         this.weapon.lasywoci();
         this.weapon.cunaro(Hefad.DRAIN);
         this.fuvefy();
         this.myhop.bared();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
      }
      
      private function fuvefy() : void
      {
         var _local_1:Object3D = this.skin.qenokeru();
         this.cojo.setMatrix(_local_1.x,_local_1.y,_local_1.z,_local_1.rotationX,_local_1.rotationY,_local_1.rotationZ);
         this.loroninar.setMatrix(this.camera.x,this.camera.y,this.camera.z,this.camera.rotationX,this.camera.rotationY,this.camera.rotationZ);
         this.cojo.invert();
         this.loroninar.append(this.cojo);
         this.loroninar.getEulerAngles(this.mipimy);
         this.rava.setFromEulerAnglesXYZ(this.mipimy.x,this.mipimy.y,this.mipimy.z);
         this.loroninar.getAxis(3,this.ralab);
      }
      
      public function exit() : void
      {
         this.nywyv.finypa(false);
         Rib(this.myhop.sowiq()).setMaxTurnSpeed(this.kivuqav.turretRotationSpeed,true);
         Rib(this.myhop.sowiq()).setTurnAcceleration(this.wijeju);
         this.myhop.gudowel();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
      }
      
      private function likobadyb(_arg_1:FullScreenEvent) : void
      {
         this.weapon.rawa(Qyj.EXIT);
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.hiwu <= 0)
         {
            this.weapon.rawa(Qyj.SWITCH);
         }
         else
         {
            this.hiwu -= _arg_2;
            _local_3 = 1 - this.hiwu / this.vicasuza;
            if(_local_3 > 1)
            {
               _local_3 = 1;
            }
            this.weapon.joduken(this.cypevoqyd.interpolate(_local_3),this.rypekys.interpolate(_local_3));
            this.weapon.soqymuce(this.silasos.interpolate(_local_3));
            this.camera.fov = this.rabumupo.interpolate(_local_3);
            _local_4 = this.vekir.interpolate(_local_3);
            this.skin.setAlpha(_local_4);
            this.reqofe(_local_3);
         }
      }
      
      private function reqofe(_arg_1:Number) : void
      {
         this.sinesi.interpolate(_arg_1,this.ralab,this.ranoc);
         this.fodu.slerp(this.rava,this.wijorypo,_arg_1);
         this.fodu.toMatrix4(this.loroninar);
         this.loroninar.setPosition(this.sinesi);
         var _local_2:Object3D = this.skin.qenokeru();
         this.cojo.setMatrix(_local_2.x,_local_2.y,_local_2.z,_local_2.rotationX,_local_2.rotationY,_local_2.rotationZ);
         this.loroninar.append(this.cojo);
         this.loroninar.getEulerAngles(this.mipimy);
         this.camera.x = this.loroninar.m03;
         this.camera.y = this.loroninar.m13;
         this.camera.z = this.loroninar.m23;
         this.camera.rotationX = this.mipimy.x;
         this.camera.rotationY = this.mipimy.y;
         this.camera.rotationZ = this.mipimy.z;
      }
      
      public function rawa(_arg_1:Qyj, _arg_2:*) : void
      {
         switch(_arg_1)
         {
            case Qyj.TRIGGER_RELEASE:
               this.weapon.rawa(Qyj.TRIGGER_RELEASE,this.context.niba);
         }
      }
   }
}

