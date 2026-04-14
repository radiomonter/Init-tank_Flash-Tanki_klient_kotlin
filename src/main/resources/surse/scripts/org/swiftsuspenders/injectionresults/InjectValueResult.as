package org.swiftsuspenders.injectionresults
{
   import org.swiftsuspenders.Injector;
   
   public class InjectValueResult extends InjectionResult
   {
      
      private var m_value:Object;
      
      public function InjectValueResult(_arg_1:Object)
      {
         super();
         this.m_value = _arg_1;
      }
      
      override public function getResponse(_arg_1:Injector) : Object
      {
         return this.m_value;
      }
   }
}

