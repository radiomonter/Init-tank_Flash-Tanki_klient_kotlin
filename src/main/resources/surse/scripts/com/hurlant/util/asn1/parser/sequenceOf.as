package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   import com.hurlant.util.asn1.type.SequenceType;
   
   public function sequenceOf(_arg_1:ASN1Type, _arg_2:uint = 0, _arg_3:uint = 4294967295) : ASN1Type
   {
      return new SequenceType(_arg_1);
   }
}

