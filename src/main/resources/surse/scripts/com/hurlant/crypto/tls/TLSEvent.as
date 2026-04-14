package com.hurlant.crypto.tls
{
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class TLSEvent extends Event
   {
      
      public static const DATA:String = "data";
      
      public static const READY:String = "ready";
      
      public static const PROMPT_ACCEPT_CERT:String = "promptAcceptCert";
      
      public var data:ByteArray;
      
      public function TLSEvent(_arg_1:String, _arg_2:ByteArray = null)
      {
         this.data = _arg_2;
         super(_arg_1,false,false);
      }
   }
}

