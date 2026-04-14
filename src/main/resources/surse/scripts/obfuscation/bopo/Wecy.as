package obfuscation.bopo
{
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Wecy
   {
      
      private var _autoBalance:Boolean;
      
      private var hahe:Boolean;
      
      private var wosemaliw:int;
      
      private var rylo:int;
      
      private var bemybyv:Vector.<BattleInfoUser>;
      
      private var cekuciz:Vector.<BattleInfoUser>;
      
      public function Wecy(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:int = 0, _arg_4:int = 0, _arg_5:Vector.<BattleInfoUser> = null, _arg_6:Vector.<BattleInfoUser> = null)
      {
         super();
         this._autoBalance = _arg_1;
         this.hahe = _arg_2;
         this.wosemaliw = _arg_3;
         this.rylo = _arg_4;
         this.bemybyv = _arg_5;
         this.cekuciz = _arg_6;
      }
      
      public function get autoBalance() : Boolean
      {
         return this._autoBalance;
      }
      
      public function set autoBalance(_arg_1:Boolean) : void
      {
         this._autoBalance = _arg_1;
      }
      
      public function get friendlyFire() : Boolean
      {
         return this.hahe;
      }
      
      public function set friendlyFire(_arg_1:Boolean) : void
      {
         this.hahe = _arg_1;
      }
      
      public function get scoreBlue() : int
      {
         return this.wosemaliw;
      }
      
      public function set scoreBlue(_arg_1:int) : void
      {
         this.wosemaliw = _arg_1;
      }
      
      public function get scoreRed() : int
      {
         return this.rylo;
      }
      
      public function set scoreRed(_arg_1:int) : void
      {
         this.rylo = _arg_1;
      }
      
      public function get usersBlue() : Vector.<BattleInfoUser>
      {
         return this.bemybyv;
      }
      
      public function set usersBlue(_arg_1:Vector.<BattleInfoUser>) : void
      {
         this.bemybyv = _arg_1;
      }
      
      public function get usersRed() : Vector.<BattleInfoUser>
      {
         return this.cekuciz;
      }
      
      public function set usersRed(_arg_1:Vector.<BattleInfoUser>) : void
      {
         this.cekuciz = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TeamBattleInfoCC [";
         _local_1 += "autoBalance = " + this.autoBalance + " ";
         _local_1 += "friendlyFire = " + this.friendlyFire + " ";
         _local_1 += "scoreBlue = " + this.scoreBlue + " ";
         _local_1 += "scoreRed = " + this.scoreRed + " ";
         _local_1 += "usersBlue = " + this.usersBlue + " ";
         _local_1 += "usersRed = " + this.usersRed + " ";
         return _local_1 + "]";
      }
   }
}

