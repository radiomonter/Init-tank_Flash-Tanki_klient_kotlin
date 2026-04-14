package alternativa.protocol
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ProtocolBuffer
   {
      
      private var _writer:IDataOutput;
      
      private var _reader:IDataInput;
      
      private var _optionalMap:OptionalMap;
      
      public function ProtocolBuffer(_arg_1:IDataOutput, _arg_2:IDataInput, _arg_3:OptionalMap)
      {
         super();
         this._writer = _arg_1;
         this._reader = _arg_2;
         this._optionalMap = _arg_3;
      }
      
      public function get writer() : IDataOutput
      {
         return this._writer;
      }
      
      public function set writer(_arg_1:IDataOutput) : void
      {
         this._writer = _arg_1;
      }
      
      public function get reader() : IDataInput
      {
         return this._reader;
      }
      
      public function set reader(_arg_1:IDataInput) : void
      {
         this._reader = _arg_1;
      }
      
      public function get optionalMap() : OptionalMap
      {
         return this._optionalMap;
      }
      
      public function set optionalMap(_arg_1:OptionalMap) : void
      {
         this._optionalMap = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:int = 0;
         var _local_2:String = null;
         var _local_5:int = 0;
         var _local_7:int = 0;
         var _local_3:* = "";
         var _local_4:int = int(ByteArray(this.reader).position);
         _local_3 += "\n=== Optional Map ===\n";
         _local_3 += this.optionalMap.toString();
         _local_3 += "\n=== Dump data (trunc 100 bytes) ===\n";
         var _local_6:* = "";
         while(Boolean(ByteArray(this.reader).bytesAvailable) && _local_7 < 100)
         {
            _local_1 = this.reader.readByte();
            _local_2 = String.fromCharCode(_local_1);
            if(_local_1 >= 0 && _local_1 < 16)
            {
               _local_3 += "0";
            }
            if(_local_1 < 0)
            {
               _local_1 = 256 + _local_1;
            }
            _local_3 += _local_1.toString(16);
            _local_3 += " ";
            if(_local_1 < 12 && _local_1 > 128)
            {
               _local_6 += ".";
            }
            else
            {
               _local_6 += _local_2;
            }
            if(++_local_5 > 16)
            {
               _local_3 += "\t";
               _local_3 += _local_6;
               _local_3 += "\n";
               _local_5 = 0;
               _local_6 = "";
            }
            _local_7++;
         }
         if(_local_5 != 0)
         {
            while(_local_5 < 18)
            {
               _local_5++;
               _local_3 += "   ";
            }
            _local_3 += "\t";
            _local_3 += _local_6;
            _local_3 += "\n";
         }
         ByteArray(this.reader).position = _local_4;
         return _local_3;
      }
   }
}

