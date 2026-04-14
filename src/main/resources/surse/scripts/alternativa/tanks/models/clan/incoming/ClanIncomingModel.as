package alternativa.tanks.models.clan.incoming
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.clans.clan.incoming.ClanIncomingModelBase;
   import projects.tanks.client.clans.clan.incoming.IClanIncomingModelBase;
   
   [ModelInfo]
   public class ClanIncomingModel extends ClanIncomingModelBase implements IClanIncomingModelBase, IClanIncomingModel, ObjectLoadListener
   {
      
      private var _users:Vector.<String>;
      
      private var _incomingWindow:ClanIncomingRequestsDialog;
      
      public function ClanIncomingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this._users = getInitParam().objects.concat();
      }
      
      public function onAdding(_arg_1:String) : void
      {
         this._users.push(_arg_1);
         if(this._incomingWindow != null)
         {
            this._incomingWindow.addUser(_arg_1);
         }
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         var _local_2:Number = this._users.indexOf(_arg_1);
         this._users.splice(_local_2,1);
         if(this._incomingWindow != null)
         {
            this._incomingWindow.removeUser(_arg_1);
         }
      }
      
      public function getUsers() : Vector.<String>
      {
         return this._users;
      }
      
      public function setClanIncomingWindow(_arg_1:ClanIncomingRequestsDialog) : void
      {
         this._incomingWindow = _arg_1;
      }
   }
}

