package obfuscation.fabuqy
{
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.gybivyveq.Tiz;
   import obfuscation.qedajyt.Juva;
   
   public class Qumafi
   {
      
      private var _autoBalance:Boolean;
      
      private var _battleMode:Suvozimi;
      
      private var jid:Tiz;
      
      private var hahe:Boolean;
      
      private var hepocov:Juva;
      
      private var deconyg:String;
      
      private var _maxPeopleCount:int;
      
      private var _name:String;
      
      private var buw:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Nukoki;
      
      private var fejopova:Boolean;
      
      private var dyno:Bycyjoze;
      
      private var quzeg:Boolean;
      
      private var miq:Boolean;
      
      private var hitujet:Boolean;
      
      private var vyjuf:Boolean;
      
      public function Qumafi(_arg_1:Boolean = false, _arg_2:Suvozimi = null, _arg_3:Tiz = null, _arg_4:Boolean = false, _arg_5:Juva = null, _arg_6:String = null, _arg_7:int = 0, _arg_8:String = null, _arg_9:Boolean = false, _arg_10:Boolean = false, _arg_11:Boolean = false, _arg_12:Nukoki = null, _arg_13:Boolean = false, _arg_14:Bycyjoze = null, _arg_15:Boolean = false, _arg_16:Boolean = false, _arg_17:Boolean = false, _arg_18:Boolean = false)
      {
         super();
         this._autoBalance = _arg_1;
         this._battleMode = _arg_2;
         this.jid = _arg_3;
         this.hahe = _arg_4;
         this.hepocov = _arg_5;
         this.deconyg = _arg_6;
         this._maxPeopleCount = _arg_7;
         this._name = _arg_8;
         this.buw = _arg_9;
         this._privateBattle = _arg_10;
         this._proBattle = _arg_11;
         this._rankRange = _arg_12;
         this.fejopova = _arg_13;
         this.dyno = _arg_14;
         this.quzeg = _arg_15;
         this.miq = _arg_16;
         this.hitujet = _arg_17;
         this.vyjuf = _arg_18;
      }
      
      public function get autoBalance() : Boolean
      {
         return this._autoBalance;
      }
      
      public function set autoBalance(_arg_1:Boolean) : void
      {
         this._autoBalance = _arg_1;
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
      
      public function get friendlyFire() : Boolean
      {
         return this.hahe;
      }
      
      public function set friendlyFire(_arg_1:Boolean) : void
      {
         this.hahe = _arg_1;
      }
      
      public function get fik() : Juva
      {
         return this.hepocov;
      }
      
      public function set fik(_arg_1:Juva) : void
      {
         this.hepocov = _arg_1;
      }
      
      public function get mapId() : String
      {
         return this.deconyg;
      }
      
      public function set mapId(_arg_1:String) : void
      {
         this.deconyg = _arg_1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this._maxPeopleCount;
      }
      
      public function set maxPeopleCount(_arg_1:int) : void
      {
         this._maxPeopleCount = _arg_1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.buw;
      }
      
      public function set parkourMode(_arg_1:Boolean) : void
      {
         this.buw = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
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
      
      public function get rankRange() : Nukoki
      {
         return this._rankRange;
      }
      
      public function set rankRange(_arg_1:Nukoki) : void
      {
         this._rankRange = _arg_1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.fejopova;
      }
      
      public function set reArmorEnabled(_arg_1:Boolean) : void
      {
         this.fejopova = _arg_1;
      }
      
      public function get theme() : Bycyjoze
      {
         return this.dyno;
      }
      
      public function set theme(_arg_1:Bycyjoze) : void
      {
         this.dyno = _arg_1;
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
         var _local_1:* = "BattleCreateParameters [";
         _local_1 += "autoBalance = " + this.autoBalance + " ";
         _local_1 += "battleMode = " + this.battleMode + " ";
         _local_1 += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _local_1 += "friendlyFire = " + this.friendlyFire + " ";
         _local_1 += "limits = " + this.fik + " ";
         _local_1 += "mapId = " + this.mapId + " ";
         _local_1 += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "parkourMode = " + this.parkourMode + " ";
         _local_1 += "privateBattle = " + this.privateBattle + " ";
         _local_1 += "proBattle = " + this.proBattle + " ";
         _local_1 += "rankRange = " + this.rankRange + " ";
         _local_1 += "reArmorEnabled = " + this.reArmorEnabled + " ";
         _local_1 += "theme = " + this.theme + " ";
         _local_1 += "withoutBonuses = " + this.withoutBonuses + " ";
         _local_1 += "withoutCrystals = " + this.withoutCrystals + " ";
         _local_1 += "withoutSupplies = " + this.withoutSupplies + " ";
         _local_1 += "withoutUpgrades = " + this.bitoleho + " ";
         return _local_1 + "]";
      }
   }
}

