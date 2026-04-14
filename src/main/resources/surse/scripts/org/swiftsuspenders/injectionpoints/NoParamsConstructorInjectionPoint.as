package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.Injector;
   
   public class NoParamsConstructorInjectionPoint extends InjectionPoint
   {
      
      public function NoParamsConstructorInjectionPoint()
      {
         super(null,null);
      }
      
      override public function applyInjection(_arg_1:Object, _arg_2:Injector) : Object
      {
         return new (_arg_1 as Class)();
      }
   }
}

