package projects.tanks.client.battlefield.models.battle.jgr.killstreak
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class KillStreakItem
   {
      
      private var _count:int;
      
      private var _messageToBoss:String;
      
      private var _messageToVictims:String;
      
      private var _sound:SoundResource;
      
      public function KillStreakItem(_arg_1:int = 0, _arg_2:String = null, _arg_3:String = null, _arg_4:SoundResource = null)
      {
         super();
         this._count = _arg_1;
         this._messageToBoss = _arg_2;
         this._messageToVictims = _arg_3;
         this._sound = _arg_4;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
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
      
      public function get sound() : SoundResource
      {
         return this._sound;
      }
      
      public function set sound(_arg_1:SoundResource) : void
      {
         this._sound = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "KillStreakItem [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "messageToBoss = " + this.messageToBoss + " ";
         _local_1 += "messageToVictims = " + this.messageToVictims + " ";
         _local_1 += "sound = " + this.sound + " ";
         return _local_1 + "]";
      }
   }
}

