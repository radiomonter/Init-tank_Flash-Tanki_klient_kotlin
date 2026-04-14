package com.reygazu.anticheat.events
{
   import flash.events.Event;
   
   public class CheatManagerEvent extends Event
   {
      
      public static var FORCE_HOP:String = "forceHop";
      
      public static var CHEAT_DETECTION:String = "cheatDetection";
      
      public var data:Object;
      
      public function CheatManagerEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

