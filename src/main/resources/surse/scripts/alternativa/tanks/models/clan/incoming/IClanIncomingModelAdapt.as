package alternativa.tanks.models.clan.incoming
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanIncomingModelAdapt implements IClanIncomingModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanIncomingModel;
      
      public function IClanIncomingModelAdapt(_arg_1:IGameObject, _arg_2:IClanIncomingModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
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
      
      public function setClanIncomingWindow(window:ClanIncomingRequestsDialog) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.setClanIncomingWindow(window);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

