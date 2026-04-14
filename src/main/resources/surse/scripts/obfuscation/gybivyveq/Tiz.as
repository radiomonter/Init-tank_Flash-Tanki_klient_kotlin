package obfuscation.gybivyveq
{
   public class Tiz
   {
      
      public static const NONE:Tiz = new Tiz(0,"NONE");
      
      public static const HORNET_RAILGUN:Tiz = new Tiz(1,"HORNET_RAILGUN");
      
      public static const WASP_RAILGUN:Tiz = new Tiz(2,"WASP_RAILGUN");
      
      public static const HORNET_WASP_RAILGUN:Tiz = new Tiz(3,"HORNET_WASP_RAILGUN");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Tiz(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Tiz>
      {
         var _local_1:Vector.<Tiz> = new Vector.<Tiz>();
         _local_1.push(NONE);
         _local_1.push(HORNET_RAILGUN);
         _local_1.push(WASP_RAILGUN);
         _local_1.push(HORNET_WASP_RAILGUN);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "EquipmentConstraintsMode [" + this._name + "]";
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

