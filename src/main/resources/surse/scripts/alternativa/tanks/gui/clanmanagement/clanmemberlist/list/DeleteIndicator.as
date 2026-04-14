package alternativa.tanks.gui.clanmanagement.clanmemberlist.list
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.IClanActionListener;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.foreignclan.ForeignClanService;
   import base.DiscreteSprite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   public class DeleteIndicator extends DiscreteSprite implements IClanActionListener
   {
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var clanMembersData:ClanMembersDataService;
      
      [Inject]
      public static var foreignClanService:ForeignClanService;
      
      private static var deleteIconClass:Class = DeleteIndicator_deleteIconClass;
      
      private static var deleteIconBitmapData:BitmapData = Bitmap(new deleteIconClass()).bitmapData;
      
      private var invisible:Boolean;
      
      private var userId:String;
      
      private var currentUserId:String;
      
      public function DeleteIndicator(_arg_1:Boolean = false, _arg_2:String = null, _arg_3:String = null)
      {
         super();
         this.userId = _arg_2;
         this.currentUserId = _arg_3;
         this.tabChildren = false;
         this.tabEnabled = false;
         this.buttonMode = this.useHandCursor = true;
         this.invisible = _arg_1;
         var _local_4:Bitmap = new Bitmap(deleteIconBitmapData);
         addChild(_local_4);
      }
      
      public function updateActions() : void
      {
         visible = !this.invisible && clanUserInfoService.hasAction(ClanAction.REMOVE_FROM_CLAN) && this.deleteAllowed() && !foreignClanService.isShowForeignClan();
      }
      
      private function deleteAllowed() : Boolean
      {
         if(this.userId == null || this.currentUserId == null)
         {
            return true;
         }
         return clanMembersData.getPermission(this.currentUserId).value < clanMembersData.getPermission(this.userId).value;
      }
   }
}

