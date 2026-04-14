package org.robotlegs.base
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IMediator;
   import org.robotlegs.core.IMediatorMap;
   import org.robotlegs.core.IReflector;
   
   public class MediatorMap extends ViewMapBase implements IMediatorMap
   {
      
      protected static const enterFrameDispatcher:Sprite = new Sprite();
      
      protected var mediatorByView:Dictionary;
      
      protected var mappingConfigByView:Dictionary;
      
      protected var mappingConfigByViewClassName:Dictionary;
      
      protected var mediatorsMarkedForRemoval:Dictionary;
      
      protected var hasMediatorsMarkedForRemoval:Boolean;
      
      protected var reflector:IReflector;
      
      public function MediatorMap(_arg_1:DisplayObjectContainer, _arg_2:IInjector, _arg_3:IReflector)
      {
         super(_arg_1,_arg_2);
         this.reflector = _arg_3;
         this.mediatorByView = new Dictionary(true);
         this.mappingConfigByView = new Dictionary(true);
         this.mappingConfigByViewClassName = new Dictionary(false);
         this.mediatorsMarkedForRemoval = new Dictionary(false);
      }
      
      public function mapView(_arg_1:*, _arg_2:Class, _arg_3:* = null, _arg_4:Boolean = true, _arg_5:Boolean = true) : void
      {
         var _local_6:String = this.reflector.getFQCN(_arg_1);
         if(this.mappingConfigByViewClassName[_local_6] != null)
         {
            throw new ContextError(ContextError.E_MEDIATORMAP_OVR + " - " + _arg_2);
         }
         if(this.reflector.classExtendsOrImplements(_arg_2,IMediator) == false)
         {
            throw new ContextError(ContextError.E_MEDIATORMAP_NOIMPL + " - " + _arg_2);
         }
         var _local_7:MappingConfig = new MappingConfig();
         _local_7.mediatorClass = _arg_2;
         _local_7.autoCreate = _arg_4;
         _local_7.autoRemove = _arg_5;
         if(Boolean(_arg_3))
         {
            if(_arg_3 is Array)
            {
               _local_7.typedViewClasses = (_arg_3 as Array).concat();
            }
            else if(_arg_3 is Class)
            {
               _local_7.typedViewClasses = [_arg_3];
            }
         }
         else if(_arg_1 is Class)
         {
            _local_7.typedViewClasses = [_arg_1];
         }
         this.mappingConfigByViewClassName[_local_6] = _local_7;
         if(_arg_4 || _arg_5)
         {
            ++viewListenerCount;
            if(viewListenerCount == 1)
            {
               this.addListeners();
            }
         }
         if(Boolean(_arg_4) && Boolean(contextView) && _local_6 == getQualifiedClassName(contextView))
         {
            this.createMediatorUsing(contextView,_local_6,_local_7);
         }
      }
      
      public function unmapView(_arg_1:*) : void
      {
         var _local_2:String = this.reflector.getFQCN(_arg_1);
         var _local_3:MappingConfig = this.mappingConfigByViewClassName[_local_2];
         if(Boolean(_local_3) && (_local_3.autoCreate || _local_3.autoRemove))
         {
            --viewListenerCount;
            if(viewListenerCount == 0)
            {
               this.removeListeners();
            }
         }
         delete this.mappingConfigByViewClassName[_local_2];
      }
      
      public function createMediator(_arg_1:Object) : IMediator
      {
         return this.createMediatorUsing(_arg_1);
      }
      
      public function registerMediator(_arg_1:Object, _arg_2:IMediator) : void
      {
         var _local_3:Class = this.reflector.getClass(_arg_2);
         injector.hasMapping(_local_3) && injector.unmap(_local_3);
         injector.mapValue(_local_3,_arg_2);
         this.mediatorByView[_arg_1] = _arg_2;
         this.mappingConfigByView[_arg_1] = this.mappingConfigByViewClassName[getQualifiedClassName(_arg_1)];
         _arg_2.setViewComponent(_arg_1);
         _arg_2.preRegister();
      }
      
      public function removeMediator(_arg_1:IMediator) : IMediator
      {
         var _local_2:Object = null;
         var _local_3:Class = null;
         if(Boolean(_arg_1))
         {
            _local_2 = _arg_1.getViewComponent();
            _local_3 = this.reflector.getClass(_arg_1);
            delete this.mediatorByView[_local_2];
            delete this.mappingConfigByView[_local_2];
            _arg_1.preRemove();
            _arg_1.setViewComponent(null);
            injector.hasMapping(_local_3) && injector.unmap(_local_3);
         }
         return _arg_1;
      }
      
      public function removeMediatorByView(_arg_1:Object) : IMediator
      {
         return this.removeMediator(this.retrieveMediator(_arg_1));
      }
      
      public function retrieveMediator(_arg_1:Object) : IMediator
      {
         return this.mediatorByView[_arg_1];
      }
      
      public function hasMapping(_arg_1:*) : Boolean
      {
         var _local_2:String = this.reflector.getFQCN(_arg_1);
         return this.mappingConfigByViewClassName[_local_2] != null;
      }
      
      public function hasMediatorForView(_arg_1:Object) : Boolean
      {
         return this.mediatorByView[_arg_1] != null;
      }
      
      public function hasMediator(_arg_1:IMediator) : Boolean
      {
         var _local_2:IMediator = null;
         for each(_local_2 in this.mediatorByView)
         {
            if(_local_2 == _arg_1)
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function addListeners() : void
      {
         if(Boolean(contextView) && enabled)
         {
            contextView.addEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture,0,true);
            contextView.addEventListener(Event.REMOVED_FROM_STAGE,this.onViewRemoved,useCapture,0,true);
         }
      }
      
      override protected function removeListeners() : void
      {
         if(Boolean(contextView))
         {
            contextView.removeEventListener(Event.ADDED_TO_STAGE,this.onViewAdded,useCapture);
            contextView.removeEventListener(Event.REMOVED_FROM_STAGE,this.onViewRemoved,useCapture);
         }
      }
      
      override protected function onViewAdded(_arg_1:Event) : void
      {
         if(Boolean(this.mediatorsMarkedForRemoval[_arg_1.target]))
         {
            delete this.mediatorsMarkedForRemoval[_arg_1.target];
            return;
         }
         var _local_2:String = getQualifiedClassName(_arg_1.target);
         var _local_3:MappingConfig = this.mappingConfigByViewClassName[_local_2];
         if(Boolean(_local_3) && _local_3.autoCreate)
         {
            this.createMediatorUsing(_arg_1.target,_local_2,_local_3);
         }
      }
      
      protected function createMediatorUsing(_arg_1:Object, _arg_2:String = "", _arg_3:MappingConfig = null) : IMediator
      {
         var _local_5:Class = null;
         var _local_6:Class = null;
         var _local_4:IMediator = this.mediatorByView[_arg_1];
         if(_local_4 == null)
         {
            _arg_2 ||= getQualifiedClassName(_arg_1);
            _arg_3 ||= this.mappingConfigByViewClassName[_arg_2];
            if(Boolean(_arg_3))
            {
               for each(_local_5 in _arg_3.typedViewClasses)
               {
                  injector.mapValue(_local_5,_arg_1);
               }
               _local_4 = injector.instantiate(_arg_3.mediatorClass);
               for each(_local_6 in _arg_3.typedViewClasses)
               {
                  injector.unmap(_local_6);
               }
               this.registerMediator(_arg_1,_local_4);
            }
         }
         return _local_4;
      }
      
      protected function onViewRemoved(_arg_1:Event) : void
      {
         var _local_2:MappingConfig = this.mappingConfigByView[_arg_1.target];
         if(Boolean(_local_2) && _local_2.autoRemove)
         {
            this.mediatorsMarkedForRemoval[_arg_1.target] = _arg_1.target;
            if(!this.hasMediatorsMarkedForRemoval)
            {
               this.hasMediatorsMarkedForRemoval = true;
               enterFrameDispatcher.addEventListener(Event.ENTER_FRAME,this.removeMediatorLater);
            }
         }
      }
      
      protected function removeMediatorLater(_arg_1:Event) : void
      {
         var _local_2:DisplayObject = null;
         enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME,this.removeMediatorLater);
         for each(_local_2 in this.mediatorsMarkedForRemoval)
         {
            if(!_local_2.stage)
            {
               this.removeMediatorByView(_local_2);
            }
            delete this.mediatorsMarkedForRemoval[_local_2];
         }
         this.hasMediatorsMarkedForRemoval = false;
      }
   }
}

class MappingConfig
{
   
   public var mediatorClass:Class;
   
   public var typedViewClasses:Array;
   
   public var autoCreate:Boolean;
   
   public var autoRemove:Boolean;
   
   public function MappingConfig()
   {
      super();
   }
}
