package projects.tanks.client.panel.model.battleinvite
{
   import obfuscation.qupylitaf.Hek;
   
   public class BattleInviteMessage
   {
      
      private var _availableRank:Boolean;
      
      private var _availableSlot:Boolean;
      
      private var _battleId:String;
      
      private var _gameHost:String;
      
      private var _mapName:String;
      
      private var _mode:Hek;
      
      private var _noSuppliesBattle:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _remote:Boolean;
      
      private var _serverNumber:int;
      
      private var _url:String;
      
      public function BattleInviteMessage(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:String = null, _arg_4:String = null, _arg_5:String = null, _arg_6:Hek = null, _arg_7:Boolean = false, _arg_8:Boolean = false, _arg_9:Boolean = false, _arg_10:int = 0, _arg_11:String = null)
      {
         super();
         this._availableRank = _arg_1;
         this._availableSlot = _arg_2;
         this._battleId = _arg_3;
         this._gameHost = _arg_4;
         this._mapName = _arg_5;
         this._mode = _arg_6;
         this._noSuppliesBattle = _arg_7;
         this._privateBattle = _arg_8;
         this._remote = _arg_9;
         this._serverNumber = _arg_10;
         this._url = _arg_11;
      }
      
      public function get availableRank() : Boolean
      {
         return this._availableRank;
      }
      
      public function set availableRank(_arg_1:Boolean) : void
      {
         this._availableRank = _arg_1;
      }
      
      public function get availableSlot() : Boolean
      {
         return this._availableSlot;
      }
      
      public function set availableSlot(_arg_1:Boolean) : void
      {
         this._availableSlot = _arg_1;
      }
      
      public function get battleId() : String
      {
         return this._battleId;
      }
      
      public function set battleId(_arg_1:String) : void
      {
         this._battleId = _arg_1;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function set gameHost(_arg_1:String) : void
      {
         this._gameHost = _arg_1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(_arg_1:String) : void
      {
         this._mapName = _arg_1;
      }
      
      public function get mode() : Hek
      {
         return this._mode;
      }
      
      public function set mode(_arg_1:Hek) : void
      {
         this._mode = _arg_1;
      }
      
      public function get noSuppliesBattle() : Boolean
      {
         return this._noSuppliesBattle;
      }
      
      public function set noSuppliesBattle(_arg_1:Boolean) : void
      {
         this._noSuppliesBattle = _arg_1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this._privateBattle;
      }
      
      public function set privateBattle(_arg_1:Boolean) : void
      {
         this._privateBattle = _arg_1;
      }
      
      public function get remote() : Boolean
      {
         return this._remote;
      }
      
      public function set remote(_arg_1:Boolean) : void
      {
         this._remote = _arg_1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(_arg_1:int) : void
      {
         this._serverNumber = _arg_1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(_arg_1:String) : void
      {
         this._url = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleInviteMessage [";
         _local_1 += "availableRank = " + this.availableRank + " ";
         _local_1 += "availableSlot = " + this.availableSlot + " ";
         _local_1 += "battleId = " + this.battleId + " ";
         _local_1 += "gameHost = " + this.gameHost + " ";
         _local_1 += "mapName = " + this.mapName + " ";
         _local_1 += "mode = " + this.mode + " ";
         _local_1 += "noSuppliesBattle = " + this.noSuppliesBattle + " ";
         _local_1 += "privateBattle = " + this.privateBattle + " ";
         _local_1 += "remote = " + this.remote + " ";
         _local_1 += "serverNumber = " + this.serverNumber + " ";
         _local_1 += "url = " + this.url + " ";
         return _local_1 + "]";
      }
   }
}

