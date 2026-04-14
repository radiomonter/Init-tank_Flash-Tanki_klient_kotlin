package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.Dictionary;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class Hebesed
   {
      
      private static const nuc:int = Myw.WEAPON;
      
      private static const origin:Vector3 = new Vector3();
      
      private const movicyw:Vector3 = new Vector3();
      
      private const matrix:Matrix3 = new Matrix3();
      
      private const myzusedit:Matrix3 = new Matrix3();
      
      private const fawevotoj:RayHit = new RayHit();
      
      private const poz:Qytary = new Qytary();
      
      private const vukyke:Vector3 = new Vector3();
      
      private const vegenel:Vector3 = new Vector3();
      
      private var range:EncryptedNumber;
      
      private var vykefi:EncryptedNumber;
      
      private var gavime:int;
      
      private var huq:int;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var nad:Wil;
      
      private var piju:Dictionary;
      
      private var cereb:Dictionary;
      
      public function Hebesed(_arg_1:Number, _arg_2:Number, _arg_3:int, _arg_4:int, _arg_5:TanksCollisionDetector, _arg_6:Wil)
      {
         super();
         this.range = new EncryptedNumberImpl(_arg_1);
         this.vykefi = new EncryptedNumberImpl(0.5 * _arg_2);
         this.gavime = _arg_3;
         this.huq = _arg_4;
         this.collisionDetector = _arg_5;
         this.nad = _arg_6;
      }
      
      public function zimibyq(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Vector3, _arg_5:Vector3, _arg_6:Vector3, _arg_7:Vector.<Body>, _arg_8:Vector.<Number>, _arg_9:Vector.<Vector3>) : void
      {
         var _local_18:* = undefined;
         var _local_16:int = 0;
         var _local_17:int = 0;
         var _local_10:* = undefined;
         var _local_11:Number = NaN;
         this.poz.beji = _arg_1;
         this.piju = new Dictionary();
         this.cereb = new Dictionary();
         var _local_12:Number = _arg_3 * _arg_2;
         var _local_13:Number = _arg_2 - _local_12;
         if(this.collisionDetector.raycast(_arg_4,_arg_5,nuc,_arg_2,this.poz,this.fawevotoj) && this.fawevotoj.shape.body.tank == null)
         {
            return;
         }
         this.movicyw.copy(_arg_6);
         this.vegenel.copy(_arg_4).addScaled(_local_12,_arg_5);
         var _local_14:Number = this.range.getNumber() + _local_13;
         this.pyjuqe(this.vegenel,_arg_5,_local_14);
         this.myzusedit.fromAxisAngle(_arg_5,Math.PI / this.huq);
         var _local_15:Number = this.vykefi.getNumber() / this.gavime;
         while(_local_16 < this.huq)
         {
            this.dypelinin(this.vegenel,_arg_5,this.movicyw,_local_14,this.gavime,_local_15);
            this.dypelinin(this.vegenel,_arg_5,this.movicyw,_local_14,this.gavime,-_local_15);
            this.movicyw.transform3(this.myzusedit);
            _local_16++;
         }
         for(_local_18 in this.piju)
         {
            _arg_7[_local_17] = _local_18;
            _local_11 = this.piju[_local_18] - _local_13;
            if(_local_11 < 0)
            {
               _local_11 = 0;
            }
            _arg_8[_local_17] = _local_11;
            _arg_9[_local_17] = this.cereb[_local_18];
            _local_17++;
         }
         _arg_7.length = _local_17;
         _arg_8.length = _local_17;
         this.poz.beji = null;
         this.poz.gubetuv();
         this.piju = null;
      }
      
      private function dypelinin(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:int, _arg_6:Number) : void
      {
         var _local_8:int = 0;
         var _local_7:Number = 0;
         while(_local_8 < _arg_5)
         {
            _local_7 += _arg_6;
            this.matrix.fromAxisAngle(_arg_3,_local_7);
            this.matrix.transformVector(_arg_2,this.vukyke);
            this.pyjuqe(_arg_1,this.vukyke,_arg_4);
            _local_8++;
         }
      }
      
      private function pyjuqe(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         var _local_4:Body = null;
         var _local_5:Number = NaN;
         origin.copy(_arg_1);
         var _local_6:Number = 0;
         if(this.collisionDetector.raycast(origin,_arg_2,nuc,_arg_3,this.poz,this.fawevotoj))
         {
            _local_4 = this.fawevotoj.shape.body;
            if(_local_4.tank != null && !Zicoha.fyfujuwub(origin,this.fawevotoj.position))
            {
               origin.addScaled(this.fawevotoj.t,_arg_2);
               _local_6 += this.fawevotoj.t;
               if(this.nad.kesaj(_local_4))
               {
                  this.poz.qipulen(_local_4);
                  _local_5 = Number(this.piju[_local_4]);
                  if(isNaN(_local_5) || _local_5 > _local_6)
                  {
                     this.piju[_local_4] = _local_6;
                     this.cereb[_local_4] = this.fawevotoj.position.clone();
                  }
               }
               else
               {
                  this.poz.noryf(_local_4);
               }
            }
         }
         this.poz.kavyn();
      }
   }
}

