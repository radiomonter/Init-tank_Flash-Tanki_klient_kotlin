package alternativa.tanks.models.clan.outgoing
{
   import alternativa.tanks.gui.clanmanagement.ClanOutgoingRequestsDialog;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanOutgoingModelEvents implements IClanOutgoingModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanOutgoingModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function setClanOutgoingWindow(clanOutgoingWindow:ClanOutgoingRequestsDialog) : void
      {
         var i:int = 0;
         var m:IClanOutgoingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanOutgoingModel(this.impl[i]);
               m.setClanOutgoingWindow(clanOutgoingWindow);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getUsers() : Vector.<String>
      {
         var result:Vector.<String> = null;
         var i:int = 0;
         var m:IClanOutgoingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanOutgoingModel(this.impl[i]);
               result = m.getUsers();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

