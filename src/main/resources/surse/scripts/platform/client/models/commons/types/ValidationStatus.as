package platform.client.models.commons.types
{
   public class ValidationStatus
   {
      
      public static const TOO_SHORT:ValidationStatus = new ValidationStatus(0,"TOO_SHORT");
      
      public static const TOO_LONG:ValidationStatus = new ValidationStatus(1,"TOO_LONG");
      
      public static const NOT_UNIQUE:ValidationStatus = new ValidationStatus(2,"NOT_UNIQUE");
      
      public static const NOT_MATCH_PATTERN:ValidationStatus = new ValidationStatus(3,"NOT_MATCH_PATTERN");
      
      public static const FORBIDDEN:ValidationStatus = new ValidationStatus(4,"FORBIDDEN");
      
      public static const CORRECT:ValidationStatus = new ValidationStatus(5,"CORRECT");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ValidationStatus(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ValidationStatus>
      {
         var _local_1:Vector.<ValidationStatus> = new Vector.<ValidationStatus>();
         _local_1.push(TOO_SHORT);
         _local_1.push(TOO_LONG);
         _local_1.push(NOT_UNIQUE);
         _local_1.push(NOT_MATCH_PATTERN);
         _local_1.push(FORBIDDEN);
         _local_1.push(CORRECT);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ValidationStatus [" + this._name + "]";
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

