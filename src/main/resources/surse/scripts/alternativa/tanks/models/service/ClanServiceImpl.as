package alternativa.tanks.models.service
{
   import alternativa.tanks.gui.clanmanagement.ClanManagementPanel;
   import alternativa.tanks.gui.notinclan.NotInClanPanel;
   import alternativa.tanks.models.panel.clanpanel.IClanPanelModel;
   import alternativa.tanks.service.panel.IPanelView;
   import flash.events.EventDispatcher;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class ClanServiceImpl extends EventDispatcher implements ClanService, OnConnectionClosedServiceListener
   {
      
      [Inject]
      public static var panelView:IPanelView;
      
      private var _clanMembers:Vector.<String>;
      
      private var _name:String;
      
      private var _tag:String;
      
      private var _creationDate:String;
      
      private var _creatorId:String;
      
      private var _clanPanelModel:IClanPanelModel;
      
      private var _clanObject:IGameObject;
      
      private var _isSelf:Boolean;
      
      private var _isBlocked:Boolean;
      
      private var _notInClanPanel:NotInClanPanel;
      
      private var _clanManagementPanel:ClanManagementPanel;
      
      private var _minRankForCreateClan:int;
      
      private var _minRankForRequest:int;
      
      private var _requestsEnabled:Boolean;
      
      private var _maxCharactersDescription:int;
      
      public function ClanServiceImpl()
      {
         super();
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         this.clanMembers = new Vector.<String>();
      }
      
      public function unloadMembers() : void
      {
         this.clanMembers = new Vector.<String>();
      }
      
      public function get clanMembers() : Vector.<String>
      {
         return this._clanMembers;
      }
      
      public function set clanMembers(_arg_1:Vector.<String>) : void
      {
         this._clanMembers = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
      
      public function set tag(_arg_1:String) : void
      {
         this._tag = _arg_1;
      }
      
      public function updateClanInfo(_arg_1:String, _arg_2:int, _arg_3:ClanFlag, _arg_4:Boolean) : void
      {
         dispatchEvent(new ClanServiceUpdateEvent(ClanServiceUpdateEvent.UPDATE,_arg_1,_arg_2,_arg_3,_arg_4));
      }
      
      public function get clanObject() : IGameObject
      {
         return this._clanObject;
      }
      
      public function set clanObject(_arg_1:IGameObject) : void
      {
         this._clanObject = _arg_1;
         this._clanManagementPanel = new ClanManagementPanel(this._clanObject);
      }
      
      public function objectUnloaded() : void
      {
         this._clanObject = null;
         this._clanManagementPanel.destroy();
      }
      
      public function maxMembers() : void
      {
         this._clanManagementPanel.maxMembers();
      }
      
      public function get clanManagementPanel() : ClanManagementPanel
      {
         return this._clanManagementPanel;
      }
      
      public function get creatorId() : String
      {
         return this._creatorId;
      }
      
      public function set creatorId(_arg_1:String) : void
      {
         this._creatorId = _arg_1;
      }
      
      public function get creationDate() : String
      {
         return this._creationDate;
      }
      
      public function set creationDate(_arg_1:String) : void
      {
         this._creationDate = _arg_1;
      }
      
      public function get isSelf() : Boolean
      {
         return this._isSelf;
      }
      
      public function set isSelf(_arg_1:Boolean) : void
      {
         this._isSelf = _arg_1;
      }
      
      public function get membersCount() : int
      {
         return this.clanMembers.length;
      }
      
      public function get isBlocked() : Boolean
      {
         return this._isBlocked;
      }
      
      public function set isBlocked(_arg_1:Boolean) : void
      {
         this._isBlocked = _arg_1;
      }
      
      public function clanBlock(_arg_1:String) : void
      {
         this._isBlocked = true;
         dispatchEvent(new ClanServiceEvent(ClanServiceEvent.CLAN_BLOCK,_arg_1));
      }
      
      public function set minRankForCreateClan(_arg_1:int) : void
      {
         this._minRankForCreateClan = _arg_1;
      }
      
      public function get minRankForCreateClan() : int
      {
         return this._minRankForCreateClan;
      }
      
      public function get notInClanPanel() : NotInClanPanel
      {
         return this._notInClanPanel;
      }
      
      public function set notInClanPanel(_arg_1:NotInClanPanel) : void
      {
         this._notInClanPanel = _arg_1;
      }
      
      public function get clanPanelModel() : IClanPanelModel
      {
         return this._clanPanelModel;
      }
      
      public function set clanPanelModel(_arg_1:IClanPanelModel) : void
      {
         this._clanPanelModel = _arg_1;
      }
      
      public function get minRankForRequest() : int
      {
         return this._minRankForRequest;
      }
      
      public function set minRankForRequest(_arg_1:int) : void
      {
         this._minRankForRequest = _arg_1;
      }
      
      public function get requestsEnabled() : Boolean
      {
         return this._requestsEnabled;
      }
      
      public function set requestsEnabled(_arg_1:Boolean) : void
      {
         this._requestsEnabled = _arg_1;
      }
      
      public function get maxCharactersDescription() : int
      {
         return this._maxCharactersDescription;
      }
      
      public function set maxCharactersDescription(_arg_1:int) : void
      {
         this._maxCharactersDescription = _arg_1;
      }
   }
}

