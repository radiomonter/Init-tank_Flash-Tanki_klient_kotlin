package projects.tanks.client.entrance.model.entrance.entrance
{
   public class EntranceModelCC
   {
      
      private var _antiAddictionEnabled:Boolean;
      
      private var _inGameRegistration:Boolean;
      
      public function EntranceModelCC(_arg_1:Boolean = false, _arg_2:Boolean = false)
      {
         super();
         this._antiAddictionEnabled = _arg_1;
         this._inGameRegistration = _arg_2;
      }
      
      public function get antiAddictionEnabled() : Boolean
      {
         return this._antiAddictionEnabled;
      }
      
      public function set antiAddictionEnabled(_arg_1:Boolean) : void
      {
         this._antiAddictionEnabled = _arg_1;
      }
      
      public function get inGameRegistration() : Boolean
      {
         return this._inGameRegistration;
      }
      
      public function set inGameRegistration(_arg_1:Boolean) : void
      {
         this._inGameRegistration = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "EntranceModelCC [";
         _local_1 += "antiAddictionEnabled = " + this.antiAddictionEnabled + " ";
         _local_1 += "inGameRegistration = " + this.inGameRegistration + " ";
         return _local_1 + "]";
      }
   }
}

