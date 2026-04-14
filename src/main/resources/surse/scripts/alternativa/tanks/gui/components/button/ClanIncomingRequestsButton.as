package alternativa.tanks.gui.components.button
{
   import alternativa.tanks.gui.IClanNotificationListener;
   import alternativa.tanks.gui.clanmanagement.ClanUsersWindow;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   
   public class ClanIncomingRequestsButton extends ClanButtonActionListener implements IClanNotificationListener
   {
      
      private static const MARGIN:int = 11;
      
      private static const FRAME:int = 7;
      
      private var outgoingButton:ClanButtonActionListener;
      
      private var usersWindow:ClanUsersWindow;
      
      private var requestCountIndicator:RequestCountIndicator = new RequestCountIndicator();
      
      public function ClanIncomingRequestsButton(_arg_1:ClanButtonActionListener, _arg_2:ClanUsersWindow)
      {
         super(ClanAction.ADDING_TO_CLAN);
         this.outgoingButton = _arg_1;
         this.usersWindow = _arg_2;
         addChild(this.requestCountIndicator);
         this.requestCountIndicator.y = -6;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this.requestCountIndicator.x = width + 3;
      }
      
      override public function updateActions() : void
      {
         super.updateActions();
         this.outgoingButton.x = (visible ? x : this.usersWindow.width - MARGIN) - FRAME - this.outgoingButton.width;
      }
      
      public function updateNotifications() : void
      {
         var _local_1:int = ClanNotificationsManager.incomingNotificationsCount();
         this.requestCountIndicator.count = _local_1;
      }
   }
}

