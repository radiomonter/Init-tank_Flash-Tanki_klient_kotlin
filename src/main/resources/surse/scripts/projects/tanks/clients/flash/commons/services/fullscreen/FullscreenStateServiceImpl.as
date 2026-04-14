package projects.tanks.clients.flash.commons.services.fullscreen
{
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   
   public class FullscreenStateServiceImpl implements FullscreenStateService
   {
      
      private static const EVENT_HANDLERS_DELAY:int = 250;
      
      private var _fullScreenWithDelay:Boolean;
      
      private var _setFullscreenFalseTimeout:uint;
      
      public function FullscreenStateServiceImpl(_arg_1:IDisplay, _arg_2:Boolean)
      {
         super();
         if(_arg_2)
         {
            _arg_1.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.onFullscreen);
            this._fullScreenWithDelay = _arg_1.stage.displayState != StageDisplayState.NORMAL;
         }
      }
      
      private function onFullscreen(_arg_1:FullScreenEvent) : void
      {
         clearTimeout(this._setFullscreenFalseTimeout);
         if(_arg_1.fullScreen)
         {
            this._fullScreenWithDelay = true;
         }
         else
         {
            this._setFullscreenFalseTimeout = setTimeout(this.setFullScreenFalse,EVENT_HANDLERS_DELAY);
         }
      }
      
      private function setFullScreenFalse() : void
      {
         this._fullScreenWithDelay = false;
      }
      
      public function isFullscreen() : Boolean
      {
         return this._fullScreenWithDelay;
      }
   }
}

