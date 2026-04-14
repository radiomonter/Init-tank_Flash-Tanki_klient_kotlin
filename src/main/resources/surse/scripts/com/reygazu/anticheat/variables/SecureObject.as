package com.reygazu.anticheat.variables
{
   import com.reygazu.anticheat.events.CheatManagerEvent;
   import com.reygazu.anticheat.managers.CheatManager;
   
   public dynamic class SecureObject
   {
      
      private var id:String;
      
      private var _name:String;
      
      public function SecureObject(_arg_1:String = "Unnamed SecureObject", _arg_2:Object = 0)
      {
         super();
         this._name = _arg_1;
         this.objectValue = _arg_2;
         CheatManager.getInstance().addEventListener(CheatManagerEvent.FORCE_HOP,this.onForceHop);
      }
      
      public function set objectValue(_arg_1:Object) : void
      {
         if(this.hasOwnProperty(this.id))
         {
            delete this[this.id];
         }
         this.hop();
         this[this.id] = _arg_1;
         this["fake"] = _arg_1;
      }
      
      public function get objectValue() : Object
      {
         return this[this.id];
      }
      
      private function hop() : void
      {
         var _local_1:String = this.id;
         while(this.id == _local_1)
         {
            this.id = String(Math.round(Math.random() * 1048575));
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      private function onForceHop(_arg_1:CheatManagerEvent) : void
      {
         var _local_2:Object = this.objectValue;
         this.objectValue = _local_2;
      }
   }
}

