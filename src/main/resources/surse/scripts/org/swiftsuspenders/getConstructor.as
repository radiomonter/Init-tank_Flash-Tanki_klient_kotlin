package org.swiftsuspenders
{
   import flash.utils.Proxy;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   function getConstructor(_arg_1:Object) : Class
   {
      var _local_2:String = null;
      if(_arg_1 is Proxy || _arg_1 is Number || _arg_1 is XML || _arg_1 is XMLList)
      {
         _local_2 = getQualifiedClassName(_arg_1);
         return Class(getDefinitionByName(_local_2));
      }
      return _arg_1.constructor;
   }
}

