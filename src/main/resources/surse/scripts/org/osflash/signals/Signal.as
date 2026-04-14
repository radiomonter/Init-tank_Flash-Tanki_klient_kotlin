package org.osflash.signals
{
   import flash.errors.IllegalOperationError;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class Signal implements ISignalOwner, IDispatcher
   {
      
      protected var _valueClasses:Array;
      
      protected var listeners:Array;
      
      protected var onceListeners:Dictionary;
      
      protected var listenersNeedCloning:Boolean = false;
      
      public function Signal(... _args)
      {
         super();
         this.listeners = [];
         this.onceListeners = new Dictionary();
         if(_args.length == 1 && _args[0] is Array)
         {
            _args = _args[0];
         }
         this.valueClasses = _args;
      }
      
      public function get valueClasses() : Array
      {
         return this._valueClasses;
      }
      
      public function set valueClasses(_arg_1:Array) : void
      {
         this._valueClasses = Boolean(_arg_1) ? _arg_1.slice() : [];
         var _local_2:int = int(this._valueClasses.length);
         while(Boolean(_local_2--))
         {
            if(!(this._valueClasses[_local_2] is Class))
            {
               throw new ArgumentError("Invalid valueClasses argument: item at index " + _local_2 + " should be a Class but was:<" + this._valueClasses[_local_2] + ">." + getQualifiedClassName(this._valueClasses[_local_2]));
            }
         }
      }
      
      public function get numListeners() : uint
      {
         return this.listeners.length;
      }
      
      public function add(_arg_1:Function) : Function
      {
         this.registerListener(_arg_1);
         return _arg_1;
      }
      
      public function addOnce(_arg_1:Function) : Function
      {
         this.registerListener(_arg_1,true);
         return _arg_1;
      }
      
      public function remove(_arg_1:Function) : Function
      {
         var _local_2:int = this.listeners.indexOf(_arg_1);
         if(_local_2 == -1)
         {
            return _arg_1;
         }
         if(this.listenersNeedCloning)
         {
            this.listeners = this.listeners.slice();
            this.listenersNeedCloning = false;
         }
         this.listeners.splice(_local_2,1);
         delete this.onceListeners[_arg_1];
         return _arg_1;
      }
      
      public function removeAll() : void
      {
         var _local_1:uint = this.listeners.length;
         while(Boolean(_local_1--))
         {
            this.remove(this.listeners[_local_1] as Function);
         }
      }
      
      public function dispatch(... _args) : void
      {
         var _local_2:Object = null;
         var _local_3:Class = null;
         var _local_4:Function = null;
         var _local_6:int = 0;
         var _local_5:int = int(this._valueClasses.length);
         if(_args.length < _local_5)
         {
            throw new ArgumentError("Incorrect number of arguments. Expected at least " + _local_5 + " but received " + _args.length + ".");
         }
         while(_local_6 < _local_5)
         {
            _local_2 = _args[_local_6];
            if(!(_local_2 === null || _local_2 is (_local_3 = this._valueClasses[_local_6])))
            {
               throw new ArgumentError("Value object <" + _local_2 + "> is not an instance of <" + _local_3 + ">.");
            }
            _local_6++;
         }
         if(!this.listeners.length)
         {
            return;
         }
         this.listenersNeedCloning = true;
         switch(_args.length)
         {
            case 0:
               for each(_local_4 in this.listeners)
               {
                  if(Boolean(this.onceListeners[_local_4]))
                  {
                     this.remove(_local_4);
                  }
                  _local_4();
               }
               break;
            case 1:
               for each(_local_4 in this.listeners)
               {
                  if(Boolean(this.onceListeners[_local_4]))
                  {
                     this.remove(_local_4);
                  }
                  _local_4(_args[0]);
               }
               break;
            default:
               for each(_local_4 in this.listeners)
               {
                  if(Boolean(this.onceListeners[_local_4]))
                  {
                     this.remove(_local_4);
                  }
                  _local_4.apply(null,_args);
               }
         }
         this.listenersNeedCloning = false;
      }
      
      protected function registerListener(_arg_1:Function, _arg_2:Boolean = false) : void
      {
         var _local_3:String = null;
         if(_arg_1.length < this._valueClasses.length)
         {
            _local_3 = _arg_1.length == 1 ? "argument" : "arguments";
            throw new ArgumentError("Listener has " + _arg_1.length + " " + _local_3 + " but it needs at least " + this._valueClasses.length + " to match the given value classes.");
         }
         if(!this.listeners.length)
         {
            this.listeners[0] = _arg_1;
            if(_arg_2)
            {
               this.onceListeners[_arg_1] = true;
            }
            return;
         }
         if(this.listeners.indexOf(_arg_1) >= 0)
         {
            if(Boolean(this.onceListeners[_arg_1]) && !_arg_2)
            {
               throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
            }
            if(!this.onceListeners[_arg_1] && _arg_2)
            {
               throw new IllegalOperationError("You cannot add() then addOnce() the same listener without removing the relationship first.");
            }
            return;
         }
         if(this.listenersNeedCloning)
         {
            this.listeners = this.listeners.slice();
            this.listenersNeedCloning = false;
         }
         this.listeners[this.listeners.length] = _arg_1;
         if(_arg_2)
         {
            this.onceListeners[_arg_1] = true;
         }
      }
   }
}

