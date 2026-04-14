package obfuscation.joni
{
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   
   public class Tozutuv
   {
      
      private var pisoride:Momo;
      
      private var cuqo:int;
      
      private var _kills:int;
      
      private var _score:int;
      
      private var _reward:int;
      
      private var mufuquk:int;
      
      private var byq:int;
      
      public function Tozutuv()
      {
         super();
      }
      
      public function gatelas(_arg_1:Suc, _arg_2:Momo) : void
      {
         this.pisoride = _arg_2;
         this.cuqo = _arg_1.deaths;
         this._kills = _arg_1.kills;
         this._score = _arg_1.score;
      }
      
      public function bulug(_arg_1:Suc) : void
      {
         this.cuqo = _arg_1.deaths;
         this._kills = _arg_1.kills;
         this._score = _arg_1.score;
      }
      
      public function padini(_arg_1:Bamapylaq, _arg_2:Momo) : void
      {
         this.pisoride = _arg_2;
         this.cuqo = _arg_1.deaths;
         this._kills = _arg_1.kills;
         this._score = _arg_1.score;
      }
      
      public function get userId() : String
      {
         return this.pisoride.userId;
      }
      
      public function get uid() : String
      {
         return this.pisoride.uid;
      }
      
      public function get rank() : int
      {
         return this.pisoride.rank;
      }
      
      public function get suspicious() : Boolean
      {
         return this.pisoride.suspicious;
      }
      
      public function get loaded() : Boolean
      {
         return this.pisoride.loaded;
      }
      
      public function get teamType() : BattleTeam
      {
         return this.pisoride.teamType;
      }
      
      public function get deaths() : int
      {
         return this.cuqo;
      }
      
      public function get kills() : int
      {
         return this._kills;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function get bejo() : int
      {
         return this._reward;
      }
      
      public function set teamType(_arg_1:BattleTeam) : void
      {
         this.pisoride.teamType = _arg_1;
      }
      
      public function set suspicious(_arg_1:Boolean) : void
      {
         this.pisoride.suspicious = _arg_1;
      }
      
      public function set loaded(_arg_1:Boolean) : void
      {
         this.pisoride.loaded = _arg_1;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this.pisoride.rank = _arg_1;
      }
      
      public function set bejo(_arg_1:int) : void
      {
         this._reward = _arg_1;
      }
      
      public function get runecufyh() : int
      {
         return this.mufuquk;
      }
      
      public function set runecufyh(_arg_1:int) : void
      {
         this.mufuquk = _arg_1;
      }
      
      public function get sejukulyq() : int
      {
         return this.byq;
      }
      
      public function set sejukulyq(_arg_1:int) : void
      {
         this.byq = _arg_1;
      }
   }
}

