package projects.tanks.clients.flash.commons.models.gpu
{
   import flash.display.Stage;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.setTimeout;
   
   public class GPUCapabilities extends EventDispatcher
   {
      
      private static var _gpuEnabled:Boolean;
      
      private static var _constrained:Boolean;
      
      private var stage:Stage;
      
      public function GPUCapabilities(_arg_1:Stage)
      {
         super();
         this.stage = _arg_1;
      }
      
      public static function get gpuEnabled() : Boolean
      {
         return _gpuEnabled;
      }
      
      public static function get constrained() : Boolean
      {
         return _constrained;
      }
      
      public function detect() : void
      {
         if(this.stage3DExists())
         {
            this.getContext3D();
         }
         else
         {
            this.dispatchCompleteEventWithDelay();
         }
      }
      
      private function stage3DExists() : Boolean
      {
         return this.stage.hasOwnProperty("stage3Ds");
      }
      
      private function getContext3D() : void
      {
         var _local_1:Object = this.getStage3D();
         _local_1.addEventListener("context3DCreate",this.onContext3DCreate);
         _local_1.addEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
         _local_1.requestContext3D("auto");
      }
      
      private function onContext3DCreate(_arg_1:Event) : void
      {
         this.removeListeners();
         this.detectGPUAcceleration();
         if(!_gpuEnabled && this.isConstrainedAvaible())
         {
            this.getContext3DConstrained();
         }
         else
         {
            this.dispatchCompleteEvent();
         }
      }
      
      private function isConstrainedAvaible() : Boolean
      {
         var _local_1:Object = this.getStage3D();
         return _local_1.requestContext3D.length > 1;
      }
      
      private function getContext3DConstrained() : void
      {
         _constrained = true;
         var _local_1:Object = this.getStage3D();
         _local_1.addEventListener("context3DCreate",this.onContext3DCreateConstrained);
         _local_1.addEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
         _local_1.requestContext3D("auto","baselineConstrained");
      }
      
      private function onContext3DCreateConstrained(_arg_1:Event) : void
      {
         this.removeListeners();
         this.detectGPUAcceleration();
         this.dispatchCompleteEvent();
      }
      
      private function detectGPUAcceleration() : void
      {
         var _local_1:Object = this.getStage3D();
         var _local_2:Object = _local_1.context3D;
         var _local_3:String = _local_2.driverInfo;
         _gpuEnabled = _local_3.toLowerCase().indexOf("software") == -1;
         _local_2.dispose();
      }
      
      private function onContext3DCreateError(_arg_1:ErrorEvent) : void
      {
         this.removeListeners();
         this.dispatchCompleteEvent();
      }
      
      private function getStage3D() : Object
      {
         return this.stage["stage3Ds"][0];
      }
      
      private function removeListeners() : void
      {
         var _local_1:Object = this.getStage3D();
         _local_1.removeEventListener("context3DCreate",this.onContext3DCreate);
         _local_1.removeEventListener("context3DCreate",this.onContext3DCreateConstrained);
         _local_1.removeEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
      }
      
      private function dispatchCompleteEventWithDelay() : void
      {
         setTimeout(this.dispatchCompleteEvent,0);
      }
      
      private function dispatchCompleteEvent() : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

