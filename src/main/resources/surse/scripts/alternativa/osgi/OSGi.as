package alternativa.osgi
{
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.bundle.Qajuhy;
   import alternativa.osgi.catalogs.ServiceInfo;
   import alternativa.osgi.catalogs.ServicesCatalog;
   import alternativa.osgi.service.clientlog.IClientLogBase;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.logging.impl.LogServiceImpl;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class OSGi
   {
      
      public static var clientLog:IClientLogBase;
      
      private static var instance:OSGi;
      
      private var _serviceList:Vector.<Object>;
      
      private var logger:Logger;
      
      private var bundleDescriptors:Object = {};
      
      private var services:ServicesCatalog = new ServicesCatalog();
      
      private var serivceInterface2injectPoints:Dictionary = new Dictionary();
      
      public function OSGi()
      {
         super();
         if(instance == null)
         {
            instance = this;
            this.initLogging();
            return;
         }
         throw new Error("Only one instance of OSGi class is allowed");
      }
      
      public static function getInstance() : OSGi
      {
         if(instance == null)
         {
            instance = new OSGi();
         }
         return instance;
      }
      
      public static function paramsToString(_arg_1:Dictionary) : String
      {
         var _local_2:* = undefined;
         var _local_3:* = "";
         for(_local_2 in _arg_1)
         {
            _local_3 += " (" + _local_2 + " = " + _arg_1[_local_2] + ")";
         }
         return _local_3;
      }
      
      public function installBundle(_arg_1:Qajuhy) : void
      {
         var _local_2:int = 0;
         var _local_3:IBundleActivator = null;
         if(Boolean(this.bundleDescriptors[_arg_1.name]))
         {
            throw new Error("Bundle " + _arg_1.name + " is already installed");
         }
         this.logger.debug("Installing bundle: " + _arg_1.name);
         this.logger.debug("Bundle activators: " + _arg_1.dovyb);
         this.bundleDescriptors[_arg_1.name] = _arg_1;
         var _local_4:Vector.<IBundleActivator> = _arg_1.dovyb;
         if(_local_4 != null)
         {
            _local_2 = 0;
            while(_local_2 < _local_4.length)
            {
               _local_3 = _local_4[_local_2];
               this.logger.debug("Invoking start() on activator: " + getQualifiedClassName(_local_3));
               _local_3.start(this);
               _local_2++;
            }
         }
         this.logger.debug("Bundle has been installed: " + _arg_1.name);
      }
      
      private function initLogging() : void
      {
         var _local_1:LogServiceImpl = new LogServiceImpl();
         this.logger = _local_1.getLogger("osgi");
         this.registerService(LogService,_local_1);
      }
      
      public function uninstallBundle(_arg_1:String) : void
      {
         var _local_2:int = 0;
         var _local_3:IBundleActivator = null;
         if(_arg_1 == null)
         {
            throw new ArgumentError("Bundle name is null");
         }
         var _local_4:Qajuhy = this.bundleDescriptors[_arg_1];
         if(_local_4 == null)
         {
            throw new Error("Bundle " + _arg_1 + " not found");
         }
         var _local_5:Vector.<IBundleActivator> = _local_4.dovyb;
         if(_local_5 != null)
         {
            _local_2 = 0;
            while(_local_2 < _local_5.length)
            {
               _local_3 = _local_5[_local_2];
               this.logger.debug("Invoking stop() on activator " + getQualifiedClassName(_local_3));
               _local_3.stop(this);
               _local_2++;
            }
         }
         delete this.bundleDescriptors[_arg_1];
         this.logger.debug("Bundle has been uninstalled: " + _arg_1);
      }
      
      public function registerService(_arg_1:Class, _arg_2:Object, _arg_3:Dictionary = null) : void
      {
         this.services.addService(_arg_1,_arg_2,_arg_3);
         this.updateInject(_arg_1);
         this.logger.debug("Service has been registered: " + _arg_1 + paramsToString(_arg_3));
      }
      
      private function updateInject(_arg_1:Class) : void
      {
         var _local_2:Vector.<InjectPoint> = null;
         var _local_3:InjectPoint = null;
         if(this.serivceInterface2injectPoints[_arg_1] != null)
         {
            _local_2 = this.serivceInterface2injectPoints[_arg_1];
            for each(_local_3 in _local_2)
            {
               _local_3.injectFunction(this.services.getService(_arg_1,_local_3.filter));
               this.logger.debug("Service has been injected: " + _arg_1);
            }
         }
      }
      
      public function registerServiceMulti(_arg_1:Array, _arg_2:Object, _arg_3:Dictionary = null) : void
      {
         var _local_4:Class = null;
         for each(_local_4 in _arg_1)
         {
            this.registerService(_local_4,_arg_2,_arg_3);
         }
      }
      
      public function unregisterService(_arg_1:Class, _arg_2:Dictionary = null) : void
      {
         var _local_3:int = 0;
         var _local_4:InjectPoint = null;
         var _local_5:Object = this.services.removeService(_arg_1,_arg_2);
         if(_local_5 == null)
         {
            return;
         }
         var _local_6:Vector.<InjectPoint> = this.serivceInterface2injectPoints[_arg_1];
         if(_local_6 != null)
         {
            _local_3 = _local_6.length - 1;
            while(_local_3 >= 0)
            {
               _local_4 = _local_6[_local_3];
               if(_local_4.valueReturnInjectFunction() == _local_5)
               {
                  _local_4.injectFunction(null);
               }
               _local_3--;
            }
         }
         this.logger.debug("Service has been unregistered: " + _arg_1 + paramsToString(_arg_2));
      }
      
      public function injectService(_arg_1:Class, _arg_2:Function, _arg_3:Function, _arg_4:String = "") : void
      {
         if(!this.serivceInterface2injectPoints[_arg_1])
         {
            this.serivceInterface2injectPoints[_arg_1] = new Vector.<InjectPoint>();
         }
         this.serivceInterface2injectPoints[_arg_1].push(new InjectPoint(_arg_2,_arg_3,_arg_4));
         var _local_5:Object = this.services.getService(_arg_1,_arg_4);
         _arg_2(_local_5);
         this.logger.debug("Inject %1 have been processed. Current value is %2",[_arg_1,_local_5]);
      }
      
      public function getService(_arg_1:Class, _arg_2:String = "") : Object
      {
         return this.services.getService(_arg_1,_arg_2);
      }
      
      public function get bundleList() : Vector.<Qajuhy>
      {
         var _local_1:Qajuhy = null;
         var _local_2:Vector.<Qajuhy> = new Vector.<Qajuhy>();
         for each(_local_1 in this.bundleDescriptors)
         {
            _local_2.push(_local_1);
         }
         return _local_2;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         return this.services.serviceList;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         return this.services.getServicesInfo();
      }
      
      public function createSharedObject(_arg_1:String, _arg_2:String = null, _arg_3:Boolean = false) : SharedObject
      {
         return SharedObject.getLocal(_arg_1,_arg_2,_arg_3);
      }
   }
}

class InjectPoint
{
   
   public var injectFunction:Function;
   
   public var valueReturnInjectFunction:Function;
   
   public var filter:String;
   
   public function InjectPoint(_arg_1:Function, _arg_2:Function, _arg_3:String)
   {
      super();
      this.injectFunction = _arg_1;
      this.valueReturnInjectFunction = _arg_2;
      this.filter = _arg_3;
   }
}
