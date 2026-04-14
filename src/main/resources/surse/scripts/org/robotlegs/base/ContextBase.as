package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.robotlegs.core.IContext;
   
   public class ContextBase implements IContext, IEventDispatcher
   {
      
      protected var _eventDispatcher:IEventDispatcher;
      
      public function ContextBase()
      {
         super();
         this._eventDispatcher = new EventDispatcher(this);
      }
      
      public function get eventDispatcher() : IEventDispatcher
      {
         return this._eventDispatcher;
      }
      
      public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean = false, _arg_4:int = 0, _arg_5:Boolean = false) : void
      {
         this.eventDispatcher.addEventListener(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function dispatchEvent(_arg_1:Event) : Boolean
      {
         if(this.eventDispatcher.hasEventListener(_arg_1.type))
         {
            return this.eventDispatcher.dispatchEvent(_arg_1);
         }
         return false;
      }
      
      public function hasEventListener(_arg_1:String) : Boolean
      {
         return this.eventDispatcher.hasEventListener(_arg_1);
      }
      
      public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean = false) : void
      {
         this.eventDispatcher.removeEventListener(_arg_1,_arg_2,_arg_3);
      }
      
      public function willTrigger(_arg_1:String) : Boolean
      {
         return this.eventDispatcher.willTrigger(_arg_1);
      }
   }
}

