package alternativa.tanks.help
{
   import alternativa.init.TanksServicesActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class HelpService implements IHelpService
   {
      
      private const showPeriod:int = 86400000;
      
      private const showCount:int = 5;
      
      private var storage:SharedObject;
      
      private var stage:Stage;
      
      private var helpLayer:DisplayObjectContainer;
      
      private var helpContainer:Sprite;
      
      private var helpGroups:Dictionary;
      
      private var mainGroupObjects:Array;
      
      private var advancedUser:Boolean;
      
      private var timers:Array;
      
      private var listenerAdded:Boolean;
      
      private var currentlyVisibleHelpers:Dictionary;
      
      private var storedState:Dictionary = new Dictionary();
      
      private var addedDuringLock:Vector.<ShowedHelperInfo> = new Vector.<ShowedHelperInfo>();
      
      private var hidedHelpers:Vector.<Object>;
      
      private var locked:Boolean = false;
      
      public function HelpService()
      {
         var _local_1:* = undefined;
         super();
         var _local_2:OSGi = TanksServicesActivator.osgi;
         var _local_3:IDisplay = IDisplay(_local_2.getService(IDisplay));
         this.stage = _local_3.stage;
         this.helpLayer = _local_3.noticesLayer;
         this.helpContainer = new Sprite();
         this.helpGroups = new Dictionary();
         this.mainGroupObjects = new Array();
         this.timers = new Array();
         this.storage = IStorageService(_local_2.getService(IStorageService)).getStorage();
         for(_local_1 in this.storage.data)
         {
            OSGi.clientLog.log("helper","%1: %2",_local_1,this.storage.data[_local_1]);
         }
         if(!this.storage.data.helperShowNum)
         {
            this.storage.data.helperShowNum = new Vector.<Object>();
            this.storage.flush();
         }
         if(this.storage.data.hidedHelpers as Vector.<Object> == null)
         {
            this.storage.data.hidedHelpers = new Vector.<Object>();
            this.storage.flush();
         }
         this.hidedHelpers = this.storage.data.hidedHelpers as Vector.<Object>;
         OSGi.clientLog.log("helper","hidedHelpers = %1",this.hidedHelpers);
         OSGi.clientLog.log("helper","userRank = %1",int(this.storage.data.userRank));
         this.advancedUser = int(this.storage.data.userRank) >= 6;
         this.currentlyVisibleHelpers = new Dictionary();
         this.stage.addEventListener(Event.RESIZE,this.onStageResize);
      }
      
      public function registerHelper(_arg_1:String, _arg_2:int, _arg_3:Helper, _arg_4:Boolean) : void
      {
         var _local_5:Object = null;
         var _local_9:int = 0;
         var _local_6:Dictionary = this.helpGroups[_arg_1];
         if(_local_6 == null)
         {
            _local_6 = new Dictionary();
            this.helpGroups[_arg_1] = _local_6;
         }
         _local_6[_arg_2] = _arg_3;
         if(_arg_4)
         {
            this.mainGroupObjects.push(_arg_3);
         }
         var _local_7:Vector.<Object> = this.storage.data.helperShowNum != null && this.storage.data.helperShowNum is Vector.<Object> ? this.storage.data.helperShowNum as Vector.<Object> : new Vector.<Object>();
         var _local_8:int = -1;
         while(_local_9 < _local_7.length)
         {
            if(_local_7[_local_9].hasOwnProperty("groupKey") && _local_7[_local_9].groupKey == _arg_1)
            {
               _local_8 = _local_9;
            }
            _local_9++;
         }
         if(_local_8 == -1)
         {
            _local_5 = new Object();
            _local_5.groupKey = _arg_1;
            _local_5.helper = new Array();
            _local_7.push(_local_5);
            _local_8 = _local_7.length - 1;
         }
         if(_local_7[_local_8].helper == null)
         {
            _local_7[_local_8].helper = new Array();
         }
         if(_local_7[_local_8].helper[_arg_2] == null)
         {
            _local_7[_local_8].helper[_arg_2] = _arg_3.showNum;
         }
         else
         {
            _arg_3.showNum = _local_7[_local_8].helper[_arg_2];
         }
         this.storage.data.helperShowNum = _local_7;
         this.storage.flush();
         _arg_3.id = _arg_2;
         _arg_3.groupKey = _arg_1;
      }
      
      public function unregisterHelper(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:Dictionary = this.helpGroups[_arg_1];
         if(_local_3 == null)
         {
            return;
         }
         var _local_4:Helper = _local_3[_arg_2];
         if(_local_4 == null)
         {
            return;
         }
         this.doHideHelper(_local_4);
         delete _local_3[_arg_2];
         var _local_5:int = this.mainGroupObjects.indexOf(_local_4);
         if(_local_5 >= 0)
         {
            this.mainGroupObjects.splice(_local_5,1);
         }
      }
      
      public function showHelperIfAble(_arg_1:String, _arg_2:int, _arg_3:Boolean = false) : void
      {
         if(this.locked)
         {
            this.addedDuringLock.push(new ShowedHelperInfo(_arg_1,_arg_2,_arg_3));
         }
         else
         {
            this.showHelper(_arg_1,_arg_2,_arg_3);
         }
      }
      
      public function showHelper(_arg_1:String, _arg_2:int, _arg_3:Boolean = false) : void
      {
         var _local_4:Vector.<Object> = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:Object = null;
         var _local_8:HelperTimer = null;
         if(this.advancedUser || this.helperHiddenManually(_arg_1,_arg_2))
         {
            return;
         }
         var _local_9:Helper = this.getHelper(_arg_1,_arg_2);
         if(_local_9 == null)
         {
            return;
         }
         if(!this.helpLayer.contains(this.helpContainer))
         {
            this.helpLayer.addChild(this.helpContainer);
         }
         if(_arg_3 || _local_9.showLimit == -1 || _local_9.showNum < _local_9.showLimit)
         {
            if(!this.helpContainer.contains(_local_9))
            {
               ++_local_9.showNum;
               this.currentlyVisibleHelpers[_local_9] = new ShowedHelperInfo(_arg_1,_arg_2,_arg_3);
               _local_4 = this.storage.data.helperShowNum != null && this.storage.data.helperShowNum is Vector.<Object> ? this.storage.data.helperShowNum as Vector.<Object> : new Vector.<Object>();
               _local_5 = -1;
               _local_6 = 0;
               while(_local_6 < _local_4.length)
               {
                  if(_local_4[_local_6].hasOwnProperty("groupKey") && _local_4[_local_6].groupKey == _arg_1)
                  {
                     _local_5 = _local_6;
                  }
                  _local_6++;
               }
               if(_local_5 == -1)
               {
                  _local_7 = new Object();
                  _local_7.groupKey = _arg_1;
                  _local_7.helper = new Array();
                  _local_7.helper[_arg_2] = _local_9.showNum;
                  _local_4.push(_local_7);
               }
               else
               {
                  _local_4[_local_5].helper[_arg_2] = _local_9.showNum;
               }
               this.storage.data.helperShowNum = _local_4;
               this.storage.flush();
               this.helpContainer.addChild(_local_9);
               _local_9.draw(_local_9.size);
               _local_9.align(this.stage.stageWidth,this.stage.stageHeight);
               _local_9.addEventListener(MouseEvent.MOUSE_DOWN,this.onHelperClick);
               if(!_arg_3)
               {
                  _local_8 = new HelperTimer(_local_9.showDuration,1);
                  _local_8.helper = _local_9;
                  _local_9.timer = _local_8;
                  _local_8.addEventListener(TimerEvent.TIMER_COMPLETE,this.onHelperTimer);
                  this.timers.push(_local_8);
                  _local_8.start();
               }
            }
         }
      }
      
      private function helperHiddenManually(_arg_1:String, _arg_2:int) : Boolean
      {
         var _local_3:Object = null;
         var _local_4:Date = new Date();
         for each(_local_3 in this.hidedHelpers)
         {
            if(_local_3.groupKey == _arg_1 && _local_3.helperId == _arg_2)
            {
               return _local_4.time - _local_3.date.time < this.showPeriod || _local_3.count >= this.showCount;
            }
         }
         return false;
      }
      
      public function hideAllHelpers() : void
      {
         var _local_1:Helper = null;
         if(this.helpContainer != null)
         {
            while(this.helpContainer.numChildren != 0)
            {
               _local_1 = this.helpContainer.getChildAt(0) as Helper;
               this.hideHelper(_local_1.groupKey,_local_1.id);
            }
            if(this.helpContainer.numChildren == 0 && this.helpLayer.contains(this.helpContainer))
            {
               this.helpLayer.removeChild(this.helpContainer);
            }
         }
      }
      
      public function hideHelper(_arg_1:String, _arg_2:int) : void
      {
         if(this.currentlyVisibleHelpers[this.getHelper(_arg_1,_arg_2)] != null)
         {
            delete this.currentlyVisibleHelpers[this.getHelper(_arg_1,_arg_2)];
         }
         this.doHideHelper(this.getHelper(_arg_1,_arg_2));
         this.checkContainerEmptiness();
      }
      
      private function checkContainerEmptiness() : void
      {
         if(this.helpContainer.numChildren == 0 && this.helpLayer.contains(this.helpContainer))
         {
            this.helpLayer.removeChild(this.helpContainer);
         }
      }
      
      public function showHelp() : void
      {
         var _local_1:Helper = null;
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(!this.helpLayer.contains(this.helpContainer))
         {
            this.helpLayer.addChild(this.helpContainer);
         }
         while(_local_3 < this.mainGroupObjects.length)
         {
            _local_1 = this.mainGroupObjects[_local_3] as Helper;
            if(!this.helpContainer.contains(_local_1))
            {
               this.helpContainer.addChild(_local_1);
               _local_1.draw(_local_1.size);
               _local_1.align(this.stage.stageWidth,this.stage.stageHeight);
            }
            else
            {
               _local_2 = this.timers.indexOf(_local_1.timer);
               if(_local_2 != -1)
               {
                  HelperTimer(this.timers[_local_2]).stop();
                  this.timers.splice(_local_2,1);
               }
            }
            this.currentlyVisibleHelpers[_local_1] = new ShowedHelperInfo(_local_1.groupKey,_local_1.id,true);
            _local_3++;
         }
         if(!this.listenerAdded)
         {
            this.listenerAdded = true;
            this.stage.addEventListener(MouseEvent.CLICK,this.onStageMouseClick,true);
         }
      }
      
      public function hideHelp() : void
      {
         var _local_1:Helper = null;
         var _local_2:int = 0;
         var _local_3:int = 0;
         while(_local_3 < this.mainGroupObjects.length)
         {
            _local_1 = this.mainGroupObjects[_local_3];
            _local_2 = this.timers.indexOf(_local_1.timer);
            if(_local_2 != -1)
            {
               (this.timers[_local_2] as HelperTimer).stop();
               this.timers.splice(_local_2,1);
            }
            if(this.helpContainer.contains(_local_1))
            {
               this.helpContainer.removeChild(_local_1);
            }
            if(this.currentlyVisibleHelpers[_local_1] != null)
            {
               delete this.currentlyVisibleHelpers[_local_1];
            }
            _local_3++;
         }
         this.checkContainerEmptiness();
         if(this.listenerAdded)
         {
            this.listenerAdded = false;
            this.stage.removeEventListener(MouseEvent.CLICK,this.onStageMouseClick,true);
         }
      }
      
      public function setHelperTextFormat(_arg_1:TextFormat, _arg_2:Boolean) : void
      {
         BubbleHelper.setTextFormat(_arg_1,_arg_2);
      }
      
      public function pushState() : void
      {
         var _local_1:* = null;
         this.storedState = new Dictionary();
         for(_local_1 in this.currentlyVisibleHelpers)
         {
            this.storedState[_local_1] = this.currentlyVisibleHelpers[_local_1];
         }
      }
      
      public function popState() : void
      {
         var _local_1:* = null;
         for(_local_1 in this.storedState)
         {
            this.showHelper(this.storedState[_local_1].groupKey,this.storedState[_local_1].helperId,this.storedState[_local_1].force);
         }
         this.storedState = new Dictionary();
      }
      
      private function onStageMouseClick(_arg_1:MouseEvent) : void
      {
         this.hideHelp();
         _arg_1.stopPropagation();
      }
      
      private function onHelperTimer(_arg_1:TimerEvent) : void
      {
         var _local_2:HelperTimer = _arg_1.target as HelperTimer;
         var _local_3:Helper = _local_2.helper;
         this.hideHelper(_local_3.groupKey,_local_3.id);
      }
      
      private function onHelperClick(_arg_1:MouseEvent) : void
      {
         var _local_2:Helper = null;
         if(_arg_1.target is Helper)
         {
            _local_2 = _arg_1.target as Helper;
            this.hideHelper(_local_2.groupKey,_local_2.id);
            this.addHidedHelper(_local_2);
            _arg_1.stopPropagation();
         }
      }
      
      private function addHidedHelper(_arg_1:Helper) : void
      {
         var _local_2:Object = null;
         var _local_3:Object = null;
         var _local_5:Boolean = false;
         var _local_4:Date = new Date();
         for each(_local_2 in this.hidedHelpers)
         {
            if(_local_2.groupKey == _arg_1.groupKey && _local_2.helperId == _arg_1.id)
            {
               _local_2.date = _local_4;
               ++_local_2.count;
               _local_5 = true;
            }
         }
         if(!_local_5)
         {
            this.hidedHelpers.push(new HidedHelperInfo(_arg_1.groupKey,_arg_1.id,_local_4,0));
         }
         this.storage.flush();
         for each(_local_3 in this.hidedHelpers)
         {
            OSGi.clientLog.log("helper","currentHidden Helper: %1, %2",_local_3.date,_local_3.count);
         }
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         var _local_3:Helper = null;
         if(this.helpLayer.contains(this.helpContainer))
         {
            _local_2 = 0;
            while(_local_2 < this.helpContainer.numChildren)
            {
               _local_3 = this.helpContainer.getChildAt(_local_2) as Helper;
               if(_local_3 != null)
               {
                  _local_3.align(this.stage.stageWidth,this.stage.stageHeight);
               }
               _local_2++;
            }
         }
      }
      
      private function getHelper(_arg_1:String, _arg_2:int) : Helper
      {
         var _local_3:Dictionary = this.helpGroups[_arg_1];
         if(_local_3 == null)
         {
            return null;
         }
         return _local_3[_arg_2];
      }
      
      private function doHideHelper(_arg_1:Helper) : void
      {
         var _local_2:int = 0;
         if(_arg_1 == null)
         {
            return;
         }
         if(this.helpContainer.contains(_arg_1))
         {
            this.helpContainer.removeChild(_arg_1);
         }
         _arg_1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onHelperClick);
         var _local_3:HelperTimer = _arg_1.timer;
         if(_local_3 != null)
         {
            _local_3.stop();
            _local_2 = this.timers.indexOf(_local_3);
            if(_local_2 != -1)
            {
               this.timers.splice(_local_2,1);
            }
         }
      }
      
      public function lock() : void
      {
         this.locked = true;
      }
      
      public function unlock() : void
      {
         var _local_1:ShowedHelperInfo = null;
         this.locked = false;
         for each(_local_1 in this.addedDuringLock)
         {
            this.showHelper(_local_1.groupKey,_local_1.helperId,_local_1.force);
         }
         this.addedDuringLock = new Vector.<ShowedHelperInfo>();
      }
   }
}

class ShowedHelperInfo
{
   
   public var groupKey:String;
   
   public var helperId:int;
   
   public var force:Boolean = false;
   
   public function ShowedHelperInfo(_arg_1:String, _arg_2:int, _arg_3:Boolean)
   {
      super();
      this.groupKey = _arg_1;
      this.helperId = _arg_2;
      this.force = _arg_3;
   }
}

class HidedHelperInfo
{
   
   public var groupKey:String;
   
   public var helperId:int;
   
   public var date:Date;
   
   public var count:int;
   
   public function HidedHelperInfo(_arg_1:String, _arg_2:int, _arg_3:Date, _arg_4:int)
   {
      super();
      this.groupKey = _arg_1;
      this.helperId = _arg_2;
      this.date = _arg_3;
      this.count = _arg_4;
   }
   
   public function toString() : String
   {
      return this.date.toString() + ", " + this.count.toString();
   }
}
