package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.PerformanceController;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class PerformanceControllerWithThrottling extends PerformanceController
   {
      
      private var stage:Stage;
      
      private var inited:Boolean = false;
      
      public function PerformanceControllerWithThrottling()
      {
         super();
      }
      
      private function init() : void
      {
         var qualityVisualizationSpeed:Number = NaN;
         if(!this.inited)
         {
            qualityVisualizationSpeed = 0.2;
            addFeature("shadows",qualityVisualizationSpeed,true);
            addFeature("shadowMap",qualityVisualizationSpeed,false);
            addFeature("deferredLighting",qualityVisualizationSpeed,false);
            addFeature("fog",qualityVisualizationSpeed,true);
            addFeature("softTransparency",qualityVisualizationSpeed,false);
            addFeature("ssao",qualityVisualizationSpeed,false);
            addFeature("antiAlias",qualityVisualizationSpeed,false);
            this.inited = true;
         }
      }
      
      public function start1(param1:Stage, param2:Camera3D, param3:String) : void
      {
         this.init();
         this.stage = param1;
         param1.addEventListener("activate",this.onActivate);
         param1.addEventListener("deactivate",this.onDeactivate);
         start(param1,param2,30,0.15,20,5,1,param3);
      }
      
      private function onActivate(param1:Event) : void
      {
         block = false;
      }
      
      private function onDeactivate(param1:Event) : void
      {
         block = true;
      }
      
      override public function stop() : void
      {
         super.stop();
         this.stage.removeEventListener("activate",this.onActivate);
         this.stage.removeEventListener("deactivate",this.onDeactivate);
         this.stage = null;
      }
   }
}

