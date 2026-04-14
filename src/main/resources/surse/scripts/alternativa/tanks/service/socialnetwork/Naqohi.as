package alternativa.tanks.service.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   
   public class Naqohi extends EventDispatcher implements ISocialNetworkPanelService
   {
      
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      private const VKONTAKTE:String = "vkontakte";
      
      private const FACEBOOK:String = "facebook";
      
      private var _passwordCreated:Boolean;
      
      private var luhor:Boolean;
      
      private var luc:Boolean;
      
      public function Naqohi()
      {
         super();
      }
      
      public function get passwordCreated() : Boolean
      {
         return this._passwordCreated;
      }
      
      public function set passwordCreated(_arg_1:Boolean) : void
      {
         this._passwordCreated = _arg_1;
      }
      
      public function set dekafa(_arg_1:Boolean) : void
      {
         this.luhor = _arg_1;
      }
      
      public function set kuzu(_arg_1:Boolean) : void
      {
         this.luc = _arg_1;
      }
      
      public function sunusa(_arg_1:String) : Boolean
      {
         switch(_arg_1)
         {
            case this.VKONTAKTE:
               return true;
            default:
               return false;
         }
      }
      
      public function byc(_arg_1:String) : Boolean
      {
         switch(_arg_1)
         {
            case this.VKONTAKTE:
               return this.luhor;
            case this.FACEBOOK:
               return this.luc;
            default:
               return false;
         }
      }
      
      public function sejyciq(_arg_1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.CREATE_LINK,_arg_1));
      }
      
      public function takeh(_arg_1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK,_arg_1));
      }
      
      public function wihog(_arg_1:String) : void
      {
         if(_arg_1 == this.VKONTAKTE)
         {
            this.luhor = true;
         }
         else
         {
            this.luc = true;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.LINK_SUCCESS,_arg_1));
      }
      
      public function noguw(_arg_1:String) : void
      {
         if(_arg_1 == this.VKONTAKTE)
         {
            this.luhor = false;
         }
         else
         {
            this.luc = false;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK_SUCCESS,_arg_1));
      }
   }
}

