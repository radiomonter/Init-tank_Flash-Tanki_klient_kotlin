package alternativa.tanks.controller.commands
{
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Command;
   import platform.client.fp10.core.service.address.AddressService;
   
   public class ParseUrlParamsCommand extends Command
   {
      
      private static const IFENG_PARAM_PREFIX:String = "ifeng_";
      
      [Inject]
      public var paramsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var launcherParams:ILauncherParams;
      
      [Inject]
      public var addressService:AddressService;
      
      public function ParseUrlParamsCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         dispatch(new NavigationEvent(NavigationEvent.GO_TO_STAND_ALONE_CAPTCHA));
      }
      
      private function parseTutorialHash() : String
      {
         var _local_1:String = this.getAddressParams()["tutorial"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("tutorial");
         }
         return _local_1;
      }
      
      private function parseReferralHash() : String
      {
         var _local_1:String = this.getAddressParams()["friend"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("friend");
         }
         return _local_1;
      }
      
      private function parseEmail() : String
      {
         var _local_1:String = this.getAddressParams()["userEmail"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("userEmail");
         }
         return _local_1;
      }
      
      private function parseEntranceHash() : String
      {
         var _local_1:String = this.getAddressParams()["hash"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("hash");
         }
         return _local_1;
      }
      
      private function parseSingleUseHash() : String
      {
         var _local_1:String = this.getAddressParams()["singleUseHash"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("singleUseHash");
         }
         return _local_1;
      }
      
      private function parseEmailConfirmHash() : String
      {
         var _local_1:String = this.getAddressParams()["emailConfirmHash"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("emailConfirmHash");
         }
         return _local_1;
      }
      
      private function parseEmailChangeHash() : String
      {
         var _local_1:String = this.getAddressParams()["emailChangeHash"];
         if(_local_1 == null)
         {
            _local_1 = this.launcherParams.getParameter("emailChangeHash");
         }
         return _local_1;
      }
      
      private function getAddressParams() : Dictionary
      {
         var _local_1:String = null;
         var _local_2:Array = null;
         var _local_3:int = 0;
         var _local_4:Array = null;
         var _local_5:Dictionary = new Dictionary();
         if(this.addressService != null)
         {
            _local_1 = this.addressService.getValue();
            if(_local_1 != null)
            {
               _local_2 = _local_1.split("&");
               _local_3 = 0;
               while(_local_3 < _local_2.length)
               {
                  _local_4 = (_local_2[_local_3] as String).split("=");
                  _local_5[_local_4[0]] = _local_4[1];
                  _local_3++;
               }
            }
         }
         return _local_5;
      }
   }
}

