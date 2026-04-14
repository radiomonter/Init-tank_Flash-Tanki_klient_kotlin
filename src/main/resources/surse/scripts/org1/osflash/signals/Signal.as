package org1.osflash.signals
{
   import flash.errors.IllegalOperationError;
   import flash.utils.getQualifiedClassName;
   
   public class Signal implements ISignal
   {
      
      private var _valueClasses:Array;
      
      private var slots:SlotList = SlotList.NIL;
      
      public function Signal(... _args)
      {
         super();
         this.setValueClasses(_args.length == 1 && _args[0] is Array ? _args[0] : _args);
      }
      
      public function getValueClasses() : Array
      {
         return this._valueClasses;
      }
      
      public function setValueClasses(_arg_1:Array) : void
      {
         this._valueClasses = Boolean(_arg_1) ? _arg_1.slice() : [];
         var _local_2:int = int(this._valueClasses.length);
         while(Boolean(_local_2--))
         {
            if(!(this._valueClasses[_local_2] is Class))
            {
               throw new ArgumentError("Invalid valueClasses argument: " + "item at index " + _local_2 + " should be a Class but was:<" + this._valueClasses[_local_2] + ">." + getQualifiedClassName(this._valueClasses[_local_2]));
            }
         }
      }
      
      public function getNumListeners() : uint
      {
         return this.slots.getLength();
      }
      
      public function addOnce(_arg_1:Function) : ISlot
      {
         return this.registerListener(_arg_1,true);
      }
      
      public function add(_arg_1:Function) : ISlot
      {
         return this.registerListener(_arg_1);
      }
      
      public function remove(_arg_1:Function) : ISlot
      {
         var _local_2:ISlot = this.slots.find(_arg_1);
         if(!_local_2)
         {
            return null;
         }
         this.slots = this.slots.filterNot(_arg_1);
         return _local_2;
      }
      
      public function removeAll() : void
      {
         this.slots = SlotList.NIL;
      }
      
      public function dispatch(... _args) : void
      {
         var _local_4:int = 0;
         var _local_2:int = int(this._valueClasses.length);
         var _local_3:int = int(_args.length);
         if(_local_3 < _local_2)
         {
            throw new ArgumentError("Incorrect number of arguments. " + "Expected at least " + _local_2 + " but received " + _local_3 + ".");
         }
         while(_local_4 < _local_2)
         {
            if(!(_args[_local_4] is this._valueClasses[_local_4] || _args[_local_4] === null))
            {
               throw new ArgumentError("Value object <" + _args[_local_4] + "> is not an instance of <" + this._valueClasses[_local_4] + ">.");
            }
            _local_4++;
         }
         var _local_5:SlotList = this.slots;
         if(_local_5.nonEmpty)
         {
            while(_local_5.nonEmpty)
            {
               _local_5.head.execute(_args);
               _local_5 = _local_5.tail;
            }
         }
      }
      
      public function registerListener(_arg_1:Function, _arg_2:Boolean = false) : ISlot
      {
         var _local_3:ISlot = null;
         if(this.registrationPossible(_arg_1,_arg_2))
         {
            _local_3 = new Slot(_arg_1,this,_arg_2);
            this.slots = this.slots.prepend(_local_3);
            return _local_3;
         }
         return this.slots.find(_arg_1);
      }
      
      public function registrationPossible(_arg_1:Function, _arg_2:Boolean) : Boolean
      {
         if(!this.slots.nonEmpty)
         {
            return true;
         }
         var _local_3:ISlot = this.slots.find(_arg_1);
         if(!_local_3)
         {
            return true;
         }
         if(_local_3.getOnce() != _arg_2)
         {
            throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
         }
         return false;
      }
   }
}

