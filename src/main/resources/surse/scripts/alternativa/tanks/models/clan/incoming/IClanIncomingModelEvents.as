package alternativa.tanks.models.clan.incoming
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanIncomingModelEvents implements IClanIncomingModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanIncomingModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getUsers() : Vector.<String>
      {
         var result:Vector.<String> = null;
         var i:int = 0;
         var m:IClanIncomingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanIncomingModel(this.impl[i]);
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
      
      public function setClanIncomingWindow(window:ClanIncomingRequestsDialog) : void
      {
         var i:int = 0;
         var m:IClanIncomingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanIncomingModel(this.impl[i]);
               m.setClanIncomingWindow(window);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

