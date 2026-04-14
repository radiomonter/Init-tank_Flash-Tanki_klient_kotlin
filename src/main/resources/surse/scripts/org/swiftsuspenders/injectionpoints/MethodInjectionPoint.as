package org.swiftsuspenders.injectionpoints
{
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   import org.swiftsuspenders.InjectorError;
   
   public class MethodInjectionPoint extends InjectionPoint
   {
      
      protected var methodName:String;
      
      protected var _parameterInjectionConfigs:Array;
      
      protected var requiredParameters:int = 0;
      
      public function MethodInjectionPoint(_arg_1:XML, _arg_2:Injector = null)
      {
         super(_arg_1,_arg_2);
      }
      
      override public function applyInjection(_arg_1:Object, _arg_2:Injector) : Object
      {
         var _local_3:Array = this.gatherParameterValues(_arg_1,_arg_2);
         var _local_4:Function = _arg_1[this.methodName];
         _local_4.apply(_arg_1,_local_3);
         return _arg_1;
      }
      
      override protected function initializeInjection(node:XML) : void
      {
         var nameArgs:XMLList = null;
         var methodNode:XML = null;
         nameArgs = node.arg.(@key == "name");
         methodNode = node.parent();
         this.methodName = methodNode.@name.toString();
         this.gatherParameters(methodNode,nameArgs);
      }
      
      protected function gatherParameters(_arg_1:XML, _arg_2:XMLList) : void
      {
         var _local_3:XML = null;
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:int = 0;
         this._parameterInjectionConfigs = [];
         for each(_local_3 in _arg_1.parameter)
         {
            _local_4 = "";
            if(Boolean(_arg_2[_local_6]))
            {
               _local_4 = _arg_2[_local_6].@value.toString();
            }
            _local_5 = _local_3.@type.toString();
            if(_local_5 == "*")
            {
               if(_local_3.@optional.toString() == "false")
               {
                  throw new InjectorError("Error in method definition of injectee. " + "Required parameters can\'t have type \"*\".");
               }
               _local_5 = null;
            }
            this._parameterInjectionConfigs.push(new ParameterInjectionConfig(_local_5,_local_4));
            if(_local_3.@optional.toString() == "false")
            {
               ++this.requiredParameters;
            }
            _local_6++;
         }
      }
      
      protected function gatherParameterValues(_arg_1:Object, _arg_2:Injector) : Array
      {
         var _local_3:ParameterInjectionConfig = null;
         var _local_4:InjectionConfig = null;
         var _local_5:Object = null;
         var _local_8:int = 0;
         var _local_6:Array = [];
         var _local_7:int = int(this._parameterInjectionConfigs.length);
         while(_local_8 < _local_7)
         {
            _local_3 = this._parameterInjectionConfigs[_local_8];
            _local_4 = _arg_2.getMapping(Class(_arg_2.getApplicationDomain().getDefinition(_local_3.typeName)),_local_3.injectionName);
            _local_5 = _local_4.getResponse(_arg_2);
            if(_local_5 == null)
            {
               if(_local_8 >= this.requiredParameters)
               {
                  break;
               }
               throw new InjectorError("Injector is missing a rule to handle injection into target " + _arg_1 + ". Target dependency: " + getQualifiedClassName(_local_4.request) + ", method: " + this.methodName + ", parameter: " + (_local_8 + 1));
            }
            _local_6[_local_8] = _local_5;
            _local_8++;
         }
         return _local_6;
      }
   }
}

final class ParameterInjectionConfig
{
   
   public var typeName:String;
   
   public var injectionName:String;
   
   public function ParameterInjectionConfig(_arg_1:String, _arg_2:String)
   {
      super();
      this.typeName = _arg_1;
      this.injectionName = _arg_2;
   }
}
