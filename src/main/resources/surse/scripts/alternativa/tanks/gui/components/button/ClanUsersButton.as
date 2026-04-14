package alternativa.tanks.gui.components.button
{
   import alternativa.tanks.gui.IClanNotificationListener;
   import alternativa.tanks.gui.clanmanagement.ClanStateButton;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.models.service.ClanService;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.RestrictionJoinClanEvent;
   
   public class ClanUsersButton extends ClanStateButton implements IClanNotificationListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      public static var AttentionIconClass:Class = ClanUsersButton_AttentionIconClass;
      
      private var _attentionIcon:Bitmap = new AttentionIconClass() as Bitmap;
      
      public function ClanUsersButton()
      {
         super();
         addChild(this._attentionIcon);
         this._attentionIcon.y = -6;
         clanUserInfoService.addEventListener(RestrictionJoinClanEvent.UPDATE,this.updateRestriction);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this._attentionIcon.x = width - 10;
      }
      
      override public function set enable(_arg_1:Boolean) : void
      {
         super.enable = _arg_1;
         this.updateNotifications();
      }
      
      public function updateNotifications() : void
      {
         this._attentionIcon.visible = ClanNotificationsManager.acceptedAndIncomingCount() > 0 && this.enable;
      }
      
      private function updateRestriction(_arg_1:RestrictionJoinClanEvent) : void
      {
         this.updateNotifications();
      }
   }
}

