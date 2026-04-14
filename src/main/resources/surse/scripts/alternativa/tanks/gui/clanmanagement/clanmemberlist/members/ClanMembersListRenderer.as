package alternativa.tanks.gui.clanmanagement.clanmemberlist.members
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanUserListRenderer;
   import flash.events.MouseEvent;
   
   public class ClanMembersListRenderer extends ClanUserListRenderer
   {
      
      public function ClanMembersListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         item = new ClanMemberItem(_arg_1);
         super.data = _arg_1;
      }
      
      override protected function onRollOut(_arg_1:MouseEvent) : void
      {
         item.deleteIndicator.visible = false;
         var _local_2:ClanMemberItem = ClanMemberItem(item);
         if(!_local_2)
         {
            super.onRollOut(_arg_1);
            return;
         }
         _local_2.newIndicator.updateNotifications();
         super.onRollOut(_arg_1);
      }
      
      override protected function onRollOver(_arg_1:MouseEvent) : void
      {
         var _local_2:ClanMemberItem = ClanMemberItem(item);
         if(!_local_2)
         {
            super.onRollOver(_arg_1);
            return;
         }
         _local_2.newIndicator.visible = false;
         super.onRollOver(_arg_1);
      }
   }
}

