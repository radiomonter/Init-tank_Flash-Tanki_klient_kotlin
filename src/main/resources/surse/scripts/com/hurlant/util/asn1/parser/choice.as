package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.ASN1Type;
   import com.hurlant.util.asn1.type.ChoiceType;
   
   public function choice(... _args) : ASN1Type
   {
      var _local_3:int = 0;
      var _local_2:Array = [];
      while(_local_3 < _args.length)
      {
         _local_2[_local_3] = _args[_local_3];
         _local_3++;
      }
      return new ChoiceType(_local_2);
   }
}

