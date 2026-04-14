package alternativa.tanks
{
   public class AbstractEnum
   {
      
      private var _value:int;
      
      private var _name:String;
      
      public function AbstractEnum(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public function toString() : String
      {
         return this._name;
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

