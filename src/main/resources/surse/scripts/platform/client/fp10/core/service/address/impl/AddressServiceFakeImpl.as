package platform.client.fp10.core.service.address.impl
{
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import flash.events.Event;
   import platform.client.fp10.core.service.address.AddressService;
   
   public class AddressServiceFakeImpl implements AddressService
   {
      
      [Inject]
      public static var launcherParams:ILauncherParams;
      
      public function AddressServiceFakeImpl()
      {
         super();
      }
      
      public function back() : void
      {
      }
      
      public function forward() : void
      {
      }
      
      public function up() : void
      {
      }
      
      public function go(_arg_1:int) : void
      {
      }
      
      public function href(_arg_1:String, _arg_2:String = "_self") : void
      {
      }
      
      public function popup(_arg_1:String, _arg_2:String = "popup", _arg_3:String = "\"\"", _arg_4:String = "") : void
      {
      }
      
      public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean = false, _arg_4:int = 0, _arg_5:Boolean = false) : void
      {
      }
      
      public function removeEventListener(_arg_1:String, _arg_2:Function) : void
      {
      }
      
      public function dispatchEvent(_arg_1:Event) : Boolean
      {
         return false;
      }
      
      public function hasEventListener(_arg_1:String) : Boolean
      {
         return false;
      }
      
      public function getBaseURL() : String
      {
         return launcherParams.getParameter("baseurl");
      }
      
      public function getStrict() : Boolean
      {
         return false;
      }
      
      public function setStrict(_arg_1:Boolean) : void
      {
      }
      
      public function getHistory() : Boolean
      {
         return false;
      }
      
      public function setHistory(_arg_1:Boolean) : void
      {
      }
      
      public function getTracker() : String
      {
         return "";
      }
      
      public function setTracker(_arg_1:String) : void
      {
      }
      
      public function getTitle() : String
      {
         return "";
      }
      
      public function setTitle(_arg_1:String) : void
      {
      }
      
      public function getStatus() : String
      {
         return "";
      }
      
      public function setStatus(_arg_1:String) : void
      {
      }
      
      public function resetStatus() : void
      {
      }
      
      public function getValue() : String
      {
         return launcherParams.getParameter("hashparams","");
      }
      
      public function setValue(_arg_1:String, _arg_2:Boolean = true) : void
      {
         launcherParams.setParameter("hashparams",_arg_1);
      }
      
      public function getPath() : String
      {
         return "";
      }
      
      public function getPathNames() : Array
      {
         return [];
      }
      
      public function getQueryString() : String
      {
         return "";
      }
      
      public function getParameter(_arg_1:String) : String
      {
         return "";
      }
      
      public function getQueryParameter(_arg_1:String) : String
      {
         return launcherParams.getParameter(_arg_1,"");
      }
      
      public function getParameterNames() : Array
      {
         return [];
      }
      
      public function reload() : void
      {
      }
   }
}

