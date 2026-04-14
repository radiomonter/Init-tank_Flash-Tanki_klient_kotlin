package swfaddress
{
   import alternativa.startup.StartupSettings;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   
   public class SWFAddress
   {
      
      public static var onInit:Function;
      
      public static var onChange:Function;
      
      private static var _init:Boolean = false;
      
      private static var _initChange:Boolean = false;
      
      private static var _strict:Boolean = true;
      
      private static var _value:String = "";
      
      private static var _timer:Timer = null;
      
      private static var _availability:Boolean = ExternalInterface.available;
      
      private static var _dispatcher:EventDispatcher = new EventDispatcher();
      
      private static var URLhistory:Array = new Array();
      
      private static var _initializer:Boolean = _initialize();
      
      public function SWFAddress()
      {
         super();
         throw new IllegalOperationError("SWFAddress cannot be instantiated.");
      }
      
      private static function _initialize() : Boolean
      {
         if(_availability)
         {
            ExternalInterface.addCallback("getSWFAddressValue",function():String
            {
               return _value;
            });
            ExternalInterface.addCallback("setSWFAddressValue",_setValue);
         }
         if(_timer == null)
         {
            _timer = new Timer(75);
            _timer.addEventListener(TimerEvent.TIMER,_check);
         }
         _timer.start();
         return true;
      }
      
      private static function _check(_arg_1:TimerEvent) : void
      {
         if((typeof SWFAddress["onInit"] == "function" || _dispatcher.hasEventListener("init")) && !_init)
         {
            SWFAddress._setValueInit(_getValue());
            SWFAddress._init = true;
         }
         if(typeof SWFAddress["onChange"] == "function" || _dispatcher.hasEventListener("change"))
         {
            SWFAddress._init = true;
            SWFAddress._setValueInit(_getValue());
         }
      }
      
      private static function _getValue() : String
      {
         var _local_1:String = null;
         var _local_2:Array = null;
         var _local_3:String = null;
         if(_availability)
         {
            _local_1 = ExternalInterface.call("SWFAddress.getValue") as String;
            _local_2 = ExternalInterface.call("SWFAddress.getIds") as Array;
            if(_local_2 != null)
            {
               _local_3 = _local_2.toString();
            }
         }
         if(_local_3 == null || !_availability)
         {
            _local_1 = SWFAddress._value;
         }
         else if(_local_1 == "undefined" || _local_1 == null)
         {
            _local_1 = "";
         }
         return _local_1 || "";
      }
      
      private static function _setValueInit(_arg_1:String) : void
      {
         var _local_2:* = _arg_1 != SWFAddress._value;
         SWFAddress._value = _arg_1;
         if(!_init)
         {
            _dispatchEvent(SWFAddressEvent.INIT);
         }
         else if(Boolean(_local_2))
         {
            _dispatchEvent(SWFAddressEvent.CHANGE);
         }
         _initChange = true;
      }
      
      private static function _setValue(_arg_1:String) : void
      {
         if(_arg_1 == "undefined" || _arg_1 == null)
         {
            _arg_1 = "";
         }
         if(SWFAddress._value == _arg_1 && SWFAddress._init)
         {
            return;
         }
         if(!SWFAddress._initChange)
         {
            return;
         }
         SWFAddress._value = _arg_1;
         if(!_init)
         {
            SWFAddress._init = true;
            if(typeof SWFAddress["onInit"] == "function" || _dispatcher.hasEventListener("init"))
            {
               _dispatchEvent(SWFAddressEvent.INIT);
            }
         }
         _dispatchEvent(SWFAddressEvent.CHANGE);
      }
      
      private static function _dispatchEvent(_arg_1:String) : void
      {
         var _local_2:* = undefined;
         if(_dispatcher.hasEventListener(_arg_1))
         {
            _dispatcher.dispatchEvent(new SWFAddressEvent(_arg_1));
         }
         _arg_1 = _arg_1.substr(0,1).toUpperCase() + _arg_1.substring(1);
         if(typeof SWFAddress["on" + _arg_1] == "function")
         {
            _local_2 = SWFAddress;
            _local_2["on" + _arg_1]();
         }
      }
      
      public static function back() : void
      {
         if(_availability && SWFAddress._init)
         {
            ExternalInterface.call("SWFAddress.back");
         }
         else
         {
            _value = URLhistory.pop();
            _dispatchEvent(SWFAddressEvent.CHANGE);
         }
      }
      
      public static function forward() : void
      {
         if(_availability && SWFAddress._init)
         {
            ExternalInterface.call("SWFAddress.forward");
         }
      }
      
      public static function up() : void
      {
         var _local_1:String = SWFAddress.getPath();
         SWFAddress.setValue(_local_1.substr(0,_local_1.lastIndexOf("/",_local_1.length - 2) + (_local_1.substr(_local_1.length - 1) == "/" ? 1 : 0)));
      }
      
      public static function go(_arg_1:int) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.go",_arg_1);
         }
      }
      
      public static function href(_arg_1:String, _arg_2:String = "_self") : void
      {
         if(_availability && Capabilities.playerType == "ActiveX")
         {
            ExternalInterface.call("SWFAddress.href",_arg_1,_arg_2);
            return;
         }
         navigateToURL(new URLRequest(_arg_1),_arg_2);
      }
      
      public static function popup(_arg_1:String, _arg_2:String = "popup", _arg_3:String = "\"\"", _arg_4:String = "") : void
      {
         if(_availability && (Boolean(Capabilities.playerType == "ActiveX") || Boolean(ExternalInterface.call("asual.util.Browser.isSafari"))))
         {
            ExternalInterface.call("SWFAddress.popup",_arg_1,_arg_2,_arg_3,_arg_4);
            return;
         }
         navigateToURL(new URLRequest("javascript:popup=window.open(\"" + _arg_1 + "\",\"" + _arg_2 + "\"," + _arg_3 + ");" + _arg_4 + ";void(0);"),"_self");
      }
      
      public static function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean = false, _arg_4:int = 0, _arg_5:Boolean = false) : void
      {
         _dispatcher.addEventListener(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public static function removeEventListener(_arg_1:String, _arg_2:Function) : void
      {
         _dispatcher.removeEventListener(_arg_1,_arg_2,false);
      }
      
      public static function dispatchEvent(_arg_1:Event) : Boolean
      {
         return _dispatcher.dispatchEvent(_arg_1);
      }
      
      public static function hasEventListener(_arg_1:String) : Boolean
      {
         return _dispatcher.hasEventListener(_arg_1);
      }
      
      public static function getBaseURL() : String
      {
         var _local_1:String = null;
         if(_availability)
         {
            _local_1 = String(ExternalInterface.call("SWFAddress.getBaseURL"));
         }
         return _local_1 == null || _local_1 == "null" || !_availability ? "" : _local_1;
      }
      
      public static function getStrict() : Boolean
      {
         var _local_1:String = null;
         if(_availability)
         {
            _local_1 = ExternalInterface.call("SWFAddress.getStrict") as String;
         }
         return _local_1 == null ? Boolean(_strict) : Boolean(_local_1 == "true");
      }
      
      public static function setStrict(_arg_1:Boolean) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.setStrict",_arg_1);
         }
         _strict = _arg_1;
      }
      
      public static function getHistory() : Boolean
      {
         return !_availability ? Boolean(false) : Boolean(ExternalInterface.call("SWFAddress.getHistory") as Boolean);
      }
      
      public static function setHistory(_arg_1:Boolean) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.setHistory",_arg_1);
         }
      }
      
      public static function getTracker() : String
      {
         return !_availability ? "" : ExternalInterface.call("SWFAddress.getTracker") as String;
      }
      
      public static function setTracker(_arg_1:String) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.setTracker",_arg_1);
         }
      }
      
      public static function getTitle() : String
      {
         var _local_1:String = !_availability ? "" : ExternalInterface.call("SWFAddress.getTitle") as String;
         if(_local_1 == "undefined" || _local_1 == null)
         {
            _local_1 = "";
         }
         return _local_1;
      }
      
      public static function setTitle(_arg_1:String) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.setTitle",_arg_1);
         }
      }
      
      public static function getStatus() : String
      {
         var _local_1:String = !_availability ? "" : ExternalInterface.call("SWFAddress.getStatus") as String;
         if(_local_1 == "undefined" || _local_1 == null)
         {
            _local_1 = "";
         }
         return _local_1;
      }
      
      public static function setStatus(_arg_1:String) : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.setStatus",_arg_1);
         }
      }
      
      public static function resetStatus() : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.resetStatus");
         }
      }
      
      public static function getValue() : String
      {
         return _value || "";
      }
      
      public static function setValue(_arg_1:String, _arg_2:Boolean = true) : void
      {
         if(_arg_1 == "undefined" || _arg_1 == null)
         {
            _arg_1 = "";
         }
         if(SWFAddress._value == _arg_1)
         {
            return;
         }
         if(_availability && SWFAddress._init)
         {
            ExternalInterface.call("SWFAddress.setValue",_arg_1);
         }
         else
         {
            URLhistory.push(_value);
         }
         SWFAddress._value = _arg_1;
         if(_arg_2)
         {
            _dispatchEvent(SWFAddressEvent.CHANGE);
         }
      }
      
      public static function getPath() : String
      {
         var _local_1:String = SWFAddress.getValue();
         if(_local_1.indexOf("?") != -1)
         {
            return _local_1.split("?")[0];
         }
         return _local_1;
      }
      
      public static function getPathNames() : Array
      {
         var _local_1:String = SWFAddress.getPath();
         var _local_2:Array = _local_1.split("/");
         if(_local_1.substr(0,1) == "/" || _local_1.length == 0)
         {
            _local_2.splice(0,1);
         }
         if(_local_1.substr(_local_1.length - 1,1) == "/")
         {
            _local_2.splice(_local_2.length - 1,1);
         }
         return _local_2;
      }
      
      public static function getQueryString() : String
      {
         var _local_1:String = SWFAddress.getValue();
         var _local_2:Number = _local_1.indexOf("?");
         if(_local_2 != -1 && _local_2 < _local_1.length)
         {
            return _local_1.substr(_local_2 + 1);
         }
         return "";
      }
      
      private static function fetchParameter(_arg_1:String, _arg_2:String) : String
      {
         var _local_3:Array = null;
         var _local_4:Array = null;
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_2.indexOf("?");
         if(_local_6 != -1)
         {
            _arg_2 = _arg_2.substr(_local_6 + 1);
            _local_3 = _arg_2.split("&");
            _local_5 = _local_3.length;
            while(Boolean(_local_5--))
            {
               _local_4 = _local_3[_local_5].split("=");
               if(_local_4[0] == _arg_1)
               {
                  return _local_4[1];
               }
            }
         }
         return "";
      }
      
      public static function getParameter(_arg_1:String) : String
      {
         var _local_2:String = SWFAddress.getValue();
         return fetchParameter(_arg_1,_local_2);
      }
      
      public static function getQueryParameter(_arg_1:String) : String
      {
         var _local_2:String = SWFAddress.getBaseURL();
         return fetchParameter(_arg_1,_local_2);
      }
      
      public static function getParameterNames() : Array
      {
         var _local_1:Array = null;
         var _local_2:Number = NaN;
         var _local_3:String = SWFAddress.getValue();
         var _local_4:Number = _local_3.indexOf("?");
         var _local_5:Array = new Array();
         if(_local_4 != -1)
         {
            _local_3 = _local_3.substr(_local_4 + 1);
            if(_local_3 != "" && _local_3.indexOf("=") != -1)
            {
               _local_1 = _local_3.split("&");
               _local_2 = 0;
               while(_local_2 < _local_1.length)
               {
                  _local_5.push(_local_1[_local_2].split("=")[0]);
                  _local_2++;
               }
            }
         }
         return _local_5;
      }
      
      public static function reload() : void
      {
         if(_availability)
         {
            ExternalInterface.call("SWFAddress.reload");
         }
         else if(StartupSettings.isDesktop)
         {
            StartupSettings.closeApplication();
         }
      }
   }
}

