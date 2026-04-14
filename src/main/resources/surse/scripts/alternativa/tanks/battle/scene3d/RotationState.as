package alternativa.tanks.battle.scene3d
{
   public class RotationState
   {
      
      public static const jikimibi:RotationState = new RotationState("without_rotation");
      
      public static const nuru:RotationState = new RotationState("use_random_rotation");
      
      private var _state:String;
      
      public function RotationState(_arg_1:String)
      {
         super();
         this._state = _arg_1;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function toString() : String
      {
         return "RotationState{_state=" + String(this._state) + "}";
      }
   }
}

