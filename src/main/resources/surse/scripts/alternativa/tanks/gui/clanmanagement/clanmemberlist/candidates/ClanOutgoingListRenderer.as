package alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.*;
   
   public class ClanOutgoingListRenderer extends ClanUserListRenderer
   {
      
      public function ClanOutgoingListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         item = new ClanOutgoingRequestsItem(_arg_1.id);
         super.data = _arg_1;
      }
   }
}

