package org.swiftsuspenders.injectionpoints
{
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import org.swiftsuspenders.Injector;
   
   public class ConstructorInjectionPoint extends MethodInjectionPoint
   {
      
      public function ConstructorInjectionPoint(node:XML, clazz:Class, injector:Injector = null)
      {
         if(node.parameter.(@type == "*").length() == node.parameter.@type.length())
         {
            this.createDummyInstance(node,clazz);
         }
         super(node,injector);
      }
      
      override public function applyInjection(_arg_1:Object, _arg_2:Injector) : Object
      {
         var _local_3:Class = Class(_arg_1);
         var _local_4:Array = gatherParameterValues(_arg_1,_arg_2);
         switch(_local_4.length)
         {
            case 0:
               return new _local_3();
            case 1:
               return new _local_3(_local_4[0]);
            case 2:
               return new _local_3(_local_4[0],_local_4[1]);
            case 3:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2]);
            case 4:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3]);
            case 5:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4]);
            case 6:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4],_local_4[5]);
            case 7:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4],_local_4[5],_local_4[6]);
            case 8:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4],_local_4[5],_local_4[6],_local_4[7]);
            case 9:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4],_local_4[5],_local_4[6],_local_4[7],_local_4[8]);
            case 10:
               return new _local_3(_local_4[0],_local_4[1],_local_4[2],_local_4[3],_local_4[4],_local_4[5],_local_4[6],_local_4[7],_local_4[8],_local_4[9]);
            default:
               return null;
         }
      }
      
      override protected function initializeInjection(node:XML) : void
      {
         var nameArgs:XMLList = null;
         nameArgs = node.parent().metadata.(@name == "Inject").arg.(@key == "name");
         methodName = "constructor";
         gatherParameters(node,nameArgs);
      }
      
      private function createDummyInstance(constructorNode:XML, clazz:Class) : void
      {
         try
         {
            switch(constructorNode.children().length())
            {
               case 0:
                  new clazz();
                  break;
               case 1:
                  new clazz(null);
                  break;
               case 2:
                  new clazz(null,null);
                  break;
               case 3:
                  new clazz(null,null,null);
                  break;
               case 4:
                  new clazz(null,null,null,null);
                  break;
               case 5:
                  new clazz(null,null,null,null,null);
                  break;
               case 6:
                  new clazz(null,null,null,null,null,null);
                  break;
               case 7:
                  new clazz(null,null,null,null,null,null,null);
                  break;
               case 8:
                  new clazz(null,null,null,null,null,null,null,null);
                  break;
               case 9:
                  new clazz(null,null,null,null,null,null,null,null,null);
                  break;
               case 10:
                  new clazz(null,null,null,null,null,null,null,null,null,null);
            }
         }
         catch(error:Error)
         {
         }
         constructorNode.setChildren(describeType(clazz).factory.constructor[0].children());
      }
   }
}

