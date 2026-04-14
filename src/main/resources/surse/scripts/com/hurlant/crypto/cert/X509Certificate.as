package com.hurlant.crypto.cert
{
   import com.hurlant.crypto.hash.IHash;
   import com.hurlant.crypto.hash.MD2;
   import com.hurlant.crypto.hash.MD5;
   import com.hurlant.crypto.hash.SHA1;
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.util.ArrayUtil;
   import com.hurlant.util.Base64;
   import com.hurlant.util.der.ByteString;
   import com.hurlant.util.der.DER;
   import com.hurlant.util.der.OID;
   import com.hurlant.util.der.ObjectIdentifier;
   import com.hurlant.util.der.PEM;
   import com.hurlant.util.der.Sequence;
   import com.hurlant.util.der.Type;
   import com.hurlant.util.der.Type2;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class X509Certificate
   {
      
      private var _loaded:Boolean;
      
      private var _param:*;
      
      private var _obj2:Object;
      
      public function X509Certificate(_arg_1:*)
      {
         super();
         this._loaded = false;
         this._param = _arg_1;
      }
      
      private function load() : void
      {
         var _local_2:ByteArray = null;
         var _local_3:int = 0;
         if(this._loaded)
         {
            return;
         }
         var _local_1:* = this._param;
         if(_local_1 is String)
         {
            _local_2 = PEM.readCertIntoArray(_local_1 as String);
         }
         else if(_local_1 is ByteArray)
         {
            _local_2 = _local_1;
         }
         if(_local_2 != null)
         {
            _local_3 = getTimer();
            _local_3 = getTimer();
            this._obj2 = Type2.Certificate.fromDER(_local_2,_local_2.length);
            this._loaded = true;
            return;
         }
         throw new Error("Invalid x509 Certificate parameter: " + _local_1);
      }
      
      public function isSigned(_arg_1:X509CertificateCollection, _arg_2:X509CertificateCollection, _arg_3:Date = null) : Boolean
      {
         var _local_8:Boolean = false;
         this.load();
         if(_arg_3 == null)
         {
            _arg_3 = new Date();
         }
         var _local_4:Date = this.getNotBefore();
         var _local_5:Date = this.getNotAfter();
         if(_arg_3.getTime() < _local_4.getTime())
         {
            return false;
         }
         if(_arg_3.getTime() > _local_5.getTime())
         {
            return false;
         }
         var _local_6:String = this.getIssuerPrincipal();
         var _local_7:X509Certificate = _arg_2.getCertificate(_local_6);
         if(_local_7 == null)
         {
            _local_7 = _arg_1.getCertificate(_local_6);
            if(_local_7 == null)
            {
               return false;
            }
         }
         else
         {
            _local_8 = true;
         }
         if(_local_7 == this)
         {
            return false;
         }
         if(!(_local_8 && _local_7.isSelfSigned(_arg_3)) && !_local_7.isSigned(_arg_1,_arg_2,_arg_3))
         {
            return false;
         }
         var _local_9:RSAKey = _local_7.getPublicKey();
         return this.verifyCertificate(_local_9);
      }
      
      public function isSelfSigned(_arg_1:Date) : Boolean
      {
         this.load();
         var _local_2:RSAKey = this.getPublicKey();
         return this.verifyCertificate(_local_2);
      }
      
      private function verifyCertificate(_arg_1:RSAKey) : Boolean
      {
         var _local_3:IHash = null;
         var _local_4:String = null;
         var _local_2:String = this.getAlgorithmIdentifier();
         switch(_local_2)
         {
            case OID.SHA1_WITH_RSA_ENCRYPTION:
               _local_3 = new SHA1();
               _local_4 = OID.SHA1_ALGORITHM;
               break;
            case OID.MD2_WITH_RSA_ENCRYPTION:
               _local_3 = new MD2();
               _local_4 = OID.MD2_ALGORITHM;
               break;
            case OID.MD5_WITH_RSA_ENCRYPTION:
               _local_3 = new MD5();
               _local_4 = OID.MD5_ALGORITHM;
               break;
            default:
               return false;
         }
         var _local_5:ByteArray = this._obj2.toBeSigned_bin;
         var _local_6:ByteArray = new ByteArray();
         _arg_1.verify(this._obj2.signature,_local_6,this._obj2.signature.length);
         _local_6.position = 0;
         _local_5 = _local_3.hash(_local_5);
         var _local_7:Object = DER.parse(_local_6,Type.RSA_SIGNATURE);
         if(_local_7.algorithm.algorithmId.toString() != _local_4)
         {
            return false;
         }
         if(!ArrayUtil.equals(_local_7.hash,_local_5))
         {
            return false;
         }
         return true;
      }
      
      private function signCertificate(_arg_1:RSAKey, _arg_2:String) : ByteArray
      {
         var _local_3:IHash = null;
         var _local_4:String = null;
         switch(_arg_2)
         {
            case OID.SHA1_WITH_RSA_ENCRYPTION:
               _local_3 = new SHA1();
               _local_4 = OID.SHA1_ALGORITHM;
               break;
            case OID.MD2_WITH_RSA_ENCRYPTION:
               _local_3 = new MD2();
               _local_4 = OID.MD2_ALGORITHM;
               break;
            case OID.MD5_WITH_RSA_ENCRYPTION:
               _local_3 = new MD5();
               _local_4 = OID.MD5_ALGORITHM;
               break;
            default:
               return null;
         }
         var _local_5:ByteArray = this._obj2.toBeSigned_bin;
         _local_5 = _local_3.hash(_local_5);
         var _local_6:Sequence = new Sequence();
         _local_6[0] = new Sequence();
         _local_6[0][0] = new ObjectIdentifier(0,0,_local_4);
         _local_6[0][1] = null;
         _local_6[1] = new ByteString();
         _local_6[1].writeBytes(_local_5);
         _local_5 = _local_6.toDER();
         var _local_7:ByteArray = new ByteArray();
         _arg_1.sign(_local_5,_local_7,_local_5.length);
         return _local_7;
      }
      
      public function getPublicKey() : RSAKey
      {
         this.load();
         var _local_1:ByteArray = this._obj2.toBeSigned.subjectPublicKeyInfo.subjectPublicKey as ByteArray;
         _local_1.position = 0;
         var _local_2:Object = DER.parse(_local_1,[{"name":"N"},{"name":"E"}]);
         return new RSAKey(_local_2.N,_local_2.E.valueOf());
      }
      
      public function getSubjectPrincipal() : String
      {
         this.load();
         return Base64.encodeByteArray(this._obj2.toBeSigned.subject_bin);
      }
      
      public function getIssuerPrincipal() : String
      {
         this.load();
         return Base64.encodeByteArray(this._obj2.toBeSigned.issuer_bin);
      }
      
      public function getAlgorithmIdentifier() : String
      {
         return this._obj2.algorithm.algorithm.toString();
      }
      
      public function getNotBefore() : Date
      {
         return this._obj2.toBeSigned.validity.notBefore.utcTime;
      }
      
      public function getNotAfter() : Date
      {
         return this._obj2.toBeSigned.validity.notAfter.utcTime;
      }
      
      public function getCommonName() : String
      {
         var _local_3:Object = null;
         var _local_4:* = undefined;
         var _local_5:* = undefined;
         var _local_6:String = null;
         var _local_2:int = 0;
         var _local_1:Array = this._obj2.toBeSigned.subject.sequence;
         while(_local_2 < _local_1.length)
         {
            _local_3 = _local_1[_local_2][0];
            if(Boolean(_local_3.commonName))
            {
               _local_4 = _local_3.commonName.value;
               var _loc7_:int = 0;
               var _loc8_:* = _local_4;
               for(_local_6 in _loc8_)
               {
                  _local_5 = _local_4[_local_6];
               }
               return _local_5;
            }
            _local_2++;
         }
         return "hi";
      }
   }
}

