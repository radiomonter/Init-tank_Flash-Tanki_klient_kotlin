package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.IA5StringType;
   
   public function ia5String(_arg_1:int = 2147483647, _arg_2:int = 0) : IA5StringType
   {
      return new IA5StringType(_arg_1,_arg_2);
   }
}

