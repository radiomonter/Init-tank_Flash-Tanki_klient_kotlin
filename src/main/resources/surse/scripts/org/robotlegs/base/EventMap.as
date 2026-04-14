package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.core.IEventMap;
   
   public class EventMap implements IEventMap
   {
      
      protected var eventDispatcher:IEventDispatcher;
      
      protected var _dispatcherListeningEnabled:Boolean = true;
      
      protected var listeners:Array;
      
      public function EventMap(_arg_1:IEventDispatcher)
      {
         super();
         this.listeners = new Array();
         this.eventDispatcher = _arg_1;
      }
      
      public function get dispatcherListeningEnabled() : Boolean
      {
         return this._dispatcherListeningEnabled;
      }
      
      public function set dispatcherListeningEnabled(_arg_1:Boolean) : void
      {
         this._dispatcherListeningEnabled = _arg_1;
      }
      
      public function mapListener(dispatcher:IEventDispatcher, type:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true) : void
      {
         var i:int;
         var callback:Function;
         var params:Object = null;
         if(this.dispatcherListeningEnabled == false && dispatcher == this.eventDispatcher)
         {
            throw new ContextError(ContextError.E_EVENTMAP_NOSNOOPING);
         }
         eventClass ||= Event;
         i = int(this.listeners.length);
         while(Boolean(i--))
         {
            params = this.listeners[i];
            if(params.dispatcher == dispatcher && params.type == type && params.listener == listener && params.useCapture == useCapture && params.eventClass == eventClass)
            {
               return;
            }
         }
         callback = function(_arg_1:Event):void
         {
            routeEventToListener(_arg_1,listener,eventClass);
         };
         params = {
            "dispatcher":dispatcher,
            "type":type,
            "listener":listener,
            "eventClass":eventClass,
            "callback":callback,
            "useCapture":useCapture
         };
         this.listeners.push(params);
         dispatcher.addEventListener(type,callback,useCapture,priority,useWeakReference);
      }
      
      public function unmapListener(_arg_1:IEventDispatcher, _arg_2:String, _arg_3:Function, _arg_4:Class = null, _arg_5:Boolean = false) : void
      {
         var _local_6:Object = null;
         _arg_4 ||= Event;
         var _local_7:int = int(this.listeners.length);
         while(Boolean(_local_7--))
         {
            _local_6 = this.listeners[_local_7];
            if(_local_6.dispatcher == _arg_1 && _local_6.type == _arg_2 && _local_6.listener == _arg_3 && _local_6.useCapture == _arg_5 && _local_6.eventClass == _arg_4)
            {
               _arg_1.removeEventListener(_arg_2,_local_6.callback,_arg_5);
               this.listeners.splice(_local_7,1);
               return;
            }
         }
      }
      
      public function unmapListeners() : void
      {
         var _local_1:Object = null;
         var _local_2:IEventDispatcher = null;
         while(Boolean(_local_1 = this.listeners.pop()))
         {
            _local_2 = _local_1.dispatcher;
            _local_2.removeEventListener(_local_1.type,_local_1.callback,_local_1.useCapture);
         }
      }
      
      protected function routeEventToListener(_arg_1:Event, _arg_2:Function, _arg_3:Class) : void
      {
         if(_arg_1 is _arg_3)
         {
            _arg_2(_arg_1);
         }
      }
   }
}

