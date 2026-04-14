package platform.client.fp10.core.resource.tara
{
   import flash.utils.ByteArray;
   
   public class TARAParser
   {
      
      private var _data:Object;
      
      public function TARAParser(_arg_1:ByteArray)
      {
         super();
         if(_arg_1 != null)
         {
            this.parse(_arg_1);
         }
      }
      
      public function parse(_arg_1:ByteArray) : void
      {
         var _local_2:int = 0;
         var _local_3:ByteArray = null;
         var _local_4:FileInfo = null;
         var _local_5:int = _arg_1.readInt();
         var _local_6:Vector.<FileInfo> = new Vector.<FileInfo>(_local_5);
         _local_2 = 0;
         while(_local_2 < _local_5)
         {
            _local_6[_local_2] = new FileInfo(_arg_1.readUTF(),_arg_1.readInt());
            _local_2++;
         }
         this._data = {};
         _local_2 = 0;
         while(_local_2 < _local_5)
         {
            _local_3 = new ByteArray();
            _local_4 = _local_6[_local_2];
            _arg_1.readBytes(_local_3,0,_local_4.size);
            this._data[_local_4.name] = _local_3;
            _local_2++;
         }
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getFileData(_arg_1:String) : ByteArray
      {
         if(this._data == null)
         {
            return null;
         }
         return ByteArray(this._data[_arg_1]);
      }
   }
}

class FileInfo
{
   
   public var name:String;
   
   public var size:int;
   
   public function FileInfo(_arg_1:String, _arg_2:int)
   {
      super();
      this.name = _arg_1;
      this.size = _arg_2;
   }
}
