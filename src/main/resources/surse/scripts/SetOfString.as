package
{
   import flash.utils.Dictionary;
   
   public class SetOfString
   {
      
      private var _dictionary:Dictionary = new Dictionary();
      
      public function SetOfString()
      {
         super();
      }
      
      public function add(_arg_1:String) : void
      {
         this._dictionary[_arg_1] = true;
      }
      
      public function contains(_arg_1:String) : Boolean
      {
         return this._dictionary[_arg_1];
      }
      
      public function remove(_arg_1:String) : Boolean
      {
         var _local_2:Boolean = this.contains(_arg_1);
         if(_local_2)
         {
            delete this._dictionary[_arg_1];
         }
         return _local_2;
      }
      
      public function get dictionary() : Dictionary
      {
         return this._dictionary;
      }
   }
}

