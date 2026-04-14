package projects.tanks.client.clans.panel.notification
{
   public class ClanPanelNotificationCC
   {
      
      private var _numberNotifications:int;
      
      private var _restrictionTimeJoinClanInSec:int;
      
      public function ClanPanelNotificationCC(_arg_1:int = 0, _arg_2:int = 0)
      {
         super();
         this._numberNotifications = _arg_1;
         this._restrictionTimeJoinClanInSec = _arg_2;
      }
      
      public function get numberNotifications() : int
      {
         return this._numberNotifications;
      }
      
      public function set numberNotifications(_arg_1:int) : void
      {
         this._numberNotifications = _arg_1;
      }
      
      public function get restrictionTimeJoinClanInSec() : int
      {
         return this._restrictionTimeJoinClanInSec;
      }
      
      public function set restrictionTimeJoinClanInSec(_arg_1:int) : void
      {
         this._restrictionTimeJoinClanInSec = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanPanelNotificationCC [";
         _local_1 += "numberNotifications = " + this.numberNotifications + " ";
         _local_1 += "restrictionTimeJoinClanInSec = " + this.restrictionTimeJoinClanInSec + " ";
         return _local_1 + "]";
      }
   }
}

