package platform.client.fp10.core.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.IConsole;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.types.Long;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.SharedObjectUsNotAccessibleError;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class ResourceLocalStorage implements IResourceLocalStorage, IResourceLocalStorageInternal
   {
      
      private var logger:Logger;
      
      private var _enabled:Boolean;
      
      private var soStorage:SharedObject;
      
      private var resourceIndex:ResourceIndex;
      
      private var temporaryStorageState:Boolean;
      
      private var consoleCommands:Object;
      
      public function ResourceLocalStorage(_arg_1:OSGi)
      {
         super();
         var _local_2:LogService = LogService(_arg_1.getService(LogService));
         this.logger = _local_2.getLogger(ResourceLogChannel.NAME);
         this.soStorage = SharedObject.getLocal("localstorage","/");
         this.resourceIndex = new ResourceIndex(this.soStorage);
         var _local_3:ILauncherParams = ILauncherParams(_arg_1.getService(ILauncherParams));
         var _local_4:* = "1";
         if(_local_4 == "1")
         {
            this.enableStorage(true);
         }
         else if(_local_4 == "0")
         {
            this._enabled = false;
         }
         else
         {
            this._enabled = this.soStorage.data.enabled;
         }
         this.initConsoleCommands(_arg_1);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            this.enableStorage(false);
         }
         else
         {
            this.temporaryStorageState = false;
            this.setEnabledInternal(false);
         }
      }
      
      public function getResourceData(_arg_1:Long, _arg_2:int, _arg_3:String) : ByteArray
      {
         var _local_4:ResourceObject = new ResourceObject(_arg_1.toString(),_arg_3);
         if(_local_4.resourceVersion == _arg_2)
         {
            return _local_4.data;
         }
         this.resourceIndex.removeResourceData(_local_4.resourceId,_arg_3);
         _local_4.clear();
         return null;
      }
      
      public function setResourceData(_arg_1:Long, _arg_2:int, _arg_3:ByteArray, _arg_4:String, _arg_5:String) : void
      {
         _arg_5 ||= Resource.DEFAULT_CLASSIFIER;
         var _local_6:ResourceObject = new ResourceObject(_arg_1.toString(),_arg_5);
         _local_6.resourceVersion = _arg_2;
         _local_6.data = _arg_3;
         _local_6.flush();
         this.resourceIndex.addResourceData(_local_6.resourceId,_arg_5,_arg_4);
      }
      
      public function clearResourceData(_arg_1:Long) : void
      {
         this.clearResourceDataStr(_arg_1.toString());
      }
      
      public function clear() : void
      {
         var _local_1:String = null;
         var _local_2:Vector.<String> = this.resourceIndex.getResourceIds();
         for each(_local_1 in _local_2)
         {
            this.clearResourceDataStr(_local_1);
         }
      }
      
      public function flushIndex() : void
      {
         this.soStorage.flush();
      }
      
      public function clearResourceDataStr(_arg_1:String) : void
      {
         var _local_2:String = null;
         var _local_3:ResourceObject = null;
         var _local_4:ResourceInfo = this.resourceIndex.getResourceInfo(_arg_1);
         if(_local_4.empty)
         {
            return;
         }
         for each(_local_2 in _local_4.classifiers)
         {
            _local_3 = new ResourceObject(_arg_1,_local_2);
            _local_3.clear();
         }
         this.resourceIndex.removeResourceInfo(_arg_1);
      }
      
      public function getResourceIndex() : ResourceIndex
      {
         return this.resourceIndex;
      }
      
      private function enableStorage(param1:Boolean) : void
      {
         var errorType:SharedObjectUsNotAccessibleError = null;
         var messageBoxService:IErrorMessageService = null;
         var flushStatus:String = null;
         errorType = null;
         messageBoxService = null;
         var temporary:Boolean = param1;
         this.temporaryStorageState = temporary;
         try
         {
            flushStatus = this.soStorage.flush(100 * (1 << 20));
         }
         catch(e:Error)
         {
            errorType = new SharedObjectUsNotAccessibleError();
            logger.warning(errorType.getMessage());
            messageBoxService = IErrorMessageService(OSGi.getInstance().getService(IErrorMessageService));
            messageBoxService.showMessage(errorType);
         }
         switch(flushStatus)
         {
            case SharedObjectFlushStatus.FLUSHED:
               this.setEnabledInternal(true);
               return;
            case SharedObjectFlushStatus.PENDING:
               this.soStorage.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         }
      }
      
      private function onNetStatus(_arg_1:NetStatusEvent) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         this.soStorage.removeEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         if(_arg_1.info.code == "SharedObject.Flush.Failed")
         {
            _local_2 = Capabilities.os.indexOf("Windows");
            _local_3 = Capabilities.os.indexOf("Linux");
            _local_4 = Capabilities.os.indexOf("Mac");
            if(_local_2 >= 0 || (_local_3 >= 0 || _local_4 >= 0) && this.soStorage.flush(100 * (1 << 20)) == SharedObjectFlushStatus.PENDING)
            {
               this.setEnabledInternal(false);
            }
            else
            {
               this.setEnabledInternal(true);
            }
         }
         else
         {
            this.setEnabledInternal(true);
         }
      }
      
      private function setEnabledInternal(_arg_1:Boolean) : void
      {
         if(!this.temporaryStorageState)
         {
            this.soStorage.data.enabled = _arg_1;
         }
         this._enabled = _arg_1;
      }
      
      private function initConsoleCommands(_arg_1:OSGi) : void
      {
         var _local_2:IConsole = IConsole(_arg_1.getService(IConsole));
         _local_2.setCommandHandler("locstor",this.onConsoleCommand);
         this.consoleCommands = {};
         this.addConsoleCommand(new PrintIndexCommand("ls",this));
         this.addConsoleCommand(new DeleteResourceCommand("del",this));
         this.addConsoleCommand(new ClearStorageCommand("clear",this));
         this.addConsoleCommand(new StatusCommand("status",this));
         this.addConsoleCommand(new EnableStorageCommand("enable",this));
         this.addConsoleCommand(new DisableStorageCommand("disable",this));
         this.addConsoleCommand(new FlushStorageIndexCommand("flush",this));
      }
      
      private function addConsoleCommand(_arg_1:ConsoleCommand) : void
      {
         this.consoleCommands[_arg_1.name] = _arg_1;
      }
      
      private function onConsoleCommand(_arg_1:IConsole, _arg_2:Array) : void
      {
         var _local_3:Array = null;
         var _local_4:* = null;
         var _local_5:ConsoleCommand = this.consoleCommands[_arg_2.shift()];
         if(_local_5 == null)
         {
            _arg_1.addText("Usage: locstor command [command arguments]");
            _arg_1.addText("Available commands are:");
            _local_3 = [];
            for(_local_4 in this.consoleCommands)
            {
               _local_3.push(_local_4);
            }
            _local_3.sort();
            for each(_local_4 in _local_3)
            {
               _arg_1.addText(ConsoleCommand(this.consoleCommands[_local_4]).description);
            }
            return;
         }
         _local_5.execute(_arg_1,_arg_2);
      }
   }
}

import alternativa.osgi.service.console.IConsole;
import flash.net.SharedObject;
import flash.utils.ByteArray;

class ResourceObject
{
   
   internal var sharedObject:SharedObject;
   
   internal var _resourceId:String;
   
   public function ResourceObject(_arg_1:String, _arg_2:String)
   {
      super();
      var _local_3:String = _arg_1 + "-" + _arg_2;
      this.sharedObject = SharedObject.getLocal(_local_3,"/");
      this._resourceId = _arg_1;
   }
   
   public function get resourceId() : String
   {
      return this._resourceId;
   }
   
   public function get resourceVersion() : int
   {
      return this.sharedObject.data.version;
   }
   
   public function set resourceVersion(_arg_1:int) : void
   {
      this.sharedObject.data.version = _arg_1;
   }
   
   public function get data() : ByteArray
   {
      return this.sharedObject.data.data;
   }
   
   public function set data(_arg_1:ByteArray) : void
   {
      this.sharedObject.data.data = _arg_1;
   }
   
   public function flush() : void
   {
      this.sharedObject.flush();
   }
   
   public function clear() : void
   {
      this.sharedObject.clear();
   }
}

class ResourceIndex
{
   
   internal var sharedObject:SharedObject;
   
   internal var index:Object;
   
   public function ResourceIndex(_arg_1:SharedObject)
   {
      super();
      this.sharedObject = _arg_1;
      this.index = _arg_1.data.index;
      if(this.index == null)
      {
         this.index = {};
         _arg_1.data.index = this.index;
      }
   }
   
   public function getResourceInfo(_arg_1:String) : ResourceInfo
   {
      return new ResourceInfo(this.index[_arg_1]);
   }
   
   public function setResourceInfo(_arg_1:String, _arg_2:ResourceInfo) : void
   {
      if(_arg_2 == null)
      {
         this.removeResourceInfo(_arg_1);
      }
      else
      {
         this.index[_arg_1] = _arg_2.rawData;
      }
   }
   
   public function removeResourceInfo(_arg_1:String) : void
   {
      delete this.index[_arg_1];
   }
   
   public function addResourceData(_arg_1:String, _arg_2:String, _arg_3:String) : void
   {
      var _local_4:ResourceInfo = this.getResourceInfo(_arg_1);
      _local_4.description = _arg_3;
      var _local_5:Array = _local_4.classifiers;
      if(_local_5.indexOf(_arg_2) < 0)
      {
         _local_5.push(_arg_2);
      }
      this.setResourceInfo(_arg_1,_local_4);
   }
   
   public function removeResourceData(_arg_1:String, _arg_2:String) : void
   {
      var _local_3:ResourceInfo = this.getResourceInfo(_arg_1);
      if(_local_3.empty)
      {
         return;
      }
      var _local_4:Array = _local_3.classifiers;
      var _local_5:int = _local_4.indexOf(_arg_2);
      if(_local_5 >= 0)
      {
         if(_local_4.length == 1)
         {
            this.removeResourceInfo(_arg_1);
         }
         else
         {
            _local_4.splice(_local_5,1);
            this.setResourceInfo(_arg_1,_local_3);
         }
      }
   }
   
   public function getResourceIds() : Vector.<String>
   {
      var _local_1:* = null;
      var _local_2:Vector.<String> = new Vector.<String>();
      for(_local_1 in this.index)
      {
         _local_2.push(_local_1);
      }
      return _local_2;
   }
}

class ConsoleCommand
{
   
   public var name:String;
   
   public var description:String;
   
   protected var storage:ResourceLocalStorage;
   
   public function ConsoleCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super();
      this.name = _arg_1;
      this.storage = _arg_2;
   }
   
   public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
   }
}

class PrintIndexCommand extends ConsoleCommand
{
   
   public function PrintIndexCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- lists all locally stored resources";
   }
   
   override public function execute(param1:IConsole, param2:Array) : void
   {
      var counter:int = 0;
      var sid:String = null;
      var resourceInfo:ResourceInfo = null;
      var console:IConsole = param1;
      var params:Array = param2;
      var resourceIndex:ResourceIndex = storage.getResourceIndex();
      var resourceIds:Vector.<String> = resourceIndex.getResourceIds();
      resourceIds.sort(function(_arg_1:String, _arg_2:String):Number
      {
         if(_arg_1 < _arg_2)
         {
            return -1;
         }
         if(_arg_1 > _arg_2)
         {
            return 1;
         }
         return 0;
      });
      for each(sid in resourceIds)
      {
         resourceInfo = resourceIndex.getResourceInfo(sid);
         console.addText(++counter + ". " + sid + ": " + resourceInfo.description + ", " + resourceInfo.classifiers);
      }
   }
}

class DeleteResourceCommand extends ConsoleCommand
{
   
   public function DeleteResourceCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " resource_id -- removes locally stored resource with given id";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      var _local_3:String = _arg_2[0];
      if(!_local_3)
      {
         _arg_1.addText("Resource id should be specified");
         return;
      }
      storage.clearResourceDataStr(_local_3);
      _arg_1.addText("Resource " + _local_3 + " has been removed from local storage");
   }
}

class ClearStorageCommand extends ConsoleCommand
{
   
   public function ClearStorageCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- wipes out all locally stored resources";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      storage.clear();
      _arg_1.addText("Local storage has been cleared");
   }
}

class StatusCommand extends ConsoleCommand
{
   
   public function StatusCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- prints local storage status";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      _arg_1.addText("Local storage is " + (!storage.enabled ? "disabled" : "enabled"));
   }
}

class EnableStorageCommand extends ConsoleCommand
{
   
   public function EnableStorageCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- enables local storage";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      storage.enabled = true;
      _arg_1.addText("Locale storage enabled");
   }
}

class DisableStorageCommand extends ConsoleCommand
{
   
   public function DisableStorageCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- disables local storage";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      storage.enabled = false;
      _arg_1.addText("Locale storage disabled");
   }
}

class FlushStorageIndexCommand extends ConsoleCommand
{
   
   public function FlushStorageIndexCommand(_arg_1:String, _arg_2:ResourceLocalStorage)
   {
      super(_arg_1,_arg_2);
      description = _arg_1 + " -- writes storage index to disk";
   }
   
   override public function execute(_arg_1:IConsole, _arg_2:Array) : void
   {
      storage.flushIndex();
   }
}

class ResourceInfo
{
   
   public var empty:Boolean;
   
   public var rawData:Object;
   
   public function ResourceInfo(_arg_1:Object)
   {
      super();
      if(_arg_1 == null)
      {
         this.empty = true;
         this.rawData = {};
      }
      else
      {
         this.rawData = _arg_1;
      }
   }
   
   public function get description() : String
   {
      return this.rawData.description;
   }
   
   public function set description(_arg_1:String) : void
   {
      this.rawData.description = _arg_1;
   }
   
   public function get classifiers() : Array
   {
      var _local_1:Array = this.rawData.classifiers;
      if(_local_1 == null)
      {
         _local_1 = [];
         this.rawData.classifiers = _local_1;
      }
      return _local_1;
   }
}
