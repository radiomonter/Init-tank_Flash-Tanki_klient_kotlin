package obfuscation.tihah
{
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class Hyn
   {
      
      private static var _instance:Hyn;
      
      private var timer:Timer;
      
      private var kipyf:Dictionary;
      
      private var horigoq:int;
      
      private var visible:Boolean;
      
      public function Hyn(_arg_1:int)
      {
         super();
         this.kipyf = new Dictionary();
         this.timer = new Timer(_arg_1);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public static function init(_arg_1:int) : void
      {
         if(_instance == null)
         {
            _instance = new Hyn(_arg_1);
         }
      }
      
      public static function get instance() : Hyn
      {
         return _instance;
      }
      
      public function maneva(_arg_1:Bifywily) : void
      {
         if(this.kipyf[_arg_1] != null)
         {
            return;
         }
         this.kipyf[_arg_1] = _arg_1;
         ++this.horigoq;
         if(this.horigoq == 1)
         {
            this.timer.start();
         }
      }
      
      public function qemisyge(_arg_1:Bifywily) : void
      {
         if(this.kipyf[_arg_1] == null)
         {
            return;
         }
         delete this.kipyf[_arg_1];
         --this.horigoq;
         if(this.horigoq == 0)
         {
            this.timer.stop();
            this.visible = true;
         }
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:Bifywily = null;
         if(this.horigoq == 0)
         {
            return;
         }
         this.visible = !this.visible;
         for each(_local_2 in this.kipyf)
         {
            _local_2.jec = this.visible;
         }
      }
   }
}

