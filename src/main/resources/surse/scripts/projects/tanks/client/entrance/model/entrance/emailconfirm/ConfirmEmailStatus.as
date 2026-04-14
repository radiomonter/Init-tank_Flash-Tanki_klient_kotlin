package projects.tanks.client.entrance.model.entrance.emailconfirm
{
   public class ConfirmEmailStatus
   {
      
      public static const OK_EXISTS:ConfirmEmailStatus = new ConfirmEmailStatus(0,"OK_EXISTS");
      
      public static const OK:ConfirmEmailStatus = new ConfirmEmailStatus(1,"OK");
      
      public static const ERROR:ConfirmEmailStatus = new ConfirmEmailStatus(2,"ERROR");
      
      private var _value:int;
      
      private var _name:String;
      
      public function ConfirmEmailStatus(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<ConfirmEmailStatus>
      {
         var _local_1:Vector.<ConfirmEmailStatus> = new Vector.<ConfirmEmailStatus>();
         _local_1.push(OK_EXISTS);
         _local_1.push(OK);
         _local_1.push(ERROR);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "ConfirmEmailStatus [" + this._name + "]";
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

