package obfuscation.ligy
{
   import obfuscation.bude.BattleTeam;
   
   public interface Rypybuje
   {
      
      function pointCaptureStarted(param1:BattleTeam) : void;
      
      function pointCaptureStopped(param1:BattleTeam) : void;
      
      function setPointProgress(param1:int, param2:Number, param3:Number) : void;
      
      function setPointState(param1:int, param2:Zyjova) : void;
      
      function vyjo() : void;
      
      function tankEnteredPointZone(param1:int, param2:String) : void;
      
      function tankLeftPointZone(param1:int, param2:String) : void;
   }
}

