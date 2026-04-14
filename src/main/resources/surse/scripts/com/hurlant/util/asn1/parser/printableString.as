package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   import com.hurlant.util.asn1.type.PrintableStringType;
   
   public function printableString(_arg_1:int = 2147483647, _arg_2:int = 0) : ASN1Type
   {
      return new PrintableStringType(_arg_1,_arg_2);
   }
}

