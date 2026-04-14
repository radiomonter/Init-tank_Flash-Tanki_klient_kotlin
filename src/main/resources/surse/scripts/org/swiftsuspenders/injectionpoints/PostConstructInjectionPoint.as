package org.swiftsuspenders.injectionpoints
{
   import org.swiftsuspenders.Injector;
   
   public class PostConstructInjectionPoint extends InjectionPoint
   {
      
      protected var methodName:String;
      
      protected var orderValue:int;
      
      public function PostConstructInjectionPoint(_arg_1:XML, _arg_2:Injector = null)
      {
         super(_arg_1,_arg_2);
      }
      
      public function get order() : int
      {
         return this.orderValue;
      }
      
      override public function applyInjection(_arg_1:Object, _arg_2:Injector) : Object
      {
         var _local_3:* = _arg_1;
         _local_3[this.methodName]();
         return _arg_1;
      }
      
      override protected function initializeInjection(node:XML) : void
      {
         var orderArg:XMLList = null;
         var methodNode:XML = null;
         orderArg = node.arg.(@key == "order");
         methodNode = node.parent();
         this.orderValue = int(orderArg.@value);
         this.methodName = methodNode.@name.toString();
      }
   }
}

