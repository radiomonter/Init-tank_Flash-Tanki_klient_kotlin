package org.swiftsuspenders
{
   import flash.system.ApplicationDomain;
   import flash.utils.*;
   
   public class Reflector
   {
      
      public function Reflector()
      {
         super();
      }
      
      public function classExtendsOrImplements(classOrClassName:Object, superclass:Class, application:ApplicationDomain = null) : Boolean
      {
         var factoryDescription:XML;
         var actualClass:Class = null;
         if(classOrClassName is Class)
         {
            actualClass = Class(classOrClassName);
         }
         else if(classOrClassName is String)
         {
            try
            {
               actualClass = Class(getDefinitionByName(classOrClassName as String));
            }
            catch(e:Error)
            {
               throw new Error("The class name " + classOrClassName + " is not valid because of " + e + "\n" + e.getStackTrace());
            }
         }
         if(!actualClass)
         {
            throw new Error("The parameter classOrClassName must be a valid Class " + "instance or fully qualified class name.");
         }
         if(actualClass == superclass)
         {
            return true;
         }
         factoryDescription = describeType(actualClass).factory[0];
         return factoryDescription.children().(name() == "implementsInterface" || name() == "extendsClass").(attribute("type") == getQualifiedClassName(superclass)).length() > 0;
      }
      
      public function getClass(_arg_1:*, _arg_2:ApplicationDomain = null) : Class
      {
         if(_arg_1 is Class)
         {
            return _arg_1;
         }
         return getConstructor(_arg_1);
      }
      
      public function getFQCN(_arg_1:*, _arg_2:Boolean = false) : String
      {
         var _local_3:String = null;
         var _local_4:int = 0;
         if(_arg_1 is String)
         {
            _local_3 = _arg_1;
            if(!_arg_2 && _local_3.indexOf("::") == -1)
            {
               _local_4 = _local_3.lastIndexOf(".");
               if(_local_4 == -1)
               {
                  return _local_3;
               }
               return _local_3.substring(0,_local_4) + "::" + _local_3.substring(_local_4 + 1);
            }
         }
         else
         {
            _local_3 = getQualifiedClassName(_arg_1);
         }
         return !_arg_2 ? _local_3 : _local_3.replace("::",".");
      }
   }
}

