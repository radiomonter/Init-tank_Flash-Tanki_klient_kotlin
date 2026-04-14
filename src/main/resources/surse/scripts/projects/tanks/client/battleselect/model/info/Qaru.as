package projects.tanks.client.battleselect.model.info
{
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.qedajyt.Juva;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Qaru
   {
      
      private var _battleMode:Suvozimi;
      
      private var jid:Tiz;
      
      private var paqig:String;
      
      private var hepocov:Juva;
      
      private var _map:IGameObject;
      
      private var _maxPeopleCount:int;
      
      private var buw:Boolean;
      
      private var _name:String;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Nukoki;
      
      private var qasuhigew:Boolean;
      
      private var lujen:Boolean;
      
      private var _spectator:Boolean;
      
      private var kitokaqef:int;
      
      private var rinasitug:Boolean;
      
      private var quzeg:Boolean;
      
      private var miq:Boolean;
      
      private var hitujet:Boolean;
      
      private var vyjuf:Boolean;
      
      public function Qaru(_arg_1:Suvozimi = null, _arg_2:String = null, _arg_3:Juva = null, _arg_4:IGameObject = null, _arg_5:int = 0, _arg_6:String = null, _arg_7:Boolean = false, _arg_8:Nukoki = null, _arg_9:Boolean = false, _arg_10:Boolean = false, _arg_11:int = 0, _arg_12:Boolean = false, _arg_13:Boolean = false, _arg_14:Boolean = false, _arg_15:Boolean = false, _arg_16:Boolean = false, _arg_17:Boolean = false, _arg_18:Tiz = null, _arg_19:Boolean = false)
      {
         super();
         this._battleMode = _arg_1;
         this.paqig = _arg_2;
         this.hepocov = _arg_3;
         this._map = _arg_4;
         this._maxPeopleCount = _arg_5;
         this._name = _arg_6;
         this._proBattle = _arg_7;
         this._rankRange = _arg_8;
         this.lujen = _arg_9;
         this._spectator = _arg_10;
         this.kitokaqef = _arg_11;
         this.rinasitug = _arg_12;
         this.qasuhigew = _arg_13;
         this.quzeg = _arg_14;
         this.miq = _arg_15;
         this.hitujet = _arg_16;
         this.vyjuf = _arg_17;
         this.jid = _arg_18;
         this.buw = _arg_19;
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
      
      public function get itemId() : String
      {
         return this.paqig;
      }
      
      public function set itemId(_arg_1:String) : void
      {
         this.paqig = _arg_1;
      }
      
      public function get fik() : Juva
      {
         return this.hepocov;
      }
      
      public function set fik(_arg_1:Juva) : void
      {
         this.hepocov = _arg_1;
      }
      
      public function get map() : IGameObject
      {
         return this._map;
      }
      
      public function set map(_arg_1:IGameObject) : void
      {
         this._map = _arg_1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this._maxPeopleCount;
      }
      
      public function set maxPeopleCount(_arg_1:int) : void
      {
         this._maxPeopleCount = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.buw;
      }
      
      public function set parkourMode(_arg_1:Boolean) : void
      {
         this.buw = _arg_1;
      }
      
      public function get proBattle() : Boolean
      {
         return this._proBattle;
      }
      
      public function set proBattle(_arg_1:Boolean) : void
      {
         this._proBattle = _arg_1;
      }
      
      public function get rankRange() : Nukoki
      {
         return this._rankRange;
      }
      
      public function set rankRange(_arg_1:Nukoki) : void
      {
         this._rankRange = _arg_1;
      }
      
      public function get reArmor() : Boolean
      {
         return this.qasuhigew;
      }
      
      public function set reArmor(_arg_1:Boolean) : void
      {
         this.qasuhigew = _arg_1;
      }
      
      public function get roundStarted() : Boolean
      {
         return this.lujen;
      }
      
      public function set roundStarted(_arg_1:Boolean) : void
      {
         this.lujen = _arg_1;
      }
      
      public function get spectator() : Boolean
      {
         return this._spectator;
      }
      
      public function set spectator(_arg_1:Boolean) : void
      {
         this._spectator = _arg_1;
      }
      
      public function get timeLeftInSec() : int
      {
         return this.kitokaqef;
      }
      
      public function set timeLeftInSec(_arg_1:int) : void
      {
         this.kitokaqef = _arg_1;
      }
      
      public function get userPaidNoSuppliesBattle() : Boolean
      {
         return this.rinasitug;
      }
      
      public function set userPaidNoSuppliesBattle(_arg_1:Boolean) : void
      {
         this.rinasitug = _arg_1;
      }
      
      public function get withoutBonuses() : Boolean
      {
         return this.quzeg;
      }
      
      public function set withoutBonuses(_arg_1:Boolean) : void
      {
         this.quzeg = _arg_1;
      }
      
      public function get withoutCrystals() : Boolean
      {
         return this.miq;
      }
      
      public function set withoutCrystals(_arg_1:Boolean) : void
      {
         this.miq = _arg_1;
      }
      
      public function get withoutSupplies() : Boolean
      {
         return this.hitujet;
      }
      
      public function set withoutSupplies(_arg_1:Boolean) : void
      {
         this.hitujet = _arg_1;
      }
      
      public function get bitoleho() : Boolean
      {
         return this.vyjuf;
      }
      
      public function set bitoleho(_arg_1:Boolean) : void
      {
         this.vyjuf = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleInfoCC [";
         _local_1 += "battleMode = " + this.battleMode + " ";
         _local_1 += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _local_1 += "itemId = " + this.itemId + " ";
         _local_1 += "limits = " + this.fik + " ";
         _local_1 += "map = " + this.map + " ";
         _local_1 += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _local_1 += "parkourMode = " + this.parkourMode + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "proBattle = " + this.proBattle + " ";
         _local_1 += "rankRange = " + this.rankRange + " ";
         _local_1 += "reArmor = " + this.reArmor + " ";
         _local_1 += "roundStarted = " + this.roundStarted + " ";
         _local_1 += "spectator = " + this.spectator + " ";
         _local_1 += "timeLeftInSec = " + this.timeLeftInSec + " ";
         _local_1 += "userPaidNoSuppliesBattle = " + this.userPaidNoSuppliesBattle + " ";
         _local_1 += "withoutBonuses = " + this.withoutBonuses + " ";
         _local_1 += "withoutCrystals = " + this.withoutCrystals + " ";
         _local_1 += "withoutSupplies = " + this.withoutSupplies + " ";
         _local_1 += "withoutUpgrades = " + this.bitoleho + " ";
         return _local_1 + "]";
      }
   }
}

