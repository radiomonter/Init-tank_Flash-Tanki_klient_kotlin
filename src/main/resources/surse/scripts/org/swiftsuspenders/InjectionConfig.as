package org.swiftsuspenders
{
   import org.swiftsuspenders.injectionresults.InjectionResult;
   
   public class InjectionConfig
   {
      
      public var request:Class;
      
      public var injectionName:String;
      
      private var m_injector:Injector;
      
      private var m_result:InjectionResult;
      
      public function InjectionConfig(_arg_1:Class, _arg_2:String)
      {
         super();
         this.request = _arg_1;
         this.injectionName = _arg_2;
      }
      
      public function getResponse(_arg_1:Injector) : Object
      {
         if(Boolean(this.m_result))
         {
            return this.m_result.getResponse(this.m_injector || _arg_1);
         }
         var _local_2:InjectionConfig = (this.m_injector || _arg_1).getAncestorMapping(this.request,this.injectionName);
         if(Boolean(_local_2))
         {
            return _local_2.getResponse(_arg_1);
         }
         return null;
      }
      
      public function hasResponse(_arg_1:Injector) : Boolean
      {
         if(Boolean(this.m_result))
         {
            return true;
         }
         var _local_2:InjectionConfig = (this.m_injector || _arg_1).getAncestorMapping(this.request,this.injectionName);
         return _local_2 != null;
      }
      
      public function hasOwnResponse() : Boolean
      {
         return this.m_result != null;
      }
      
      public function setResult(_arg_1:InjectionResult) : void
      {
         if(this.m_result != null && _arg_1 != null)
         {
         }
         this.m_result = _arg_1;
      }
      
      public function setInjector(_arg_1:Injector) : void
      {
         this.m_injector = _arg_1;
      }
   }
}

