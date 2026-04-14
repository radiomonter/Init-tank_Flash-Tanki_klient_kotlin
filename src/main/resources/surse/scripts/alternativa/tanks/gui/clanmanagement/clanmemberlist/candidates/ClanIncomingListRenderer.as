package alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.*;
   import flash.events.MouseEvent;
   
   public class ClanIncomingListRenderer extends ClanUserListRenderer
   {
      
      public function ClanIncomingListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         item = new ClanIncomingRequestItem(_arg_1.id);
         super.data = _arg_1;
      }
      
      override protected function onRollOut(_arg_1:MouseEvent) : void
      {
         item.deleteIndicator.visible = false;
         item.acceptedIndicator.visible = false;
         ClanIncomingRequestItem(item).newIndicator.show();
         ClanIncomingRequestItem(item).newIndicator.updateNotifications();
         super.onRollOut(_arg_1);
      }
      
      override protected function onRollOver(_arg_1:MouseEvent) : void
      {
         item.acceptedIndicator.visible = true;
         ClanIncomingRequestItem(item).newIndicator.hide();
         ClanIncomingRequestItem(item).newIndicator.updateNotifications();
         super.onRollOver(_arg_1);
      }
   }
}

