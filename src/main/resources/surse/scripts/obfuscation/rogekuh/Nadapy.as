package obfuscation.rogekuh
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import obfuscation.tihah.Bifywily;
   import obfuscation.tihah.Hyn;
   
   public class Nadapy extends Bifywily
   {
      
      private var timer:Timer;
      
      private var veqydyl:uint;
      
      private var ceryjira:Boolean;
      
      public function Nadapy(_arg_1:int, _arg_2:int, _arg_3:Hyn, _arg_4:Boolean)
      {
         super(_arg_1,_arg_2,_arg_3);
         this.ceryjira = _arg_4;
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private static function jera(_arg_1:int) : String
      {
         var _local_2:int = int(_arg_1 / 60);
         return _local_2 > 9 ? _local_2.toString() : "0" + _local_2.toString();
      }
      
      private static function lufome(_arg_1:int) : String
      {
         var _local_2:int = _arg_1 % 60;
         return _local_2 > 9 ? _local_2.toString() : "0" + _local_2.toString();
      }
      
      public function kir(_arg_1:int) : void
      {
         this.veqydyl = Math.round(getTimer() / 1000 + _arg_1);
         value = _arg_1;
         if(_value > 0)
         {
            this.timer.stop();
            this.timer.start();
         }
         else
         {
            gif();
         }
      }
      
      public function bysucawab() : void
      {
         this.timer.stop();
      }
      
      override protected function updateLabel() : void
      {
         if(this.ceryjira)
         {
            label.text = _value < 10 ? "0" + _value.toString() : _value.toString();
         }
         else
         {
            label.text = jera(_value) + " : " + lufome(_value);
         }
      }
      
      override protected function onRemovedFromStage(_arg_1:Event) : void
      {
         super.onRemovedFromStage(_arg_1);
         this.timer.stop();
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:int = 0;
         if(_value > 0)
         {
            _local_2 = int(Math.round(this.veqydyl - getTimer() / 1000));
            value = _local_2 < 0 ? int(0) : int(_local_2);
         }
         else
         {
            this.timer.stop();
         }
      }
   }
}

