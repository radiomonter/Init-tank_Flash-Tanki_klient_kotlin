package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.UniversalStringType;
   
   public function universalString(_arg_1:int = 2147483647, _arg_2:int = 0) : UniversalStringType
   {
      return new UniversalStringType(_arg_1,_arg_2);
   }
}

