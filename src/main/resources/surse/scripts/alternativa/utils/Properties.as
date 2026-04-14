package alternativa.utils
{
   public class Properties
   {
      
      private var data:Object;
      
      public function Properties(_arg_1:Object = null)
      {
         super();
         this.data = _arg_1 || {};
      }
      
      public function getProperty(_arg_1:String) : String
      {
         return this.data[_arg_1];
      }
      
      public function getPropertyDef(_arg_1:String, _arg_2:String) : String
      {
         return this.data[_arg_1] || _arg_2;
      }
      
      public function setProperty(_arg_1:String, _arg_2:String) : void
      {
         if(!_arg_2)
         {
            throw new ArgumentError("Empty values are not allowed");
         }
         this.data[_arg_1] = _arg_2;
      }
      
      public function removeProperty(_arg_1:String) : void
      {
         delete this.data[_arg_1];
      }
      
      public function get propertyNames() : Vector.<String>
      {
         var _local_1:* = null;
         var _local_2:Vector.<String> = new Vector.<String>();
         for(_local_1 in this.data)
         {
            _local_2.push(_local_1);
         }
         return _local_2;
      }
      
      public function toString() : String
      {
         var _local_1:* = null;
         var _local_2:* = "";
         for(_local_1 in this.data)
         {
            if(Boolean(_local_2))
            {
               _local_2 += ", ";
            }
            _local_2 += _local_1 + ": " + this.data[_local_1];
         }
         return "[Properties " + _local_2 + "]";
      }
   }
}

