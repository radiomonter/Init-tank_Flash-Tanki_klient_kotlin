package alternativa.tanks.models.battle.jgr.killstreak
{
   import obfuscation.rofa.Sound3D;
   
   public class KillStreakClientItem
   {
      
      private var _messageToBoss:String;
      
      private var _messageToVictims:String;
      
      private var _sound:Sound3D;
      
      public function KillStreakClientItem(_arg_1:String, _arg_2:String, _arg_3:Sound3D)
      {
         super();
         this._messageToBoss = _arg_1;
         this._messageToVictims = _arg_2;
         this._sound = _arg_3;
      }
      
      public function get messageToBoss() : String
      {
         return this._messageToBoss;
      }
      
      public function set messageToBoss(_arg_1:String) : void
      {
         this._messageToBoss = _arg_1;
      }
      
      public function get messageToVictims() : String
      {
         return this._messageToVictims;
      }
      
      public function set messageToVictims(_arg_1:String) : void
      {
         this._messageToVictims = _arg_1;
      }
      
      public function get sound() : Sound3D
      {
         return this._sound;
      }
      
      public function set sound(_arg_1:Sound3D) : void
      {
         this._sound = _arg_1;
      }
   }
}

