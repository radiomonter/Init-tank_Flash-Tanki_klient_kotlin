package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class ChoiceType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.ChoiceType",ChoiceType);
      
      public var choices:Array;
      
      public function ChoiceType(_arg_1:Array = null)
      {
         super(ASN1Type.CHOICE);
         this.choices = _arg_1;
      }
      
      override public function fromDER(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_4:* = undefined;
         var _local_5:String = null;
         var _local_6:ASN1Type = null;
         var _local_7:* = undefined;
         var _local_8:* = undefined;
         var _local_3:int = 0;
         while(_local_3 < this.choices.length)
         {
            _local_4 = this.choices[_local_3];
            for(_local_5 in _local_4)
            {
               _local_6 = _local_4[_local_5];
               _local_7 = _local_6.fromDER(_arg_1,_arg_2);
               if(_local_7 != null)
               {
                  _local_8 = {};
                  _local_8[_local_5] = _local_7;
                  return _local_8;
               }
            }
            _local_3++;
         }
         return null;
      }
   }
}

