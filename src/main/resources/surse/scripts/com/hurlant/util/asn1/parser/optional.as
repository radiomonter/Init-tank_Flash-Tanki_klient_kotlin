package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   
   public function optional(_arg_1:ASN1Type) : ASN1Type
   {
      _arg_1 = _arg_1.clone();
      _arg_1.optional = true;
      return _arg_1;
   }
}

