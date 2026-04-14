package obfuscation.jete
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.weapon.shared.Zowyrazoq;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import obfuscation.fudic.Hyfo;
   import obfuscation.kyre.Myw;
   import obfuscation.rofa.Jyj;
   
   public class Bawaz extends PooledObject implements GraphicEffect
   {
      
      private static const kylura:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const jugusa:int = 20;
      
      private static const myma:Number = 3;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private static const hiwanu:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const cipyqolo:Vector3 = new Vector3();
      
      private static const zylane:Vector3 = new Vector3();
      
      private static const cugu:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private var _range:Number;
      
      private var lizygy:Number;
      
      private var particleSpeed:Number;
      
      private var somip:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var sfxData:Hyte;
      
      private var collisionDetector:CollisionDetector;
      
      private var bywef:Vector.<Zowyrazoq> = new Vector.<Zowyrazoq>(jugusa);
      
      private var hyr:Number;
      
      private var sudi:Number;
      
      private var time:int;
      
      private var tavec:int;
      
      private var jidowerud:int;
      
      private var container:Scene3DContainer;
      
      private var dead:Boolean;
      
      private var qymoky:Myzokotyn;
      
      private var cupy:Body;
      
      private var zacykoki:Number;
      
      private var sowefeby:Number;
      
      private var newylodip:Number;
      
      private var zajacyzy:Number;
      
      public function Bawaz(_arg_1:Pool)
      {
         super(_arg_1);
         this.qymoky = new Myzokotyn();
      }
      
      public function init(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Vector3, _arg_6:Object3D, _arg_7:Hyte, _arg_8:CollisionDetector, _arg_9:Number, _arg_10:Number, _arg_11:Number, _arg_12:Number, _arg_13:Number, _arg_14:Number) : void
      {
         this.cupy = _arg_1;
         this._range = _arg_2;
         this.lizygy = Math.tan(0.5 * _arg_3);
         this.particleSpeed = _arg_4;
         this.somip.copy(_arg_5);
         this.turret = _arg_6;
         this.sfxData = _arg_7;
         this.collisionDetector = _arg_8;
         this.zacykoki = _arg_11;
         this.sowefeby = _arg_12;
         this.newylodip = _arg_13;
         this.zajacyzy = _arg_14;
         this.qymoky.resize(_arg_9,_arg_10);
         this.hyr = 2 * (_arg_12 - _arg_11) / _arg_2;
         this.sudi = 1000 * _arg_2 / (jugusa * _arg_4);
         this.jidowerud = 0;
         this.time = this.tavec = getTimer();
         this.vuco(_arg_7);
         this.dead = false;
      }
      
      private function vuco(_arg_1:Hyte) : void
      {
         var _local_2:Hyfo = null;
         var _local_3:ColorTransform = null;
         this.qymoky.init(_arg_1.goqibubun);
         if(_arg_1.nebogyfu != null)
         {
            _local_2 = _arg_1.nebogyfu[0];
            _local_3 = this.qymoky.colorTransform == null ? new ColorTransform() : this.qymoky.colorTransform;
            _local_3.alphaMultiplier = _local_2.alphaMultiplier;
            _local_3.alphaOffset = _local_2.alphaOffset;
            _local_3.redMultiplier = _local_2.redMultiplier;
            _local_3.redOffset = _local_2.redOffset;
            _local_3.greenMultiplier = _local_2.greenMultiplier;
            _local_3.greenOffset = _local_2.greenOffset;
            _local_3.blueMultiplier = _local_2.blueMultiplier;
            _local_3.blueOffset = _local_2.blueOffset;
            this.qymoky.colorTransform = _local_3;
         }
         else
         {
            this.qymoky.colorTransform = null;
         }
      }
      
      public function destroy() : void
      {
         while(this.jidowerud > 0)
         {
            this.pydyh(0);
         }
         this.container.removeChild(this.qymoky);
         this.qymoky.clear();
         this.container = null;
         this.cupy = null;
         this.turret = null;
         this.sfxData = null;
         this.collisionDetector = null;
         recycle();
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_4:Zowyrazoq = null;
         var _local_5:Vector3 = null;
         var _local_7:int = 0;
         var _local_3:Number = NaN;
         var _local_6:Number = NaN;
         this.nop();
         _local_3 = _arg_1 / kylura.getInt();
         if(this.collisionDetector.raycastStatic(hiwanu,direction,Myw.dyhan,this.somip.y + this.qymoky.length,null,intersection))
         {
            this.qymoky.visible = false;
         }
         else
         {
            this.qymoky.visible = true;
            this.qymoky.update(_local_3,this.sfxData.goqibubun.fps);
            Jyj.moruqogi(this.qymoky,cugu,direction,_arg_2.position);
         }
         if(!this.dead && this.jidowerud < jugusa && this.time >= this.tavec)
         {
            this.tavec += this.sudi;
            this.difymyte();
         }
         while(_local_7 < this.jidowerud)
         {
            _local_4 = this.bywef[_local_7];
            zylane.x = _local_4.x;
            zylane.y = _local_4.y;
            zylane.z = _local_4.z;
            if(_local_4.mecuhyje > this._range || this.collisionDetector.raycastStatic(zylane,_local_4.velocity,Myw.WEAPON,_local_3,null,intersection))
            {
               this.pydyh(_local_7--);
            }
            else
            {
               _local_5 = _local_4.velocity;
               _local_4.x += _local_5.x * _local_3;
               _local_4.y += _local_5.y * _local_3;
               _local_4.z += _local_5.z * _local_3;
               _local_4.mecuhyje += this.particleSpeed * _local_3;
               _local_4.rotation += myma * _local_3 * _local_4.gerydero;
               _local_4.kiba(_local_4.tepe);
               _local_4.tepe += this.sfxData.qyg.fps * _local_3;
               _local_6 = this.zacykoki + this.hyr * _local_4.mecuhyje;
               if(_local_6 > this.sowefeby)
               {
                  _local_6 = this.sowefeby;
               }
               _local_4.width = _local_6;
               _local_4.height = _local_6;
               _local_4.cobiqazev(this._range,this.sfxData.vazygu);
            }
            _local_7++;
         }
         this.time += _arg_1;
         return !this.dead || this.jidowerud > 0;
      }
      
      public function kill() : void
      {
         if(!this.dead)
         {
            this.dead = true;
            this.container.removeChild(this.qymoky);
         }
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.qymoky);
      }
      
      private function nop() : void
      {
         var _local_1:Number = NaN;
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cipyqolo.x = cojo.m00;
         cipyqolo.y = cojo.m10;
         cipyqolo.z = cojo.m20;
         direction.x = cojo.m01;
         direction.y = cojo.m11;
         direction.z = cojo.m21;
         cojo.transformVector(this.somip,cugu);
         _local_1 = this.somip.y;
         hiwanu.x = cugu.x - _local_1 * direction.x;
         hiwanu.y = cugu.y - _local_1 * direction.y;
         hiwanu.z = cugu.z - _local_1 * direction.z;
      }
      
      private function difymyte() : void
      {
         var _local_1:Number = this.newylodip + Math.random() * this.zajacyzy;
         if(!this.qymoky.visible && intersection.t < this.somip.y + _local_1)
         {
            return;
         }
         var _local_2:Zowyrazoq = Zowyrazoq.wobagemyq();
         _local_2.vuhi(this.sfxData.qyg);
         _local_2.rotation = Math.random() * Math.PI * 2;
         _local_2.tepe = Math.random() * _local_2.getNumFrames();
         this.zaqijyn(direction);
         _local_2.velocity.x = this.particleSpeed * direction.x;
         _local_2.velocity.y = this.particleSpeed * direction.y;
         _local_2.velocity.z = this.particleSpeed * direction.z;
         _local_2.velocity.add(this.cupy.state.velocity);
         _local_2.mecuhyje = _local_1;
         _local_2.x = cugu.x + _local_1 * direction.x;
         _local_2.y = cugu.y + _local_1 * direction.y;
         _local_2.z = cugu.z + _local_1 * direction.z;
         _local_2.gerydero = Math.random() < 0.5 ? int(1) : int(-1);
         var _local_3:* = this.jidowerud++;
         this.bywef[_local_3] = _local_2;
         this.container.addChild(_local_2);
      }
      
      private function pydyh(_arg_1:int) : void
      {
         var _local_2:Zowyrazoq = this.bywef[_arg_1];
         this.bywef[_arg_1] = this.bywef[--this.jidowerud];
         this.bywef[this.jidowerud] = null;
         this.container.removeChild(_local_2);
         _local_2.dispose();
      }
      
      private function zaqijyn(_arg_1:Vector3) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = 2 * Math.PI * Math.random();
         matrix.fromAxisAngle(_arg_1,_local_3);
         cipyqolo.transform3(matrix);
         _local_2 = this._range * this.lizygy * Math.random();
         _arg_1.x = _arg_1.x * this._range + cipyqolo.x * _local_2;
         _arg_1.y = _arg_1.y * this._range + cipyqolo.y * _local_2;
         _arg_1.z = _arg_1.z * this._range + cipyqolo.z * _local_2;
         _arg_1.normalize();
      }
      
      public function get jeryw() : Vector.<Zowyrazoq>
      {
         return this.bywef;
      }
      
      public function get qat() : int
      {
         return this.jidowerud;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
   }
}

