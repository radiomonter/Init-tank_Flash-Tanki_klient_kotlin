package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.cert.MozillaRootCertificates;
   import com.hurlant.crypto.cert.X509CertificateCollection;
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.util.der.PEM;
   import flash.utils.ByteArray;
   
   public class TLSConfig
   {
      
      public var entity:uint;
      
      public var certificate:ByteArray;
      
      public var privateKey:RSAKey;
      
      public var cipherSuites:Array;
      
      public var compressions:Array;
      
      public var ignoreCommonNameMismatch:Boolean = false;
      
      public var trustAllCertificates:Boolean = false;
      
      public var trustSelfSignedCertificates:Boolean = false;
      
      public var promptUserForAcceptCert:Boolean = false;
      
      public var CAStore:X509CertificateCollection;
      
      public var localKeyStore:X509CertificateCollection;
      
      public var version:uint;
      
      public function TLSConfig(_arg_1:uint, _arg_2:Array = null, _arg_3:Array = null, _arg_4:ByteArray = null, _arg_5:RSAKey = null, _arg_6:X509CertificateCollection = null, _arg_7:uint = 0)
      {
         super();
         this.entity = _arg_1;
         this.cipherSuites = _arg_2;
         this.compressions = _arg_3;
         this.certificate = _arg_4;
         this.privateKey = _arg_5;
         this.CAStore = _arg_6;
         this.version = _arg_7;
         if(_arg_2 == null)
         {
            this.cipherSuites = CipherSuites.getDefaultSuites();
         }
         if(_arg_3 == null)
         {
            this.compressions = [TLSSecurityParameters.COMPRESSION_NULL];
         }
         if(_arg_6 == null)
         {
            this.CAStore = new MozillaRootCertificates();
         }
         if(_arg_7 == 0)
         {
            this.version = TLSSecurityParameters.PROTOCOL_VERSION;
         }
      }
      
      public function setPEMCertificate(_arg_1:String, _arg_2:String = null) : void
      {
         if(_arg_2 == null)
         {
            _arg_2 = _arg_1;
         }
         this.certificate = PEM.readCertIntoArray(_arg_1);
         this.privateKey = PEM.readRSAPrivateKey(_arg_2);
      }
   }
}

