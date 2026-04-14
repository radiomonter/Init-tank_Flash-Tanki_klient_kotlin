package alternativa.tanks.models.clan.outgoing
{
   import alternativa.tanks.gui.clanmanagement.ClanOutgoingRequestsDialog;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanOutgoingModelAdapt implements IClanOutgoingModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanOutgoingModel;
      
      public function IClanOutgoingModelAdapt(_arg_1:IGameObject, _arg_2:IClanOutgoingModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function setClanOutgoingWindow(clanOutgoingWindow:ClanOutgoingRequestsDialog) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.setClanOutgoingWindow(clanOutgoingWindow);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getUsers() : Vector.<String>
      {
         var result:Vector.<String> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsers();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

