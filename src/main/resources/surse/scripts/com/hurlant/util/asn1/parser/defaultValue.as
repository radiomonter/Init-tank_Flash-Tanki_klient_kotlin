package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   
   public function defaultValue(_arg_1:*, _arg_2:ASN1Type) : ASN1Type
   {
      _arg_2 = _arg_2.clone();
      _arg_2.defaultValue = _arg_1;
      return _arg_2;
   }
}

