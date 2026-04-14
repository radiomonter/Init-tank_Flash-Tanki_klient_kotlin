package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.Injector;
   
   public class InjectSingletonResult extends InjectionResult
   {
      
      private var m_responseType:Class;
      
      private var m_response:Object;
      
      public function InjectSingletonResult(_arg_1:Class)
      {
         super();
         this.m_responseType = _arg_1;
      }
      
      override public function getResponse(_arg_1:Injector) : Object
      {
         return this.m_response = this.m_response || this.createResponse(_arg_1);
      }
      
      private function createResponse(_arg_1:Injector) : Object
      {
         return _arg_1.instantiate(this.m_responseType);
      }
   }
}

