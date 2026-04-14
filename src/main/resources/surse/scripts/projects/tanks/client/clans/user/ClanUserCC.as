package projects.tanks.client.clans.user
{
   public class ClanUserCC
   {
      
      private var _clan:Boolean;
      
      private var _giveBonusesClan:Boolean;
      
      private var _loadingInServiceSpace:Boolean;
      
      private var _restrictionTimeJoinClanInSec:int;
      
      private var _showBuyLicenseButton:Boolean;
      
      private var _showOtherClan:Boolean;
      
      public function ClanUserCC(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:Boolean = false, _arg_4:int = 0, _arg_5:Boolean = false, _arg_6:Boolean = false)
      {
         super();
         this._clan = _arg_1;
         this._giveBonusesClan = _arg_2;
         this._loadingInServiceSpace = _arg_3;
         this._restrictionTimeJoinClanInSec = _arg_4;
         this._showBuyLicenseButton = _arg_5;
         this._showOtherClan = _arg_6;
      }
      
      public function get clan() : Boolean
      {
         return this._clan;
      }
      
      public function set clan(_arg_1:Boolean) : void
      {
         this._clan = _arg_1;
      }
      
      public function get giveBonusesClan() : Boolean
      {
         return this._giveBonusesClan;
      }
      
      public function set giveBonusesClan(_arg_1:Boolean) : void
      {
         this._giveBonusesClan = _arg_1;
      }
      
      public function get loadingInServiceSpace() : Boolean
      {
         return this._loadingInServiceSpace;
      }
      
      public function set loadingInServiceSpace(_arg_1:Boolean) : void
      {
         this._loadingInServiceSpace = _arg_1;
      }
      
      public function get restrictionTimeJoinClanInSec() : int
      {
         return this._restrictionTimeJoinClanInSec;
      }
      
      public function set restrictionTimeJoinClanInSec(_arg_1:int) : void
      {
         this._restrictionTimeJoinClanInSec = _arg_1;
      }
      
      public function get showBuyLicenseButton() : Boolean
      {
         return this._showBuyLicenseButton;
      }
      
      public function set showBuyLicenseButton(_arg_1:Boolean) : void
      {
         this._showBuyLicenseButton = _arg_1;
      }
      
      public function get showOtherClan() : Boolean
      {
         return this._showOtherClan;
      }
      
      public function set showOtherClan(_arg_1:Boolean) : void
      {
         this._showOtherClan = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanUserCC [";
         _local_1 += "clan = " + this.clan + " ";
         _local_1 += "giveBonusesClan = " + this.giveBonusesClan + " ";
         _local_1 += "loadingInServiceSpace = " + this.loadingInServiceSpace + " ";
         _local_1 += "restrictionTimeJoinClanInSec = " + this.restrictionTimeJoinClanInSec + " ";
         _local_1 += "showBuyLicenseButton = " + this.showBuyLicenseButton + " ";
         _local_1 += "showOtherClan = " + this.showOtherClan + " ";
         return _local_1 + "]";
      }
   }
}

