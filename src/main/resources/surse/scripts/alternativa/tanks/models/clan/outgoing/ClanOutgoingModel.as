package alternativa.tanks.models.clan.outgoing
{
   import alternativa.tanks.gui.clanmanagement.ClanOutgoingRequestsDialog;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.clans.clan.outgoing.ClanOutgoingModelBase;
   import projects.tanks.client.clans.clan.outgoing.IClanOutgoingModelBase;
   
   [ModelInfo]
   public class ClanOutgoingModel extends ClanOutgoingModelBase implements IClanOutgoingModelBase, IClanOutgoingModel, ObjectLoadListener
   {
      
      private var _outgoingWindow:ClanOutgoingRequestsDialog;
      
      private var _users:Vector.<String> = new Vector.<String>();
      
      public function ClanOutgoingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this._users = getInitParam().objects.concat();
      }
      
      public function setClanOutgoingWindow(_arg_1:ClanOutgoingRequestsDialog) : void
      {
         this._outgoingWindow = _arg_1;
      }
      
      public function onAdding(_arg_1:String) : void
      {
         this._users.push(_arg_1);
         if(this._outgoingWindow != null)
         {
            this._outgoingWindow.addUser(_arg_1);
         }
      }
      
      public function onRemoved(_arg_1:String) : void
      {
         var _local_2:Number = this._users.indexOf(_arg_1);
         this._users.splice(_local_2,1);
         if(this._outgoingWindow != null)
         {
            this._outgoingWindow.removeUser(_arg_1);
         }
      }
      
      public function getUsers() : Vector.<String>
      {
         return this._users;
      }
   }
}

