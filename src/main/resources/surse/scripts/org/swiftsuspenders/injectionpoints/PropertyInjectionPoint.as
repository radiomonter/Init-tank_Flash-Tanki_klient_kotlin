package org.swiftsuspenders.injectionpoints
{
   import flash.system.ApplicationDomain;
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   import org.swiftsuspenders.InjectorError;
   
   public class PropertyInjectionPoint extends InjectionPoint
   {
      
      private var _propertyName:String;
      
      private var _propertyType:String;
      
      private var _injectionName:String;
      
      public function PropertyInjectionPoint(_arg_1:XML, _arg_2:Injector = null)
      {
         super(_arg_1,null);
      }
      
      override public function applyInjection(target:Object, injector:Injector) : Object
      {
         var injection:Object;
         var injectionConfig:InjectionConfig = null;
         try
         {
            injectionConfig = injector.getMapping(Class(injector.getApplicationDomain().getDefinition(this._propertyType)),this._injectionName);
         }
         catch(e:Error)
         {
            try
            {
               injectionConfig = injector.getMapping(Class(ApplicationDomain.currentDomain.getDefinition(this._propertyType)),this._injectionName);
            }
            catch(e:Error)
            {
            }
         }
         injection = injectionConfig.getResponse(injector);
         if(injection == null)
         {
            throw new InjectorError("Injector is missing a rule to handle injection into property \"" + this._propertyName + "\" of object \"" + target + "\". Target dependency: \"" + this._propertyType + "\", named \"" + this._injectionName + "\"");
         }
         target[this._propertyName] = injection;
         return target;
      }
      
      override protected function initializeInjection(_arg_1:XML) : void
      {
         this._propertyType = _arg_1.parent().@type.toString();
         this._propertyName = _arg_1.parent().@name.toString();
         this._injectionName = _arg_1.arg.attribute("value").toString();
      }
   }
}

