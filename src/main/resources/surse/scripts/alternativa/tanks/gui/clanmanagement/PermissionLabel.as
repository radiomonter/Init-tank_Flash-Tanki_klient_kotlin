package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ContextMenuPermissionLabel;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   
   public class PermissionLabel extends ContextMenuPermissionLabel
   {
      
      public function PermissionLabel(_arg_1:ClanPermission, _arg_2:Object, _arg_3:String, _arg_4:String)
      {
         super(_arg_1);
         this.data = _arg_2;
         this.id = _arg_3;
         this.currentUserId = _arg_4;
         this.contextItem = false;
         ClanPermissionsManager.addPositionUpdateListener(this);
      }
   }
}

