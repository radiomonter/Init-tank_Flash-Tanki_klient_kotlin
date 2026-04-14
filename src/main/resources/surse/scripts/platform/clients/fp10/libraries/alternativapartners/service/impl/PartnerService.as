package platform.clients.fp10.libraries.alternativapartners.service.impl
{
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogService;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.client.fp10.core.type.IGameObject;
   import platform.clients.fp10.libraries.alternativapartners.models.socialnetworkparameters.SocialNetworkParameters;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import platform.clients.fp10.libraries.alternativapartners.type.IPartner;
   
   public class PartnerService implements IPartnerService
   {
      
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var log:LogService;
      
      [Inject]
      public static var paramsService:ILauncherParams;
      
      private var _partner:IPartner;
      
      private var _hasOwnPaymentSystem:Boolean = false;
      
      private var _hasSocialFunction:Boolean = false;
      
      public function PartnerService()
      {
         super();
      }
      
      public function isRunningInsidePartnerEnvironment() : Boolean
      {
         var _local_1:String = this.getEnvironmentPartnerId();
         return Boolean(_local_1);
      }
      
      public function getEnvironmentPartnerId() : String
      {
         var _local_1:String = addressService.getQueryParameter("partnerId");
         if(!_local_1)
         {
            _local_1 = paramsService.getParameter("partnerId");
            if(!_local_1)
            {
               _local_1 = "";
            }
         }
         return _local_1.toLowerCase();
      }
      
      public function hasPaymentAction() : Boolean
      {
         return Boolean(this._partner) ? Boolean(this._partner.hasPaymentAction()) : Boolean(false);
      }
      
      public function makePaymentAction() : void
      {
         if(Boolean(this._partner))
         {
            this._partner.paymentAction();
         }
      }
      
      public function hasOwnPaymentSystem() : Boolean
      {
         return this._hasOwnPaymentSystem;
      }
      
      public function hasSocialFunction() : Boolean
      {
         return this._hasSocialFunction;
      }
      
      public function getFailRedirectUrl() : String
      {
         return Boolean(this._partner) ? this._partner.getFailRedirectUrl() : "";
      }
      
      public function isExternalLoginAllowed() : Boolean
      {
         return Boolean(this._partner) ? Boolean(this._partner.isExternalLoginAllowed()) : Boolean(true);
      }
      
      public function setPartner(_arg_1:IGameObject) : void
      {
         this._partner = IPartner(_arg_1.adapt(IPartner));
         this._hasOwnPaymentSystem = SocialNetworkParameters(_arg_1.adapt(SocialNetworkParameters)).hasOwnPaymentSystem();
         this._hasSocialFunction = SocialNetworkParameters(_arg_1.adapt(SocialNetworkParameters)).hasSocialFunction();
      }
      
      public function hasRatings() : Boolean
      {
         return Boolean(this._partner) ? Boolean(this._partner.hasRatings()) : Boolean(false);
      }
      
      public function isRunningInside(_arg_1:String) : Boolean
      {
         var _local_2:String = this.getEnvironmentPartnerId();
         if(_local_2 == null)
         {
            return null;
         }
         return _local_2.toLocaleLowerCase() == _arg_1.toLocaleLowerCase();
      }
   }
}

