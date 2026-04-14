package projects.tanks.client.battleservice.model.statistics
{
   public class Jomyceju
   {
      
      private var byq:int;
      
      private var mufuquk:int;
      
      private var _reward:int;
      
      private var _userId:String;
      
      public function Jomyceju(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:String = null)
      {
         super();
         this.byq = _arg_1;
         this.mufuquk = _arg_2;
         this._reward = _arg_3;
         this._userId = _arg_4;
      }
      
      public function get sejukulyq() : int
      {
         return this.byq;
      }
      
      public function set sejukulyq(_arg_1:int) : void
      {
         this.byq = _arg_1;
      }
      
      public function get runecufyh() : int
      {
         return this.mufuquk;
      }
      
      public function set runecufyh(_arg_1:int) : void
      {
         this.mufuquk = _arg_1;
      }
      
      public function get bejo() : int
      {
         return this._reward;
      }
      
      public function set bejo(_arg_1:int) : void
      {
         this._reward = _arg_1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "UserReward [";
         _local_1 += "newbiesAbonementBonusReward = " + this.sejukulyq + " ";
         _local_1 += "premiumBonusReward = " + this.runecufyh + " ";
         _local_1 += "reward = " + this.bejo + " ";
         _local_1 += "userId = " + this.userId + " ";
         return _local_1 + "]";
      }
   }
}

