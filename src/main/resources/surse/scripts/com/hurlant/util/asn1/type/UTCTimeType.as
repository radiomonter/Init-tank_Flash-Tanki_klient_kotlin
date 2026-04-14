package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class UTCTimeType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.UTCTime",UTCTimeType);
      
      public function UTCTimeType()
      {
         super(ASN1Type.UTC_TIME);
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_3:String = _arg_1.readMultiByte(_arg_2,"US-ASCII");
         var _local_4:uint = parseInt(_local_3.substr(0,2));
         if(_local_4 < 50)
         {
            _local_4 += 2000;
         }
         else
         {
            _local_4 += 1900;
         }
         var _local_5:uint = parseInt(_local_3.substr(2,2));
         var _local_6:uint = parseInt(_local_3.substr(4,2));
         var _local_7:uint = parseInt(_local_3.substr(6,2));
         var _local_8:uint = parseInt(_local_3.substr(8,2));
         return new Date(_local_4,_local_5 - 1,_local_6,_local_7,_local_8);
      }
   }
}

