package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   
   public function implicitTag(_arg_1:int, _arg_2:int, _arg_3:ASN1Type) : ASN1Type
   {
      _arg_3 = _arg_3.clone();
      _arg_3.implicitTag = _arg_1;
      _arg_3.implicitClass = _arg_2;
      return _arg_3;
   }
}

