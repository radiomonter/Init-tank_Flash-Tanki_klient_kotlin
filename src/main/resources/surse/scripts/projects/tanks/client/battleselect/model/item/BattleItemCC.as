package projects.tanks.client.battleselect.model.item
{
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.gybivyveq.Tiz;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleItemCC
   {
      
      private var _battleId:String;
      
      private var _battleMode:Suvozimi;
      
      private var jid:Tiz;
      
      private var _map:IGameObject;
      
      private var _maxPeople:int;
      
      private var _name:String;
      
      private var _noSuppliesBattle:Boolean;
      
      private var buw:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Nukoki;
      
      private var _timeLeft:int;
      
      private var _suspicious:Boolean;
      
      public function BattleItemCC(_arg_1:String = null, _arg_2:Suvozimi = null, _arg_3:IGameObject = null, _arg_4:int = 0, _arg_5:String = null, _arg_6:Boolean = false, _arg_7:Boolean = false, _arg_8:Boolean = false, _arg_9:Nukoki = null, _arg_10:Boolean = false, _arg_11:Tiz = null, _arg_12:Boolean = false, _arg_13:int = 0)
      {
         super();
         this._battleId = _arg_1;
         this._battleMode = _arg_2;
         this._map = _arg_3;
         this._maxPeople = _arg_4;
         this._name = _arg_5;
         this._noSuppliesBattle = _arg_6;
         this._privateBattle = _arg_7;
         this._proBattle = _arg_8;
         this._rankRange = _arg_9;
         this._suspicious = _arg_10;
         this._timeLeft = _arg_13;
         this.jid = _arg_11;
         this.buw = _arg_12;
      }
      
      public function get battleId() : String
      {
         return this._battleId;
      }
      
      public function set battleId(_arg_1:String) : void
      {
         this._battleId = _arg_1;
      }
      
      public function get battleMode() : Suvozimi
      {
         return this._battleMode;
      }
      
      public function set battleMode(_arg_1:Suvozimi) : void
      {
         this._battleMode = _arg_1;
      }
      
      public function get equipmentConstraintsMode() : Tiz
      {
         return this.jid;
      }
      
      public function set equipmentConstraintsMode(_arg_1:Tiz) : void
      {
         this.jid = _arg_1;
      }
      
      public function get map() : IGameObject
      {
         return this._map;
      }
      
      public function set map(_arg_1:IGameObject) : void
      {
         this._map = _arg_1;
      }
      
      public function get maxPeople() : int
      {
         return this._maxPeople;
      }
      
      public function set maxPeople(_arg_1:int) : void
      {
         this._maxPeople = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get noSuppliesBattle() : Boolean
      {
         return this._noSuppliesBattle;
      }
      
      public function set noSuppliesBattle(_arg_1:Boolean) : void
      {
         this._noSuppliesBattle = _arg_1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.buw;
      }
      
      public function set parkourMode(_arg_1:Boolean) : void
      {
         this.buw = _arg_1;
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
      
      public function get timeLeft() : int
      {
         return this._timeLeft;
      }
      
      public function set timeLeft(_arg_1:int) : void
      {
         this._timeLeft = _arg_1;
      }
      
      public function get rankRange() : Nukoki
      {
         return this._rankRange;
      }
      
      public function set rankRange(_arg_1:Nukoki) : void
      {
         this._rankRange = _arg_1;
      }
      
      public function get suspicious() : Boolean
      {
         return this._suspicious;
      }
      
      public function set suspicious(_arg_1:Boolean) : void
      {
         this._suspicious = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleItemCC [";
         _local_1 += "battleId = " + this.battleId + " ";
         _local_1 += "battleMode = " + this.battleMode + " ";
         _local_1 += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _local_1 += "map = " + this.map + " ";
         _local_1 += "maxPeople = " + this.maxPeople + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "noSuppliesBattle = " + this.noSuppliesBattle + " ";
         _local_1 += "parkourMode = " + this.parkourMode + " ";
         _local_1 += "privateBattle = " + this.privateBattle + " ";
         _local_1 += "proBattle = " + this.proBattle + " ";
         _local_1 += "timeLeft = " + this.timeLeft + " ";
         _local_1 += "rankRange = " + this.rankRange + " ";
         _local_1 += "suspicious = " + this.suspicious + " ";
         return _local_1 + "]";
      }
   }
}

