package org.robotlegs.base
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import org.robotlegs.core.IInjector;
   
   public class ViewMapBase
   {
      
      protected var _enabled:Boolean = true;
      
      protected var _contextView:DisplayObjectContainer;
      
      protected var injector:IInjector;
      
      protected var useCapture:Boolean;
      
      protected var viewListenerCount:uint;
      
      public function ViewMapBase(_arg_1:DisplayObjectContainer, _arg_2:IInjector)
      {
         super();
         this.injector = _arg_2;
         this.useCapture = true;
         this.contextView = _arg_1;
      }
      
      public function get contextView() : DisplayObjectContainer
      {
         return this._contextView;
      }
      
      public function set contextView(_arg_1:DisplayObjectContainer) : void
      {
         if(_arg_1 != this._contextView)
         {
            this.removeListeners();
            this._contextView = _arg_1;
            if(this.viewListenerCount > 0)
            {
               this.addListeners();
            }
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(_arg_1 != this._enabled)
         {
            this.removeListeners();
            this._enabled = _arg_1;
            if(this.viewListenerCount > 0)
            {
               this.addListeners();
            }
         }
      }
      
      protected function addListeners() : void
      {
      }
      
      protected function removeListeners() : void
      {
      }
      
      protected function onViewAdded(_arg_1:Event) : void
      {
      }
   }
}

