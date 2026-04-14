package projects.tanks.client.battlefield.models.battle.jgr
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class JuggernautCC
   {
      
      private var _bossKilledSound:SoundResource;
      
      private var _bossSpawnedSound:SoundResource;
      
      private var _currentBoss:String;
      
      public function JuggernautCC(_arg_2:SoundResource = null, _arg_3:SoundResource = null, _arg_4:String = null)
      {
         super();
         this._bossKilledSound = _arg_2;
         this._bossSpawnedSound = _arg_3;
         this._currentBoss = _arg_4;
      }
      
      public function get bossKilledSound() : SoundResource
      {
         return this._bossKilledSound;
      }
      
      public function set bossKilledSound(_arg_1:SoundResource) : void
      {
         this._bossKilledSound = _arg_1;
      }
      
      public function get bossSpawnedSound() : SoundResource
      {
         return this._bossSpawnedSound;
      }
      
      public function set bossSpawnedSound(_arg_1:SoundResource) : void
      {
         this._bossSpawnedSound = _arg_1;
      }
      
      public function get currentBoss() : String
      {
         return this._currentBoss;
      }
      
      public function set currentBoss(_arg_1:String) : void
      {
         this._currentBoss = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "JuggernautCC [";
         _local_1 += "bossKilledSound = " + this.bossKilledSound + " ";
         _local_1 += "bossSpawnedSound = " + this.bossSpawnedSound + " ";
         _local_1 += "currentBoss = " + this.currentBoss + " ";
         return _local_1 + "]";
      }
   }
}

