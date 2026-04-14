package alternativa.tanks.gui.components.indicators
{
   import alternativa.tanks.models.service.ClanNotificationsManager;
   
   public class NewClanMemberIndicator extends LabelNewIndicator
   {
      
      private var userId:String;
      
      private var data:Object;
      
      public function NewClanMemberIndicator(_arg_1:String, _arg_2:Object)
      {
         super();
         this.userId = _arg_1;
         this.data = _arg_2;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanNotificationsManager.userInAcceptedNotifications(this.userId) || this.isNew;
         if(visible && Boolean(stage))
         {
            ClanNotificationsManager.removeAcceptedNotification(this.userId);
            this.isNew = true;
         }
      }
      
      public function get isNew() : Boolean
      {
         return this.data.isNew;
      }
      
      public function set isNew(_arg_1:Boolean) : void
      {
         this.data.isNew = _arg_1;
         visible = _arg_1;
      }
   }
}

