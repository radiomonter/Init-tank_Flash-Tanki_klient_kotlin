package alternativa.tanks.models.clan.incoming
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   
   [ModelInterface]
   public interface IClanIncomingModel
   {
      
      function getUsers() : Vector.<String>;
      
      function setClanIncomingWindow(param1:ClanIncomingRequestsDialog) : void;
   }
}

