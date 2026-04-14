package org.robotlegs.base
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IViewMap;
   
   public class ViewMap extends ViewMapBase implements IViewMap
   {
      
      protected var mappedPackages:Array;
      
      protected var mappedTypes:Dictionary;
      
      protected var injectedViews:Dictionary;
      
      public function ViewMap(_arg_1:DisplayObjectContainer, _arg_2:IInjector)
      {
         super(_arg_1,_arg_2);
         this.mappedPackages = new Array();
         this.mappedTypes = new Dictionary(false);
         this.injectedViews = new Dictionary(true);
      }
      
      public function mapPackage(_arg_1:String) : void
      {
         if(this.mappedPackages.indexOf(_arg_1) == -1)
         {
            this.mappedPackages.push(_arg_1);
            ++viewListenerCount;
            if(viewListenerCount == 1)
            {
               this.addListeners();
            }
         }
      }
      
      public function unmapPackage(_arg_1:String) : void
      {
         var _local_2:int = this.mappedPackages.indexOf(_arg_1);
         if(_local_2 > -1)
         {
            this.mappedPackages.splice(_local_2,1);
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
      }
      
      public function mapType(_arg_1:Class) : void
      {
         if(Boolean(this.mappedTypes[_arg_1]))
         {
            return;
         }
         this.mappedTypes[_arg_1] = _arg_1;
         ++viewListenerCount;
         if(viewListenerCount == 1)
         {
            this.addListeners();
         }
         if(Boolean(contextView) && contextView is _arg_1)
         {
            this.injectInto(contextView);
         }
      }
      
      public function unmapType(_arg_1:Class) : void
      {
         var _local_2:Class = this.mappedTypes[_arg_1];
         delete this.mappedTypes[_arg_1];
         if(Boolean(_local_2))
         {
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
      }
      
      public function hasType(_arg_1:Class) : Boolean
      {
         return this.mappedTypes[_arg_1] != null;
      }
      
      public function hasPackage(_arg_1:String) : Boolean
      {
         return this.mappedPackages.indexOf(_arg_1) > -1;
      }
      
      override protected function addListeners() : void
      {
         if(Boolean(contextView) && enabled)
         {
            contextView.addEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture,0,true);
         }
      }
      
      override protected function removeListeners() : void
      {
         if(Boolean(contextView))
         {
            contextView.removeEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture);
         }
      }
      
      override protected function onViewAdded(_arg_1:Event) : void
      {
         var _local_3:Class = null;
         var _local_4:int = 0;
         var _local_5:String = null;
         var _local_6:int = 0;
         var _local_7:String = null;
         var _local_2:DisplayObject = DisplayObject(_arg_1.target);
         if(Boolean(this.injectedViews[_local_2]))
         {
            return;
         }
         for each(_local_3 in this.mappedTypes)
         {
            if(_local_2 is _local_3)
            {
               this.injectInto(_local_2);
               return;
            }
         }
         _local_4 = int(this.mappedPackages.length);
         if(_local_4 > 0)
         {
            _local_5 = getQualifiedClassName(_local_2);
            _local_6 = 0;
            while(_local_6 < _local_4)
            {
               _local_7 = this.mappedPackages[_local_6];
               if(_local_5.indexOf(_local_7) == 0)
               {
                  this.injectInto(_local_2);
                  return;
               }
               _local_6++;
            }
         }
      }
      
      protected function injectInto(_arg_1:DisplayObject) : void
      {
         injector.injectInto(_arg_1);
         this.injectedViews[_arg_1] = true;
      }
   }
}

