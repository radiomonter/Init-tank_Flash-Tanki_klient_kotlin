package fominskiy.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.LogicUnit;
   import flash.utils.getTimer;
   
   public class Cipe implements LogicUnit
   {
      
      private static const qijomuf:int = 5000;
      
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var fifi:int;
      
      private var posoqegy:Boolean = true;
      
      public function Cipe()
      {
         super();
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = getTimer();
         if(this.posoqegy)
         {
            this.fifi = _local_3;
            this.posoqegy = false;
         }
         if(display.stage.frameRate >= 70 && this.fifi + qijomuf >= _local_3)
         {
            this.karag();
            this.fifi = _local_3;
         }
      }
      
      private function karag() : void
      {
         display.stage.frameRate = 10;
      }
   }
}

