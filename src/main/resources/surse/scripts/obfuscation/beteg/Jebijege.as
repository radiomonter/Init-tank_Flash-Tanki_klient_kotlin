package obfuscation.beteg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.rofa.Jyj;
   
   public class Jebijege extends PooledObject implements GraphicEffect
   {
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const jujajido:Matrix4 = new Matrix4();
      
      private static const dib:Vector3 = new Vector3();
      
      private static const ryquwu:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const sinesi:Vector3 = new Vector3();
      
      private static const vuga:Number = 0.1;
      
      private static const tajano:Number = 100;
      
      private var container:Scene3DContainer;
      
      private var hadi:Haqutuf;
      
      private var hyduqypi:AnimatedSprite3D;
      
      private var sowabepe:AnimatedSprite3D;
      
      private var turret:Object3D;
      
      private var tovy:Vector3 = new Vector3();
      
      private var jus:Object3D;
      
      private var mitiryku:Number = 0;
      
      private var show:Boolean;
      
      private var dead:Boolean;
      
      private var time:int;
      
      private var mode:Gypuza;
      
      private var sfxData:Tany;
      
      private var hitPoint:Vector3 = new Vector3();
      
      private var syk:Vector3 = new Vector3();
      
      private var targetPoint:Vector3 = new Vector3();
      
      private var wujaz:Number;
      
      private var vuqat:Boolean;
      
      private var isLocal:Boolean;
      
      public function Jebijege(_arg_1:Pool)
      {
         super(_arg_1);
         this.hadi = new Haqutuf();
         this.hadi.init(Tolife.jino,100);
         this.hyduqypi = new AnimatedSprite3D(Tolife.laji,Tolife.laji);
         this.sowabepe = new AnimatedSprite3D(Tolife.catupeqo,Tolife.catupeqo);
         this.sowabepe.originY = 0.5;
      }
      
      public function musi(_arg_1:Tany, _arg_2:Object3D, _arg_3:Vector3) : void
      {
         this.isLocal = true;
         this.init(_arg_1,_arg_2,_arg_3);
      }
      
      public function gizahenyh(_arg_1:Tany, _arg_2:Object3D, _arg_3:Vector3) : void
      {
         this.isLocal = false;
         this.init(_arg_1,_arg_2,_arg_3);
      }
      
      public function zawymi(_arg_1:Gypuza, _arg_2:Object3D = null, _arg_3:Vector3 = null) : void
      {
         var _local_4:Number = NaN;
         this.vuqat = false;
         if(_arg_2 != null)
         {
            if(this.jus == _arg_2)
            {
               if(this.isLocal && this.targetPoint != null)
               {
                  this.syk.copy(this.targetPoint);
               }
               else
               {
                  this.syk.copy(this.hitPoint);
               }
               _local_4 = this.syk.distanceToSquared(_arg_3);
               if(_local_4 > tajano)
               {
                  this.vuqat = true;
                  this.wujaz = 0;
               }
            }
            this.hitPoint.copy(_arg_3);
         }
         if(this.mode != _arg_1 || this.jus != _arg_2)
         {
            this.jus = _arg_2;
            this.mode = _arg_1;
            switch(_arg_1)
            {
               case Gypuza.IDLE:
                  this.lezop();
                  break;
               case Gypuza.HEALING:
                  this.pypebu();
                  break;
               case Gypuza.DAMAGING:
                  this.fuvydavu();
            }
            this.mitiryku = 0;
         }
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.show)
         {
            this.mitiryku += Tolife.hoh * _arg_1 / 1000;
            if(this.mitiryku > 1)
            {
               this.mitiryku = 1;
            }
         }
         else
         {
            this.mitiryku -= Tolife.hoh * _arg_1 / 1000;
            if(this.mitiryku <= 0)
            {
               if(this.dead)
               {
                  return false;
               }
            }
         }
         this.updateVisibility();
         this.time += _arg_1;
         var _local_3:int = this.pufak();
         if(this.mode == Gypuza.DAMAGING || this.mode == Gypuza.HEALING)
         {
            this.hanad();
            this.vav(_arg_2,_arg_1,_local_3);
         }
         return true;
      }
      
      private function init(_arg_1:Tany, _arg_2:Object3D, _arg_3:Vector3) : void
      {
         this.sfxData = _arg_1;
         this.turret = _arg_2;
         this.tovy.copy(_arg_3);
         this.mode = Gypuza.OFF;
         this.mitiryku = 0;
         this.show = true;
         this.dead = false;
         this.time = 0;
         this.updateVisibility();
      }
      
      private function hanad() : void
      {
         if(this.targetPoint == null)
         {
            this.targetPoint = new Vector3();
         }
         if(this.vuqat)
         {
            this.qodib();
         }
         else
         {
            this.targetPoint.copy(this.hitPoint);
         }
      }
      
      private function pufak() : int
      {
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cojo.transformVector(this.tovy,ryquwu);
         this.hyduqypi.x = ryquwu.x;
         this.hyduqypi.y = ryquwu.y;
         this.hyduqypi.z = ryquwu.z;
         var _local_1:int = int(this.hyduqypi.tabu() * this.time / 1000);
         this.hyduqypi.kiba(_local_1);
         return _local_1;
      }
      
      private function qodib() : void
      {
         this.wujaz += vuga;
         if(this.wujaz >= 1)
         {
            this.wujaz = 1;
            this.vuqat = false;
         }
         Vector3.interpolate(this.wujaz,this.syk,this.hitPoint,this.targetPoint);
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.hadi);
         this.hadi.setMaterialToAllFaces(null);
         this.container.removeChild(this.sowabepe);
         this.sowabepe.clear();
         this.container.removeChild(this.hyduqypi);
         this.hyduqypi.clear();
         this.container = null;
         this.sfxData = null;
         this.turret = null;
         this.jus = null;
         this.targetPoint = null;
         recycle();
      }
      
      public function stop() : void
      {
         this.dead = true;
         this.show = false;
      }
      
      public function kill() : void
      {
         this.dead = true;
         this.show = false;
         this.mitiryku = 0;
      }
      
      private function vav(_arg_1:GameCamera, _arg_2:int, _arg_3:int) : void
      {
         this.sowabepe.kiba(_arg_3);
         jujajido.setMatrix(this.jus.x,this.jus.y,this.jus.z,this.jus.rotationX,this.jus.rotationY,this.jus.rotationZ);
         jujajido.transformVector(this.targetPoint,dib);
         direction.diff(dib,ryquwu);
         var _local_4:Number = direction.length() - Tolife.cafuge;
         if(_local_4 < 0)
         {
            _local_4 = 10;
         }
         this.hadi.update(_arg_2,_local_4);
         direction.normalize();
         dib.x = ryquwu.x + _local_4 * direction.x;
         dib.y = ryquwu.y + _local_4 * direction.y;
         dib.z = ryquwu.z + _local_4 * direction.z;
         this.sowabepe.x = dib.x;
         this.sowabepe.y = dib.y;
         this.sowabepe.z = dib.z;
         sinesi.x = _arg_1.x;
         sinesi.y = _arg_1.y;
         sinesi.z = _arg_1.z;
         Jyj.moruqogi(this.hadi,ryquwu,direction,sinesi);
      }
      
      private function updateVisibility() : void
      {
         this.hadi.alpha = this.mitiryku;
         this.hyduqypi.alpha = this.mitiryku;
         this.sowabepe.alpha = this.mitiryku;
         var _local_1:Number = Tolife.nyrifumu + (1 - Tolife.nyrifumu) * this.mitiryku;
         this.hadi.scaleX = _local_1;
         this.hyduqypi.scaleX = _local_1;
         this.hyduqypi.scaleY = _local_1;
         this.hyduqypi.scaleZ = _local_1;
         this.sowabepe.scaleX = _local_1;
         this.sowabepe.scaleY = _local_1;
         this.sowabepe.scaleZ = _local_1;
      }
      
      private function hide() : void
      {
         this.show = false;
      }
      
      private function lezop() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.hadi);
            this.container.removeChild(this.sowabepe);
            this.container.addChild(this.hyduqypi);
            this.hyduqypi.vuhi(this.sfxData.pihiru);
            this.hyduqypi.kiba(0);
         }
      }
      
      private function pypebu() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.hyduqypi);
            this.container.addChild(this.hadi);
            this.container.addChild(this.sowabepe);
            this.hadi.nobozin(this.sfxData.rukycodyt,1);
            this.hyduqypi.vuhi(this.sfxData.doko);
            this.hyduqypi.kiba(0);
            this.sowabepe.vuhi(this.sfxData.bamigifor);
            this.sowabepe.kiba(0);
         }
      }
      
      private function fuvydavu() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.hyduqypi);
            this.container.addChild(this.hadi);
            this.container.addChild(this.sowabepe);
            this.hadi.nobozin(this.sfxData.hijej,-1);
            this.hyduqypi.vuhi(this.sfxData.wabo);
            this.hyduqypi.kiba(0);
            this.sowabepe.vuhi(this.sfxData.qyzy);
            this.sowabepe.kiba(0);
         }
      }
   }
}

