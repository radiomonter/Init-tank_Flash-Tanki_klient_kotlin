package projects.tanks.client.commons.models.layout
{
   public class LayoutState
   {
      
      public static const BATTLE_SELECT:LayoutState = new LayoutState(0,"BATTLE_SELECT");
      
      public static const GARAGE:LayoutState = new LayoutState(1,"GARAGE");
      
      public static const PAYMENT:LayoutState = new LayoutState(2,"PAYMENT");
      
      public static const BATTLE:LayoutState = new LayoutState(3,"BATTLE");
      
      public static const RELOAD_SPACE:LayoutState = new LayoutState(4,"RELOAD_SPACE");
      
      public static const CLAN:LayoutState = new LayoutState(5,"CLAN");
      
      private var _value:int;
      
      private var _name:String;
      
      public function LayoutState(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<LayoutState>
      {
         var _local_1:Vector.<LayoutState> = new Vector.<LayoutState>();
         _local_1.push(BATTLE_SELECT);
         _local_1.push(GARAGE);
         _local_1.push(PAYMENT);
         _local_1.push(BATTLE);
         _local_1.push(RELOAD_SPACE);
         _local_1.push(CLAN);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "LayoutState [" + this._name + "]";
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

