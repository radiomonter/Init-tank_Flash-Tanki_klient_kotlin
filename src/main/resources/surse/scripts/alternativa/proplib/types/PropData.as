package alternativa.proplib.types
{
   public class PropData
   {
      
      private var _name:String;
      
      private var states:Object = {};
      
      public function PropData(_arg_1:String)
      {
         super();
         this._name = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function addState(_arg_1:String, _arg_2:PropState) : void
      {
         this.states[_arg_1] = _arg_2;
      }
      
      public function getStateByName(_arg_1:String) : PropState
      {
         return this.states[_arg_1];
      }
      
      public function getDefaultState() : PropState
      {
         return this.states[PropState.DEFAULT_NAME];
      }
      
      public function toString() : String
      {
         return "[Prop name=" + this._name + "]";
      }
      
      public function traceProp() : void
      {
         var _local_1:String = null;
         var _local_2:PropState = null;
         for(_local_1 in this.states)
         {
            _local_2 = this.states[_local_1];
            _local_2.traceState();
         }
      }
   }
}

