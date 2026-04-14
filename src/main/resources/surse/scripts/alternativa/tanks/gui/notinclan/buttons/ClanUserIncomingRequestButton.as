package alternativa.tanks.gui.notinclan.buttons
{
   import alternativa.tanks.gui.IClanNotificationListener;
   import alternativa.tanks.gui.components.button.RequestCountIndicator;
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import controls.base.TankDefaultButton;
   
   public class ClanUserIncomingRequestButton extends TankDefaultButton implements IClanNotificationListener
   {
      
      private var requestCountIndicator:RequestCountIndicator = new RequestCountIndicator();
      
      public function ClanUserIncomingRequestButton()
      {
         super();
         ClanUserNotificationsManager.addIncomingIndicatorListener(this);
         addChild(this.requestCountIndicator);
         this.requestCountIndicator.y = -6;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this.requestCountIndicator.x = width + 3;
      }
      
      override public function set enable(_arg_1:Boolean) : void
      {
         super.enable = _arg_1;
         this.requestCountIndicator.visible = _arg_1 && ClanUserNotificationsManager.getIncomingNotificationsCount() > 0;
      }
      
      public function updateNotifications() : void
      {
         var _local_1:int = ClanUserNotificationsManager.getIncomingNotificationsCount();
         this.requestCountIndicator.count = _local_1;
      }
      
      public function destroy() : void
      {
         ClanUserNotificationsManager.removeIncomingIndicatorListener(this);
      }
   }
}

