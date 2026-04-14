package com.hurlant.crypto.cert
{
   public class X509CertificateCollection
   {
      
      private var _map:Object;
      
      public function X509CertificateCollection()
      {
         super();
         this._map = {};
      }
      
      public function addPEMCertificate(_arg_1:String, _arg_2:String, _arg_3:String) : void
      {
         this._map[_arg_2] = new X509Certificate(_arg_3);
      }
      
      public function addCertificate(_arg_1:X509Certificate) : void
      {
         var _local_2:String = _arg_1.getSubjectPrincipal();
         this._map[_local_2] = _arg_1;
      }
      
      public function getCertificate(_arg_1:String) : X509Certificate
      {
         return this._map[_arg_1];
      }
   }
}

