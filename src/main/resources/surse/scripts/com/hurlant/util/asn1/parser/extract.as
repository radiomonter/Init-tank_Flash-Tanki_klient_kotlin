package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   
   public function extract(_arg_1:ASN1Type) : ASN1Type
   {
      _arg_1 = _arg_1.clone();
      _arg_1.extract = true;
      return _arg_1;
   }
}

