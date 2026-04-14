package alternativa.osgi.catalogs
{
   public class ServiceParam
   {
      
      private var _name:String;
      
      private var _value:*;
      
      public function ServiceParam(_arg_1:String, _arg_2:*)
      {
         super();
         this._name = _arg_1;
         this._value = _arg_2;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get value() : *
      {
         return this._value;
      }
   }
}

