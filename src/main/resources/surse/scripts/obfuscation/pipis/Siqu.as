package obfuscation.pipis
{
   public class Siqu
   {
      
      private var _enabled:Boolean;
      
      public function Siqu(_arg_1:Boolean = false)
      {
         super();
         this._enabled = _arg_1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         this._enabled = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "InviteEntranceCC [";
         _local_1 += "enabled = " + this.enabled + " ";
         return _local_1 + "]";
      }
   }
}

