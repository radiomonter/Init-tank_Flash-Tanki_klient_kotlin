package alternativa.tanks.gui.components.indicators
{
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   
   public class NewClanItemIndicator extends LabelNewIndicator
   {
      
      private var clanId:String;
      
      public function NewClanItemIndicator(_arg_1:String)
      {
         super();
         this.clanId = _arg_1;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanUserNotificationsManager.clanInIncomingNotifications(this.clanId);
      }
   }
}

