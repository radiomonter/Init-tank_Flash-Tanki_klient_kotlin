package obfuscation.jihadufef
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.FillMaterial;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.display.BlendMode;
   
   public class Bicyjawyf extends PooledObject implements GraphicEffect
   {
      
      public static const midabufa:Number = 120;
      
      private static const huwedimym:Number = 99.75;
      
      private static const gusah:Number = 79.5;
      
      private static const hujoquly:Number = 500;
      
      private static const panycatuw:Number = 1000;
      
      private static const lyto:Number = 1500;
      
      private static const bere:Number = 1500;
      
      private static const metinuroh:Number = 2500;
      
      private static const cuvevi:Number = 1300;
      
      private static const gujib:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const men:FillMaterial = new FillMaterial(4294753806);
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const wydyluhe:Matrix3 = new Matrix3();
      
      private static const qotybu:Matrix3 = new Matrix3();
      
      private var turret:Object3D;
      
      private var vas:Vector3;
      
      private var zejeqedy:Sprite3D;
      
      private var qamo:Sprite3D;
      
      private var qugepihyr:Sprite3D;
      
      private var felygovul:Cuzemoje;
      
      private var fylumun:Cuzemoje;
      
      private var haz:Cuzemoje;
      
      private var wagaf:Number = 40;
      
      private var foj:Number = 75;
      
      private var wyvafiw:Number = 80;
      
      private var lec:Number = 0;
      
      private var furekuvow:Number = 0;
      
      private var popu:Number = 0;
      
      private var vafewuvu:Number;
      
      private var sibuc:Number;
      
      private var hew:Number;
      
      private var taqa:int;
      
      private var container:Scene3DContainer;
      
      public function Bicyjawyf(_arg_1:Pool)
      {
         super(_arg_1);
         this.buhala();
      }
      
      private static function vibopi(_arg_1:Mesh, _arg_2:Number, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Number, _arg_6:Number, _arg_7:Number) : void
      {
         wydyluhe.fromAxisAngle(Vector3.Y_AXIS,_arg_2);
         if(_arg_4.y < -0.99999 || _arg_4.y > 0.99999)
         {
            axis.x = 0;
            axis.y = 0;
            axis.z = 1;
            _arg_2 = _arg_4.y < 0 ? Number(Math.PI) : Number(0);
         }
         else
         {
            axis.x = _arg_4.z;
            axis.y = 0;
            axis.z = -_arg_4.x;
            axis.normalize();
            _arg_2 = Math.acos(_arg_4.y);
         }
         qotybu.fromAxisAngle(axis,_arg_2);
         wydyluhe.append(qotybu);
         wydyluhe.getEulerAngles(eulerAngles);
         _arg_1.rotationX = eulerAngles.x;
         _arg_1.rotationY = eulerAngles.y;
         _arg_1.rotationZ = eulerAngles.z;
         _arg_1.x = _arg_3.x + _arg_4.x * _arg_5 + _arg_6 * wydyluhe.m00 + _arg_7 * wydyluhe.m02;
         _arg_1.y = _arg_3.y + _arg_4.y * _arg_5 + _arg_6 * wydyluhe.m10 + _arg_7 * wydyluhe.m12;
         _arg_1.z = _arg_3.z + _arg_4.z * _arg_5 + _arg_6 * wydyluhe.m20 + _arg_7 * wydyluhe.m22;
      }
      
      private static function zilyqo(_arg_1:Number) : Sprite3D
      {
         var _local_2:Sprite3D = null;
         _local_2 = new Sprite3D(_arg_1,_arg_1);
         _local_2.rotation = 2 * Math.PI * Math.random();
         _local_2.blendMode = BlendMode.SCREEN;
         _local_2.useShadowMap = false;
         _local_2.useLight = false;
         return _local_2;
      }
      
      private static function caqala(_arg_1:Sprite3D, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number) : void
      {
         _arg_1.x = _arg_2.x + _arg_3.x * _arg_4;
         _arg_1.y = _arg_2.y + _arg_3.y * _arg_4;
         _arg_1.z = _arg_2.z + _arg_3.z * _arg_4;
      }
      
      public function init(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Material) : void
      {
         this.turret = _arg_1;
         this.vas = _arg_2;
         this.zejeqedy.material = _arg_3;
         this.qamo.material = _arg_3;
         this.qugepihyr.material = _arg_3;
         this.taqa = 50;
         this.wagaf = 40;
         this.foj = 75;
         this.wyvafiw = 80;
         this.lec = 0;
         this.furekuvow = 0;
         this.popu = 0;
         this.vafewuvu = Math.random() * 2 * Math.PI;
         this.sibuc = Math.random() * 2 * Math.PI;
         this.hew = Math.random() * 2 * Math.PI;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.zejeqedy);
         _arg_1.addChild(this.qamo);
         _arg_1.addChild(this.qugepihyr);
         _arg_1.addChild(this.felygovul);
         _arg_1.addChild(this.fylumun);
         _arg_1.addChild(this.haz);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.taqa < 0)
         {
            return false;
         }
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cojo.transformVector(this.vas,gujib);
         direction.x = cojo.m01;
         direction.y = cojo.m11;
         direction.z = cojo.m21;
         var _local_3:Number = 0.001 * _arg_1;
         this.lec += _local_3 * bere;
         this.furekuvow += _local_3 * metinuroh;
         this.popu += _local_3 * cuvevi;
         caqala(this.zejeqedy,gujib,direction,this.wagaf);
         caqala(this.qamo,gujib,direction,this.foj);
         caqala(this.qugepihyr,gujib,direction,this.wyvafiw);
         vibopi(this.felygovul,this.vafewuvu,gujib,direction,this.lec,0,10);
         vibopi(this.fylumun,this.sibuc,gujib,direction,this.furekuvow,-7,0);
         vibopi(this.haz,this.hew,gujib,direction,this.popu,7,0);
         this.wagaf += _local_3 * hujoquly;
         this.foj += _local_3 * panycatuw;
         this.wyvafiw += _local_3 * lyto;
         this.taqa -= _arg_1;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.zejeqedy);
         this.container.removeChild(this.qamo);
         this.container.removeChild(this.qugepihyr);
         this.container.removeChild(this.felygovul);
         this.container.removeChild(this.haz);
         this.container.removeChild(this.fylumun);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.taqa = -1;
      }
      
      private function buhala() : void
      {
         this.zejeqedy = zilyqo(midabufa);
         this.qamo = zilyqo(huwedimym);
         this.qugepihyr = zilyqo(gusah);
         this.felygovul = new Cuzemoje(0.8,men);
         this.fylumun = new Cuzemoje(0.75,men);
         this.haz = new Cuzemoje(0.82,men);
      }
   }
}

