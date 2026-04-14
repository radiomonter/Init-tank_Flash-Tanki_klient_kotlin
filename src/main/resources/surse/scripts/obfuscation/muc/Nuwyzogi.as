package obfuscation.muc
{
   public class Nuwyzogi
   {
      
      public static const ALL:Nuwyzogi = new Nuwyzogi(0,"ALL");
      
      public static const FRIENDS_ONLY:Nuwyzogi = new Nuwyzogi(1,"FRIENDS_ONLY");
      
      public static const NONE:Nuwyzogi = new Nuwyzogi(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Nuwyzogi(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Nuwyzogi>
      {
         var _local_1:Vector.<Nuwyzogi> = new Vector.<Nuwyzogi>();
         _local_1.push(ALL);
         _local_1.push(FRIENDS_ONLY);
         _local_1.push(NONE);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "PersonalMessageReceiveMode [" + this._name + "]";
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

