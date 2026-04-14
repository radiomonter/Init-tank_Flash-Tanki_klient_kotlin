package obfuscation.zuhelo
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Cokunuf;
   import alternativa.tanks.battle.objects.tank.Nun;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class Havyra
   {
      
      private static const jen:Number = 400;
      
      private static const movicyw:Vector3 = new Vector3();
      
      private static const kyjewa:Vector3 = new Vector3();
      
      private static const rude:Vector3 = new Vector3();
      
      private static const wigo:Vector3 = new Vector3();
      
      private static const kopelazo:Vector3 = new Vector3();
      
      private static const _relativeVelocity:Vector3 = new Vector3();
      
      private static const nygyg:Vector3 = new Vector3();
      
      private static const rila:Vector3 = new Vector3();
      
      private static const rafen:Vector3 = new Vector3();
      
      private const habaja:EncryptedNumber = new EncryptedNumberImpl();
      
      private const nysec:EncryptedNumber = new EncryptedNumberImpl();
      
      private const dyhi:EncryptedNumber = new EncryptedNumberImpl();
      
      private const hodylaqi:EncryptedNumber = new EncryptedNumberImpl();
      
      private const riwiq:EncryptedNumber = new EncryptedNumberImpl();
      
      private var body:Body;
      
      private var keqadu:Karysud;
      
      private var videdohy:Cokunuf;
      
      public var nyleqez:Halibukyd;
      
      public var wezyqiji:Halibukyd;
      
      public var pojiv:Boolean;
      
      public var kivawuk:int;
      
      public var zymunufyr:int;
      
      public var gazop:Boolean;
      
      public function Havyra(_arg_1:Body, _arg_2:Karysud, _arg_3:Cokunuf, _arg_4:Vector3)
      {
         super();
         this.body = _arg_1;
         this.keqadu = _arg_2;
         this.videdohy = _arg_3;
         this.pymubyt(Nun.pehehi,_arg_4);
      }
      
      private function pymubyt(_arg_1:int, _arg_2:Vector3) : void
      {
         var _local_3:Number = _arg_2.y * 0.8;
         var _local_4:Number = _arg_2.x - 40;
         this.nyleqez = new Halibukyd(this.body,_arg_1,new Vector3(-0.5 * _local_4,0,-0.5 * _arg_2.z + Nun.nicukuro),_local_3,this.keqadu,-1);
         this.wezyqiji = new Halibukyd(this.body,_arg_1,new Vector3(0.5 * _local_4,0,-0.5 * _arg_2.z + Nun.nicukuro),_local_3,this.keqadu,1);
      }
      
      public function seduq(_arg_1:Number) : void
      {
         this.habaja.setNumber(_arg_1);
      }
      
      public function nerawub(_arg_1:Number) : void
      {
         this.nysec.setNumber(_arg_1);
      }
      
      public function tuqetok(_arg_1:Number) : void
      {
         this.dyhi.setNumber(_arg_1);
      }
      
      public function setTurnAcceleration(_arg_1:Number) : void
      {
         this.hodylaqi.setNumber(_arg_1);
      }
      
      public function gimefapew(_arg_1:Number) : void
      {
         this.riwiq.setNumber(_arg_1);
      }
      
      public function domu() : Number
      {
         return this.habaja.getNumber();
      }
      
      public function labujet() : int
      {
         return !this.pojiv ? int(this.kivawuk) : int(0);
      }
      
      public function tynajiz() : int
      {
         return !this.pojiv ? int(this.zymunufyr) : int(0);
      }
      
      public function rugikev(_arg_1:int) : void
      {
         this.nyleqez.vusany(_arg_1);
         this.wezyqiji.vusany(_arg_1);
      }
      
      public function applyForces(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.juwina();
         this.lejokohyr(_arg_3);
         this.tel(_arg_1,_arg_2,_arg_3);
         this.munav();
      }
      
      private function juwina() : void
      {
         var _local_1:Number = this.body.scene.gravity.length() * this.body.mass;
         this.keqadu.zur = _local_1 / (2 * Nun.pehehi * (this.keqadu.qagipi - this.keqadu.hopatyf));
      }
      
      private function lejokohyr(_arg_1:Number) : void
      {
         this.nyleqez.lejokohyr(_arg_1);
         this.wezyqiji.lejokohyr(_arg_1);
      }
      
      private function tel(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         if(this.nyleqez.legugequp + this.wezyqiji.legugequp > 0)
         {
            this.zujyj(_arg_1,_arg_2,_arg_3);
         }
      }
      
      private function zujyj(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         var _local_4:Vector3 = null;
         var _local_5:Vector3 = null;
         var _local_6:Matrix3 = null;
         var _local_15:int = 0;
         var _local_20:int = 0;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Number = NaN;
         var _local_13:Number = NaN;
         var _local_14:Number = NaN;
         var _local_16:Number = NaN;
         var _local_17:Number = NaN;
         var _local_18:Number = NaN;
         var _local_19:Number = NaN;
         var _local_21:Number = NaN;
         var _local_22:Number = NaN;
         var _local_23:Number = NaN;
         var _local_24:int = !this.pojiv ? int(this.kivawuk) : int(0);
         var _local_25:int = !this.pojiv ? int(this.zymunufyr) : int(0);
         _local_4 = this.body.state.velocity;
         _local_5 = this.body.state.angularVelocity;
         _local_6 = this.body.baseMatrix;
         movicyw.x = _local_6.m00;
         movicyw.y = _local_6.m10;
         movicyw.z = _local_6.m20;
         kyjewa.x = _local_6.m01;
         kyjewa.y = _local_6.m11;
         kyjewa.z = _local_6.m21;
         rude.x = _local_6.m02;
         rude.y = _local_6.m12;
         rude.z = _local_6.m22;
         _local_7 = 1;
         var _local_26:Number = Math.PI / 4;
         var _local_27:Number = Nun.nohowozen;
         if(rude.z < Math.cos(_local_26))
         {
            if(rude.z < Math.cos(_local_27))
            {
               _local_7 = 0;
            }
            else
            {
               _local_7 = (_local_27 - Math.acos(rude.z)) / (_local_27 - _local_26);
            }
         }
         this.memuwabyc(wigo,kopelazo);
         _relativeVelocity.x = _local_4.x - wigo.x;
         _relativeVelocity.y = _local_4.y - wigo.y;
         _relativeVelocity.z = _local_4.z - wigo.z;
         nygyg.x = _local_5.x - kopelazo.x;
         nygyg.y = _local_5.y - kopelazo.y;
         nygyg.z = _local_5.z - kopelazo.z;
         var _local_28:Number = _relativeVelocity.x * kyjewa.x + _relativeVelocity.y * kyjewa.y + _relativeVelocity.z * kyjewa.z;
         var _local_29:Number = nygyg.x * rude.x + nygyg.y * rude.y + nygyg.z * rude.z;
         var _local_30:Number = _relativeVelocity.x * movicyw.x + _relativeVelocity.y * movicyw.y + _relativeVelocity.z * movicyw.z;
         var _local_31:Number = this.dyhi.getNumber() * _local_7 * _arg_3;
         if(_local_30 < 0)
         {
            if(_local_31 > -_local_30)
            {
               _local_30 = 0;
            }
            else
            {
               _local_30 += _local_31;
            }
         }
         else if(_local_30 > 0)
         {
            if(_local_31 > _local_30)
            {
               _local_30 = 0;
            }
            else
            {
               _local_30 -= _local_31;
            }
         }
         _relativeVelocity.setLengthAlongDirection(movicyw,_local_30);
         _local_4.x = wigo.x + _relativeVelocity.x;
         _local_4.y = wigo.y + _relativeVelocity.y;
         _local_4.z = wigo.z + _relativeVelocity.z;
         var _local_32:int = this.nyleqez.legugequp;
         var _local_33:int = this.wezyqiji.legugequp;
         var _local_34:Number = this.habaja.getNumber();
         var _local_35:Number = this.hodylaqi.getNumber();
         if(_local_32 > 0 || _local_33 > 0)
         {
            _local_8 = 0;
            if(_local_24 == 0)
            {
               _local_8 = -MathUtils.sign(_local_28) * _local_34 * _arg_3;
               if(MathUtils.sign(_local_28) != MathUtils.sign(_local_28 + _local_8))
               {
                  _local_8 = -_local_28;
               }
            }
            else
            {
               if(MathUtils.sign(_local_28) * MathUtils.sign(_local_24) < 0)
               {
                  _local_34 = this.nysec.getNumber();
               }
               _local_8 = _local_24 * _local_34 * _arg_3;
            }
            _local_9 = MathUtils.clamp(_local_28 + _local_8,-_arg_1,_arg_1);
            _local_10 = _local_9 - _local_28;
            _local_11 = 1;
            _local_12 = MathUtils.clamp(1 - Math.abs(_local_28 / _arg_1),0,1);
            if(_local_12 < _local_11 && _local_24 * MathUtils.sign(_local_28) > 0)
            {
               _local_10 *= _local_12 / _local_11;
            }
            _local_13 = _local_10 / _arg_3;
            if(Math.abs(_local_13) < jen && Math.abs(_local_9) > 0.5 * this.videdohy.vur())
            {
               _local_13 = MathUtils.numberSign(_local_13,0.1) * jen;
            }
            _local_14 = _local_13 * this.body.mass;
            _local_15 = _local_32 + _local_33;
            _local_16 = _local_14 * (_local_15 + 0.21 * (20 - _local_15)) / 10;
            _local_17 = _local_16 / _local_15;
            _local_18 = Math.PI / 4;
            _local_19 = Math.PI / 3;
            _local_20 = 0;
            while(_local_20 < Nun.pehehi)
            {
               this.cejigof(this.nyleqez.racycac[_local_20],kyjewa,_local_17,_local_19,_local_18);
               this.cejigof(this.wezyqiji.racycac[_local_20],kyjewa,_local_17,_local_19,_local_18);
               _local_20++;
            }
            _local_21 = 1;
            if(_local_32 == 0 || _local_33 == 0)
            {
               _local_21 = 0.5;
            }
            _local_22 = 0;
            if(_local_25 == 0)
            {
               _local_22 = -MathUtils.sign(_local_29) * _local_35 * _local_7 * _arg_3;
               if(MathUtils.sign(_local_29) != MathUtils.sign(_local_29 + _local_22))
               {
                  _local_22 = -_local_29;
               }
            }
            else
            {
               if(this.naj(_local_25,_local_29,_local_24,this.gazop))
               {
                  _local_35 = this.riwiq.getNumber();
               }
               _local_22 = _local_25 * _local_35 * _local_7 * _arg_3;
               if(_local_24 == -1 && this.gazop)
               {
                  _local_22 = -_local_22;
               }
            }
            _local_23 = MathUtils.clamp(_local_29 + _local_22,-_arg_2 * _local_21,_arg_2 * _local_21);
            nygyg.setLengthAlongDirection(rude,_local_23);
            _local_5.x = kopelazo.x + nygyg.x;
            _local_5.y = kopelazo.y + nygyg.y;
            _local_5.z = kopelazo.z + nygyg.z;
         }
      }
      
      private function naj(_arg_1:int, _arg_2:Number, _arg_3:int, _arg_4:Boolean) : Boolean
      {
         var _local_5:int = _arg_4 && _arg_3 < 0 ? int(-1) : int(1);
         return _arg_1 * _arg_2 * _local_5 < 0;
      }
      
      private function memuwabyc(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_4:Tezy = null;
         var _local_5:int = 0;
         var _local_6:Vector3 = null;
         var _local_3:Number = NaN;
         _local_3 = 1 / (this.nyleqez.legugequp + this.wezyqiji.legugequp);
         var _local_7:Number = 0;
         var _local_8:Number = 0;
         var _local_9:Number = 0;
         _local_5 = 0;
         while(_local_5 < Nun.pehehi)
         {
            _local_4 = this.nyleqez.racycac[_local_5];
            if(_local_4.hydatiwu)
            {
               _local_6 = _local_4.fawevotoj.position;
               _local_7 += _local_6.x;
               _local_8 += _local_6.y;
               _local_9 += _local_6.z;
            }
            _local_4 = this.wezyqiji.racycac[_local_5];
            if(_local_4.hydatiwu)
            {
               _local_6 = _local_4.fawevotoj.position;
               _local_7 += _local_6.x;
               _local_8 += _local_6.y;
               _local_9 += _local_6.z;
            }
            _local_5++;
         }
         _local_7 *= _local_3;
         _local_8 *= _local_3;
         _local_9 *= _local_3;
         rafen.x = _local_7;
         rafen.y = _local_8;
         rafen.z = _local_9;
         _arg_1.x = 0;
         _arg_1.y = 0;
         _arg_1.z = 0;
         _arg_2.x = 0;
         _arg_2.y = 0;
         _arg_2.z = 0;
         _local_5 = 0;
         while(_local_5 < Nun.pehehi)
         {
            this.zypoca(this.nyleqez.racycac[_local_5],rafen,_arg_1,_arg_2);
            this.zypoca(this.wezyqiji.racycac[_local_5],rafen,_arg_1,_arg_2);
            _local_5++;
         }
         _arg_1.x *= _local_3;
         _arg_1.y *= _local_3;
         _arg_1.z *= _local_3;
         _arg_2.x *= _local_3;
         _arg_2.y *= _local_3;
         _arg_2.z *= _local_3;
      }
      
      private function zypoca(_arg_1:Tezy, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         var _local_5:Vector3 = null;
         var _local_11:Vector3 = null;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_12:Number = NaN;
         var _local_13:Number = NaN;
         var _local_14:Number = NaN;
         if(_arg_1.hydatiwu)
         {
            _arg_3.x += _arg_1.suveju.x;
            _arg_3.y += _arg_1.suveju.y;
            _arg_3.z += _arg_1.suveju.z;
            _local_5 = _arg_1.fawevotoj.position;
            _local_6 = _local_5.x - _arg_2.x;
            _local_7 = _local_5.y - _arg_2.y;
            _local_8 = _local_5.z - _arg_2.z;
            _local_9 = _local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8;
            if(_local_9 > 1)
            {
               _local_10 = 1 / _local_9;
               _local_11 = _arg_1.suveju;
               _local_12 = (_local_7 * _local_11.z - _local_8 * _local_11.y) * _local_10;
               _local_13 = (_local_8 * _local_11.x - _local_6 * _local_11.z) * _local_10;
               _local_14 = (_local_6 * _local_11.y - _local_7 * _local_11.x) * _local_10;
               _arg_4.x += _local_12;
               _arg_4.y += _local_13;
               _arg_4.z += _local_14;
            }
         }
      }
      
      private function cejigof(_arg_1:Tezy, _arg_2:Vector3, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         if(_arg_1.hydatiwu)
         {
            _local_6 = _arg_2.x;
            _local_7 = _arg_2.y;
            _local_8 = _arg_2.z;
            _local_9 = _local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8;
            if(_local_9 > 0.00001)
            {
               _local_10 = Math.acos(_arg_1.fawevotoj.normal.z);
               if(_local_10 < 0)
               {
                  _local_10 = -_local_10;
               }
               if(_local_10 < _arg_4)
               {
                  _local_11 = _arg_3 / Math.sqrt(_local_9);
                  if(_local_10 > _arg_5)
                  {
                     _local_11 *= (_arg_4 - _local_10) / (_arg_4 - _arg_5);
                  }
                  rila.x = _local_6 * _local_11;
                  rila.y = _local_7 * _local_11;
                  rila.z = _local_8 * _local_11;
                  this.body.addWorldForceAtLocalPoint(_arg_1.hep(),rila);
               }
            }
         }
      }
      
      private function munav() : void
      {
         var _local_1:Matrix3 = null;
         var _local_2:Vector3 = null;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         if(this.wezyqiji.legugequp >= this.wezyqiji.gavime >> 1 || this.nyleqez.legugequp >= this.nyleqez.gavime >> 1)
         {
            _local_1 = this.body.baseMatrix;
            _local_2 = this.body.scene.gravity;
            _local_3 = _local_2.x * _local_1.m02 + _local_2.y * _local_1.m12 + _local_2.z * _local_1.m22;
            _local_4 = _local_2.length();
            _local_5 = Math.SQRT1_2 * _local_4;
            if(_local_3 < -_local_5 || _local_3 > _local_5)
            {
               _local_6 = (_local_1.m02 * _local_3 - _local_2.x) * this.body.mass;
               _local_7 = (_local_1.m12 * _local_3 - _local_2.y) * this.body.mass;
               _local_8 = (_local_1.m22 * _local_3 - _local_2.z) * this.body.mass;
               this.body.addForceXYZ(_local_6,_local_7,_local_8);
            }
         }
      }
      
      public function reset() : void
      {
         this.pojiv = false;
      }
   }
}

