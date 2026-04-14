package alternativa.tanks.model.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   
   public class SocialNetworkPanelModel
   {
      
      [Inject]
      public static var socialNetworkService:ISocialNetworkPanelService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      public var data:SocialNetworkPanelCC;
      
      public function SocialNetworkPanelModel()
      {
         super();
      }
      
      public function objectLoaded(_arg_1:SocialNetworkPanelCC) : void
      {
         this.data = _arg_1;
         socialNetworkService.passwordCreated = _arg_1.passwordCreated;
         socialNetworkService.dekafa = this.getLinkExists("vkontakte");
         socialNetworkService.kuzu = this.getLinkExists("facebook");
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.CREATE_LINK,this.onCreateLink);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK,this.onUnlink);
      }
      
      public function objectUnloaded() : void
      {
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.CREATE_LINK,this.onCreateLink);
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.UNLINK,this.onUnlink);
      }
      
      private function onUnlink(_arg_1:SocialNetworkServiceEvent) : void
      {
         if(socialNetworkService.passwordCreated)
         {
            Network(OSGi.getInstance().getService(INetworker)).send("lobby;unlink_account;" + _arg_1.socialNetworkId);
         }
         else
         {
            alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ACCOUNT_CANT_BE_UNLINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(_arg_1.socialNetworkId)),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
         }
      }
      
      private function onCreateLink(_arg_1:SocialNetworkServiceEvent) : void
      {
         this.goToURL(this.getAuthorizationUrl(_arg_1.socialNetworkId));
      }
      
      private function getAuthorizationUrl(_arg_1:String) : String
      {
         var _local_2:SocialNetworkPanelParams = null;
         for each(_local_2 in this.data.socialNetworkParams)
         {
            if(_local_2.snId == _arg_1)
            {
               return _local_2.authorizationUrl;
            }
         }
         return "";
      }
      
      private function getLinkExists(_arg_1:String) : Boolean
      {
         var _local_2:SocialNetworkPanelParams = null;
         for each(_local_2 in this.data.socialNetworkParams)
         {
            if(_local_2.snId == _arg_1)
            {
               return _local_2.linkExists;
            }
         }
         return false;
      }
      
      private function goToURL(_arg_1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("newPopup",_arg_1);
         }
         else
         {
            navigateToURL(new URLRequest(_arg_1));
         }
      }
      
      public function validationFailed() : void
      {
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ACCOUNT_LINKING_ERROR),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function linkAlreadyExists(_arg_1:String) : void
      {
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ACCOUNT_ALREADY_LINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(_arg_1)),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function linkCreated(_arg_1:String) : void
      {
         socialNetworkService.wihog(_arg_1);
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ACCOUNT_SUCCESS_LINKED),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
      
      public function unlinkSuccess(_arg_1:String) : void
      {
         socialNetworkService.noguw(_arg_1);
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ACCOUNT_UNLINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(_arg_1)),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
      }
   }
}

