package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import org.robotlegs.core.ICommandMap;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IReflector;
   
   public class CommandMap implements ICommandMap
   {
      
      protected var eventDispatcher:IEventDispatcher;
      
      protected var injector:IInjector;
      
      protected var reflector:IReflector;
      
      protected var eventTypeMap:Dictionary;
      
      protected var verifiedCommandClasses:Dictionary;
      
      protected var detainedCommands:Dictionary;
      
      public function CommandMap(_arg_1:IEventDispatcher, _arg_2:IInjector, _arg_3:IReflector)
      {
         super();
         this.eventDispatcher = _arg_1;
         this.injector = _arg_2;
         this.reflector = _arg_3;
         this.eventTypeMap = new Dictionary(false);
         this.verifiedCommandClasses = new Dictionary(false);
         this.detainedCommands = new Dictionary(false);
      }
      
      public function mapEvent(eventType:String, commandClass:Class, eventClass:Class = null, oneshot:Boolean = false) : void
      {
         var eventClassMap:Dictionary;
         var callbacksByCommandClass:Dictionary;
         var callback:Function;
         this.verifyCommandClass(commandClass);
         eventClass ||= Event;
         eventClassMap = this.eventTypeMap[eventType] = this.eventTypeMap[eventType] || new Dictionary(false);
         callbacksByCommandClass = eventClassMap[eventClass] = eventClassMap[eventClass] || new Dictionary(false);
         if(callbacksByCommandClass[commandClass] != null)
         {
            throw new ContextError(ContextError.E_COMMANDMAP_OVR + " - eventType (" + eventType + ") and Command (" + commandClass + ")");
         }
         callback = function(_arg_1:Event):void
         {
            routeEventToCommand(_arg_1,commandClass,oneshot,eventClass);
         };
         this.eventDispatcher.addEventListener(eventType,callback,false,0,true);
         callbacksByCommandClass[commandClass] = callback;
      }
      
      public function unmapEvent(_arg_1:String, _arg_2:Class, _arg_3:Class = null) : void
      {
         var _local_4:Dictionary = this.eventTypeMap[_arg_1];
         if(_local_4 == null)
         {
            return;
         }
         var _local_5:Dictionary = _local_4[_arg_3 || Event];
         if(_local_5 == null)
         {
            return;
         }
         var _local_6:Function = _local_5[_arg_2];
         if(_local_6 == null)
         {
            return;
         }
         this.eventDispatcher.removeEventListener(_arg_1,_local_6,false);
         delete _local_5[_arg_2];
      }
      
      public function unmapEvents() : void
      {
         var _local_1:String = null;
         var _local_2:Dictionary = null;
         var _local_3:Dictionary = null;
         var _local_4:Function = null;
         for(_local_1 in this.eventTypeMap)
         {
            _local_2 = this.eventTypeMap[_local_1];
            for each(_local_3 in _local_2)
            {
               for each(_local_4 in _local_3)
               {
                  this.eventDispatcher.removeEventListener(_local_1,_local_4,false);
               }
            }
         }
         this.eventTypeMap = new Dictionary(false);
      }
      
      public function hasEventCommand(_arg_1:String, _arg_2:Class, _arg_3:Class = null) : Boolean
      {
         var _local_4:Dictionary = this.eventTypeMap[_arg_1];
         if(_local_4 == null)
         {
            return false;
         }
         var _local_5:Dictionary = _local_4[_arg_3 || Event];
         if(_local_5 == null)
         {
            return false;
         }
         return _local_5[_arg_2] != null;
      }
      
      public function execute(_arg_1:Class, _arg_2:Object = null, _arg_3:Class = null, _arg_4:String = "") : void
      {
         this.verifyCommandClass(_arg_1);
         if(_arg_2 != null || _arg_3 != null)
         {
            _arg_3 ||= this.reflector.getClass(_arg_2);
            if(_arg_2 is Event && _arg_3 != Event)
            {
               this.injector.mapValue(Event,_arg_2);
            }
            this.injector.mapValue(_arg_3,_arg_2,_arg_4);
         }
         var _local_5:Object = this.injector.instantiate(_arg_1);
         if(_arg_2 !== null || _arg_3 != null)
         {
            if(_arg_2 is Event && _arg_3 != Event)
            {
               this.injector.unmap(Event);
            }
            this.injector.unmap(_arg_3,_arg_4);
         }
         _local_5.execute();
      }
      
      public function detain(_arg_1:Object) : void
      {
         this.detainedCommands[_arg_1] = true;
      }
      
      public function release(_arg_1:Object) : void
      {
         if(Boolean(this.detainedCommands[_arg_1]))
         {
            delete this.detainedCommands[_arg_1];
         }
      }
      
      protected function verifyCommandClass(commandClass:Class) : void
      {
         if(!this.verifiedCommandClasses[commandClass])
         {
            this.verifiedCommandClasses[commandClass] = describeType(commandClass).factory.method.(@name == "execute").length();
            if(!this.verifiedCommandClasses[commandClass])
            {
               throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + " - " + commandClass);
            }
         }
      }
      
      protected function routeEventToCommand(_arg_1:Event, _arg_2:Class, _arg_3:Boolean, _arg_4:Class) : Boolean
      {
         if(!(_arg_1 is _arg_4))
         {
            return false;
         }
         this.execute(_arg_2,_arg_1);
         if(_arg_3)
         {
            this.unmapEvent(_arg_1.type,_arg_2,_arg_4);
         }
         return true;
      }
   }
}

