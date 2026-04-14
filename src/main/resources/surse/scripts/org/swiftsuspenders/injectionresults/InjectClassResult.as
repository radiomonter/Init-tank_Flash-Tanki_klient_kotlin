package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.Injector;
   
   public class InjectClassResult extends InjectionResult
   {
      
      private var m_responseType:Class;
      
      public function InjectClassResult(_arg_1:Class)
      {
         super();
         this.m_responseType = _arg_1;
      }
      
      override public function getResponse(_arg_1:Injector) : Object
      {
         return _arg_1.instantiate(this.m_responseType);
      }
   }
}

