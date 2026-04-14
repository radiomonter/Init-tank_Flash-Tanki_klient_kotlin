package obfuscation.dykuwiwoz
{
   public class Tonag
   {
      
      private var _receiveBattleInvite:Boolean;
      
      public function Tonag(_arg_1:Boolean = false)
      {
         super();
         this._receiveBattleInvite = _arg_1;
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite;
      }
      
      public function set receiveBattleInvite(_arg_1:Boolean) : void
      {
         this._receiveBattleInvite = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "NotificationEnabledCC [";
         _local_1 += "receiveBattleInvite = " + this.receiveBattleInvite + " ";
         return _local_1 + "]";
      }
   }
}

