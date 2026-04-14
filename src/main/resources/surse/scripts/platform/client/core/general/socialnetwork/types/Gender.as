package platform.client.core.general.socialnetwork.types
{
   public class Gender
   {
      
      public static const MALE:Gender = new Gender(0,"MALE");
      
      public static const FEMALE:Gender = new Gender(1,"FEMALE");
      
      public static const NONE:Gender = new Gender(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Gender(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Gender>
      {
         var _local_1:Vector.<Gender> = new Vector.<Gender>();
         _local_1.push(MALE);
         _local_1.push(FEMALE);
         _local_1.push(NONE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "Gender [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

