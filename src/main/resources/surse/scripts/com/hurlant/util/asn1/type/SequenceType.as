package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class SequenceType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.SequenceType",SequenceType);
      
      public var children:Array;
      
      public var childType:ASN1Type;
      
      public function SequenceType(_arg_1:* = null)
      {
         super(ASN1Type.SEQUENCE);
         if(_arg_1 is Array)
         {
            this.children = _arg_1 as Array;
         }
         else
         {
            this.childType = _arg_1 as ASN1Type;
         }
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_5:* = undefined;
         var _local_6:* = undefined;
         var _local_7:int = 0;
         var _local_8:String = null;
         var _local_9:int = 0;
         var _local_10:ASN1Type = null;
         var _local_11:ByteArray = null;
         var _local_3:int = int(_arg_1.position);
         var _local_4:int = _arg_2;
         if(this.children != null)
         {
            _local_5 = {};
            _local_7 = 0;
            while(_local_7 < this.children.length)
            {
               for(_local_8 in this.children[_local_7])
               {
                  _local_9 = int(_arg_1.position);
                  _local_4 = _arg_2 - _local_9 + _local_3;
                  _local_10 = this.children[_local_7][_local_8];
                  _local_6 = _local_10.fromDER(_arg_1,_local_4);
                  if(_local_6 == null)
                  {
                     if(!_local_10.optional)
                     {
                        _arg_1.position = _local_3;
                        return null;
                     }
                  }
                  else
                  {
                     _local_5[_local_8] = _local_6;
                     if(_local_10.extract)
                     {
                        _local_11 = new ByteArray();
                        _local_11.writeBytes(_arg_1,_local_9,_arg_1.position - _local_9);
                        _local_5[_local_8 + "_bin"] = _local_11;
                     }
                  }
               }
               _local_7++;
            }
            return _local_5;
         }
         _local_5 = [];
         while(_local_4 > 0)
         {
            _local_6 = this.childType.fromDER(_arg_1,_local_4);
            if(_local_6 == null)
            {
               throw new Error("couldn\'t parse DER stream.");
            }
            _local_5.push(_local_6);
            _local_4 = _arg_2 - _arg_1.position + _local_3;
         }
         return _local_5;
      }
   }
}

