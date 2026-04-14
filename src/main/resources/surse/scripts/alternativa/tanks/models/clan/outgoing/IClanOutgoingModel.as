package alternativa.tanks.models.clan.outgoing
{
   import alternativa.tanks.gui.clanmanagement.ClanOutgoingRequestsDialog;
   
   [ModelInterface]
   public interface IClanOutgoingModel
   {
      
      function setClanOutgoingWindow(param1:ClanOutgoingRequestsDialog) : void;
      
      function getUsers() : Vector.<String>;
   }
}

