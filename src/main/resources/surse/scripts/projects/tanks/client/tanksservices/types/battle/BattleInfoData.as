package projects.tanks.client.tanksservices.types.battle
{
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   
   public class BattleInfoData
   {
      
      private var _battleId:String;
      
      private var _mapName:String;
      
      private var _mode:Suvozimi;
      
      private var _privateBattle:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _range:Nukoki;
      
      private var _remote:Boolean;
      
      private var _serverNumber:int;
      
      public function BattleInfoData(_arg_1:String = null, _arg_2:String = null, _arg_3:Suvozimi = null, _arg_4:Boolean = false, _arg_5:Boolean = false, _arg_6:Nukoki = null, _arg_7:Boolean = false, _arg_8:int = 0)
      {
         super();
         this._battleId = _arg_1;
         this._mapName = _arg_2;
         this._mode = _arg_3;
         this._privateBattle = _arg_4;
         this._proBattle = _arg_5;
         this._range = _arg_6;
         this._remote = _arg_7;
         this._serverNumber = _arg_8;
      }
      
      public function get battleId() : String
      {
         return this._battleId;
      }
      
      public function set battleId(_arg_1:String) : void
      {
         this._battleId = _arg_1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(_arg_1:String) : void
      {
         this._mapName = _arg_1;
      }
      
      public function get mode() : Suvozimi
      {
         return this._mode;
      }
      
      public function set mode(_arg_1:Suvozimi) : void
      {
         this._mode = _arg_1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this._privateBattle;
      }
      
      public function set privateBattle(_arg_1:Boolean) : void
      {
         this._privateBattle = _arg_1;
      }
      
      public function get proBattle() : Boolean
      {
         return this._proBattle;
      }
      
      public function set proBattle(_arg_1:Boolean) : void
      {
         this._proBattle = _arg_1;
      }
      
      public function get range() : Nukoki
      {
         return this._range;
      }
      
      public function set range(_arg_1:Nukoki) : void
      {
         this._range = _arg_1;
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
      
      public function toString() : String
      {
         var _local_1:* = "BattleInfoData [";
         _local_1 += "battleId = " + this.battleId + " ";
         _local_1 += "mapName = " + this.mapName + " ";
         _local_1 += "mode = " + this.mode + " ";
         _local_1 += "privateBattle = " + this.privateBattle + " ";
         _local_1 += "proBattle = " + this.proBattle + " ";
         _local_1 += "range = " + this.range + " ";
         _local_1 += "remote = " + this.remote + " ";
         _local_1 += "serverNumber = " + this.serverNumber + " ";
         return _local_1 + "]";
      }
   }
}

