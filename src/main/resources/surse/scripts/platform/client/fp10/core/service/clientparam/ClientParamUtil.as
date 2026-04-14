package platform.client.fp10.core.service.clientparam
{
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   
   public class ClientParamUtil
   {
      
      public function ClientParamUtil()
      {
         super();
      }
      
      public static function collectClientParams() : Dictionary
      {
         var _local_1:Dictionary = new Dictionary();
         var _local_2:Array = Capabilities.version.split(" ");
         if(_local_2.length === 2)
         {
            _local_1[ClientParamEnum.OS] = _local_2[0];
            _local_1[ClientParamEnum.FLASH_PLAYER_VERSION] = _local_2[1];
         }
         _local_1[ClientParamEnum.FLASH_PLAYER_TYPE] = Capabilities.playerType;
         if(ExternalInterface.available)
         {
            _local_1[ClientParamEnum.BROWSER_USER_AGENT] = ExternalInterface.call("window.navigator.userAgent.toString").replace(/;/gi,",");
         }
         return _local_1;
      }
   }
}

