package platform.client.fp10.core.service.address.impl
{
   import flash.events.Event;
   import platform.client.fp10.core.service.address.AddressService;
   import swfaddress.SWFAddress;
   import swfaddress.SWFAddressEvent;
   
   public class AddressServiceImpl implements AddressService
   {
      
      public function AddressServiceImpl()
      {
         super();
         this.addEventListener(SWFAddressEvent.CHANGE,function(_arg_1:Event):void
         {
         });
      }
      
      public function back() : void
      {
         SWFAddress.back();
      }
      
      public function forward() : void
      {
         SWFAddress.forward();
      }
      
      public function up() : void
      {
         SWFAddress.up();
      }
      
      public function go(_arg_1:int) : void
      {
         SWFAddress.go(_arg_1);
      }
      
      public function href(_arg_1:String, _arg_2:String = "_self") : void
      {
         SWFAddress.href(_arg_1,_arg_2);
      }
      
      public function popup(_arg_1:String, _arg_2:String = "popup", _arg_3:String = "\"\"", _arg_4:String = "") : void
      {
         SWFAddress.popup(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean = false, _arg_4:int = 0, _arg_5:Boolean = false) : void
      {
         SWFAddress.addEventListener(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public function removeEventListener(_arg_1:String, _arg_2:Function) : void
      {
         SWFAddress.removeEventListener(_arg_1,_arg_2);
      }
      
      public function dispatchEvent(_arg_1:Event) : Boolean
      {
         return SWFAddress.dispatchEvent(_arg_1);
      }
      
      public function hasEventListener(_arg_1:String) : Boolean
      {
         return SWFAddress.hasEventListener(_arg_1);
      }
      
      public function getBaseURL() : String
      {
         return SWFAddress.getBaseURL();
      }
      
      public function getStrict() : Boolean
      {
         return SWFAddress.getStrict();
      }
      
      public function setStrict(_arg_1:Boolean) : void
      {
         SWFAddress.setStrict(_arg_1);
      }
      
      public function getHistory() : Boolean
      {
         return SWFAddress.getHistory();
      }
      
      public function setHistory(_arg_1:Boolean) : void
      {
         SWFAddress.setHistory(_arg_1);
      }
      
      public function getTracker() : String
      {
         return SWFAddress.getTracker();
      }
      
      public function setTracker(_arg_1:String) : void
      {
         SWFAddress.setTracker(_arg_1);
      }
      
      public function getTitle() : String
      {
         return SWFAddress.getTitle();
      }
      
      public function setTitle(_arg_1:String) : void
      {
         SWFAddress.setTitle(_arg_1);
      }
      
      public function getStatus() : String
      {
         return SWFAddress.getStatus();
      }
      
      public function setStatus(_arg_1:String) : void
      {
         SWFAddress.setStatus(_arg_1);
      }
      
      public function resetStatus() : void
      {
         SWFAddress.resetStatus();
      }
      
      public function getValue() : String
      {
         return SWFAddress.getValue();
      }
      
      public function setValue(_arg_1:String, _arg_2:Boolean = true) : void
      {
         SWFAddress.setValue(_arg_1,_arg_2);
      }
      
      public function getPath() : String
      {
         return SWFAddress.getPath();
      }
      
      public function getPathNames() : Array
      {
         return SWFAddress.getPathNames();
      }
      
      public function getQueryString() : String
      {
         return SWFAddress.getQueryString();
      }
      
      public function getParameter(_arg_1:String) : String
      {
         return SWFAddress.getParameter(_arg_1);
      }
      
      public function getParameterNames() : Array
      {
         return SWFAddress.getParameterNames();
      }
      
      public function reload() : void
      {
         SWFAddress.reload();
      }
      
      public function getQueryParameter(_arg_1:String) : String
      {
         return SWFAddress.getQueryParameter(_arg_1);
      }
   }
}

