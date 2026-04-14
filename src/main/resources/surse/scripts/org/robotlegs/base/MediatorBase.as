package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getDefinitionByName;
   import org.robotlegs.core.IMediator;
   
   public class MediatorBase implements IMediator
   {
      
      protected static var UIComponentClass:Class;
      
      protected static const flexAvailable:Boolean = checkFlex();
      
      protected var viewComponent:Object;
      
      protected var removed:Boolean;
      
      public function MediatorBase()
      {
         super();
      }
      
      protected static function checkFlex() : Boolean
      {
         try
         {
            UIComponentClass = getDefinitionByName("mx.core::UIComponent") as Class;
         }
         catch(error:Error)
         {
         }
         return UIComponentClass != null;
      }
      
      public function preRegister() : void
      {
         this.removed = false;
         if(flexAvailable && this.viewComponent is UIComponentClass && !this.viewComponent["initialized"])
         {
            IEventDispatcher(this.viewComponent).addEventListener("creationComplete",this.onCreationComplete,false,0,true);
         }
         else
         {
            this.onRegister();
         }
      }
      
      public function onRegister() : void
      {
      }
      
      public function preRemove() : void
      {
         this.removed = true;
         this.onRemove();
      }
      
      public function onRemove() : void
      {
      }
      
      public function getViewComponent() : Object
      {
         return this.viewComponent;
      }
      
      public function setViewComponent(_arg_1:Object) : void
      {
         this.viewComponent = _arg_1;
      }
      
      protected function onCreationComplete(_arg_1:Event) : void
      {
         IEventDispatcher(_arg_1.target).removeEventListener("creationComplete",this.onCreationComplete);
         if(!this.removed)
         {
            this.onRegister();
         }
      }
   }
}

