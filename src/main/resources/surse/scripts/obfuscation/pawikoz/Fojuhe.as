package obfuscation.pawikoz
{
   import filters.Filters;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import obfuscation.kumopurut.Sohezit;
   
   public class Fojuhe extends Sprite
   {
      
      private static const nejazej:int = 30000;
      
      protected var gitokigu:Boolean = true;
      
      private var mulihivur:Timer;
      
      private var stop:Boolean = false;
      
      private var gyqogikad:Boolean = false;
      
      protected var shadowContainer:Sprite = new Sprite();
      
      public function Fojuhe()
      {
         super();
         this.shadowContainer.filters = Filters.SHADOW_FILTERS;
         addChild(this.shadowContainer);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function pisypup() : void
      {
         alpha = 1;
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.stop = true;
      }
      
      public function jezupadi() : void
      {
         this.stop = false;
         if(this.gyqogikad)
         {
            this.wovucak();
         }
      }
      
      public function get alive() : Boolean
      {
         return this.gitokigu;
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         setTimeout(this.qivuwev,nejazej);
      }
      
      private function qivuwev() : void
      {
         this.gyqogikad = true;
         if(!this.stop)
         {
            this.wovucak();
         }
      }
      
      private function wovucak() : void
      {
         this.mulihivur = new Timer(50,20);
         this.mulihivur.addEventListener(TimerEvent.TIMER,this.jenybyf);
         this.mulihivur.addEventListener(TimerEvent.TIMER_COMPLETE,this.dep);
         this.mulihivur.start();
      }
      
      private function jenybyf(_arg_1:TimerEvent) : void
      {
         if(!this.stop)
         {
            alpha -= 0.05;
         }
         else
         {
            this.mulihivur.stop();
            alpha = 1;
         }
      }
      
      private function dep(_arg_1:TimerEvent) : void
      {
         this.gitokigu = false;
         dispatchEvent(new Sohezit(Sohezit.nasun,this));
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}

