package alternativa.tanks.models.user
{
   import alternativa.tanks.models.user.incoming.IClanUserIncomingModel;
   import alternativa.tanks.models.user.outgoing.IClanUserOutgoingModel;
   import flash.events.EventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class ClanUserServiceImpl extends EventDispatcher implements ClanUserService
   {
      
      private var _userObject:IGameObject;
      
      private var _hasClanLicense:Boolean;
      
      private var _licenseGarageObject:IGameObject;
      
      private var _otherClan:Boolean;
      
      private var _showBuyLicenseButton:Boolean;
      
      public function ClanUserServiceImpl()
      {
         super();
      }
      
      public function get userObject() : IGameObject
      {
         return this._userObject;
      }
      
      public function set userObject(_arg_1:IGameObject) : void
      {
         this._userObject = _arg_1;
      }
      
      public function getObjectById(_arg_1:String) : IGameObject
      {
         return null;
      }
      
      public function get hasClanLicense() : Boolean
      {
         return this._hasClanLicense;
      }
      
      public function set hasClanLicense(_arg_1:Boolean) : void
      {
         this._hasClanLicense = _arg_1;
      }
      
      public function get licenseGarageObject() : IGameObject
      {
         return this._licenseGarageObject;
      }
      
      public function set licenseGarageObject(_arg_1:IGameObject) : void
      {
         this._licenseGarageObject = _arg_1;
      }
      
      public function get otherClan() : Boolean
      {
         return this._otherClan;
      }
      
      public function set otherClan(_arg_1:Boolean) : void
      {
         this._otherClan = _arg_1;
      }
      
      public function get showBuyLicenseButton() : Boolean
      {
         return this._showBuyLicenseButton;
      }
      
      public function set showBuyLicenseButton(_arg_1:Boolean) : void
      {
         this._showBuyLicenseButton = _arg_1;
      }
      
      public function containsClanInOutgoing(_arg_1:String) : Boolean
      {
         var _local_2:Vector.<String> = IClanUserOutgoingModel(this._userObject.adapt(IClanUserOutgoingModel)).getOutgoingClans();
         return this.containsClan(_local_2,_arg_1);
      }
      
      public function getIncomingClanNames(_arg_1:String) : Boolean
      {
         var _local_2:Vector.<String> = IClanUserIncomingModel(this._userObject.adapt(IClanUserIncomingModel)).getIncomingClans();
         return this.containsClan(_local_2,_arg_1);
      }
      
      private function containsClan(_arg_1:Vector.<String>, _arg_2:String) : Boolean
      {
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_3:ISpace = this._userObject.space;
         return false;
      }
      
      public function hideNotInClanPanel() : void
      {
         dispatchEvent(new ClanUserServiceEvent(ClanUserServiceEvent.HIDE_CLAN_WINDOW));
      }
   }
}

