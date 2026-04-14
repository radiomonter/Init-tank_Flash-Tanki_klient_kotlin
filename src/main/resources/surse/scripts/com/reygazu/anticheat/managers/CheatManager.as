package com.reygazu.anticheat.managers
{
   import com.reygazu.anticheat.events.CheatManagerEvent;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class CheatManager extends EventDispatcher
   {
      
      protected static var _instance:CheatManager;
      
      private var _focusHop:Boolean;
      
      private var _secureVars:Array;
      
      private var stage:Stage;
      
      public function CheatManager(_arg_1:Function = null)
      {
         super();
         if(_arg_1 != CheatManager.getInstance)
         {
            throw new Error("CheatManager is a singleton class, use getInstance() instead");
         }
         if(CheatManager._instance != null)
         {
            throw new Error("Only one CheatManager instance should be instantiated");
         }
      }
      
      public static function getInstance() : CheatManager
      {
         if(_instance == null)
         {
            _instance = new CheatManager(arguments.callee);
            _instance.init();
         }
         return _instance;
      }
      
      private function init() : void
      {
         this._secureVars = new Array();
         this._focusHop = false;
      }
      
      public function set enableFocusHop(_arg_1:Boolean) : void
      {
         this._focusHop = _arg_1;
      }
      
      private function onLostFocusHandler(_arg_1:Event) : void
      {
         if(this._focusHop)
         {
            this.doHop();
         }
      }
      
      public function doHop() : void
      {
         this.dispatchEvent(new CheatManagerEvent(CheatManagerEvent.FORCE_HOP));
      }
      
      public function detectCheat(_arg_1:String, _arg_2:Object, _arg_3:Object) : void
      {
         var _local_4:CheatManagerEvent = new CheatManagerEvent(CheatManagerEvent.CHEAT_DETECTION);
         _local_4.data = {
            "variableName":_arg_1,
            "fakeValue":_arg_2,
            "realValue":_arg_3
         };
         CheatManager.getInstance().dispatchEvent(_local_4);
      }
   }
}

