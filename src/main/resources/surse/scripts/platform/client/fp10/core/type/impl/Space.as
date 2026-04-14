package platform.client.fp10.core.type.impl
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.protocol.IProtocol;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.connection.ConnectionConnectParameters;
   import platform.client.fp10.core.network.connection.IConnection;
   import platform.client.fp10.core.network.connection.IProtectionContext;
   import platform.client.fp10.core.network.connection.protection.PrimitiveProtectionContext;
   import platform.client.fp10.core.network.connection.protection.XorBasedProtectionContext;
   import platform.client.fp10.core.network.handler.ISpaceCommandHandler;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.transport.ITransportService;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.ISpaceListener;
   
   public class Space implements ISpace
   {
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var messageBoxService:IErrorMessageService;
      
      [Inject]
      public static var networkService:INetworkService;
      
      [Inject]
      public static var transportService:ITransportService;
      
      private static var logger:Logger;
      
      private var _id:Long;
      
      private var objectById:Dictionary = new Dictionary();
      
      private var objectByName:Dictionary = new Dictionary();
      
      private var _objects:Vector.<IGameObject>;
      
      private var connection:IConnection;
      
      private var listeners:Vector.<ISpaceListener>;
      
      public function Space(_arg_1:Long, _arg_2:ISpaceCommandHandler, _arg_3:IProtocol, _arg_4:Boolean)
      {
         super();
         this._id = _arg_1;
         this._objects = new Vector.<IGameObject>();
         logger = logger || logService.getLogger("space");
         this.listeners = new Vector.<ISpaceListener>();
         var _local_5:IProtectionContext = !_arg_4 ? PrimitiveProtectionContext.INSTANCE : new XorBasedProtectionContext(transportService.hash,_arg_1);
         var _local_6:GameClass = new GameClass(Long.getLong(0,0),new Vector.<Long>());
         this.createObject(_arg_1,_local_6,"Space object");
      }
      
      public function getObjectByName(_arg_1:String) : IGameObject
      {
         return this.objectByName[_arg_1];
      }
      
      public function connect(_arg_1:String, _arg_2:Vector.<int>) : void
      {
         this.connection.connect(new ConnectionConnectParameters(_arg_1,_arg_2));
      }
      
      public function close() : void
      {
         this.connection.close(ConnectionCloseStatus.SPACE_CLOSED);
         this.invokeSpaceClosedListeners();
      }
      
      private function invokeSpaceClosedListeners() : void
      {
         var _local_1:ISpaceListener = null;
         var _local_2:Vector.<ISpaceListener> = this.listeners.concat();
         for each(_local_1 in _local_2)
         {
            _local_1.spaceClosed();
         }
      }
      
      public function createObject(_arg_1:Long, _arg_2:IGameClass, _arg_3:String) : IGameObject
      {
         var _local_4:GameObject = null;
         if(this.objectById[_arg_1.low] == null)
         {
            _local_4 = new GameObject(_arg_1,GameClass(_arg_2),_arg_3,this);
            this.objectById[_local_4.id.low] = _local_4;
            this.objectByName[_local_4.name] = _local_4;
            this._objects.push(_local_4);
         }
         return this.objectById[_arg_1.low];
      }
      
      public function destroyObject(objectId:Long) : void
      {
         ;
         var clientObject:GameObject = this.objectById[objectId.low];
         if(clientObject != null)
         {
            try
            {
               this.invokeUnloadListeners(clientObject);
               this.invokeDestructionListeners(clientObject);
               return;
            }
            catch(e:Error)
            {
               processUnloadingError(e,objectId);
               return;
            }
            finally
            {
               this.removeObject(clientObject);
            }
         }
      }
      
      private function invokeUnloadListeners(_arg_1:IGameObject) : void
      {
         var _local_2:IObjectLoadListener = IObjectLoadListener(_arg_1.event(IObjectLoadListener));
         _local_2.objectUnloaded();
         ObjectUnloadListener(_arg_1.event(ObjectUnloadListener)).objectUnloaded();
         _local_2.objectUnloadedPost();
         ObjectUnloadPostListener(_arg_1.event(ObjectUnloadPostListener)).objectUnloadedPost();
      }
      
      private function invokeDestructionListeners(_arg_1:GameObject) : void
      {
         var _local_2:ISpaceListener = null;
         var _local_3:Vector.<ISpaceListener> = this.listeners.concat();
         for each(_local_2 in _local_3)
         {
            _local_2.objectDestroyed(_arg_1);
         }
      }
      
      private function processUnloadingError(_arg_1:Error, _arg_2:Long) : void
      {
         throw _arg_1;
      }
      
      private function removeObject(_arg_1:GameObject) : void
      {
         this._objects.splice(this._objects.indexOf(_arg_1),1);
         delete this.objectById[_arg_1.id.low];
         delete this.objectByName[_arg_1.name];
      }
      
      public function getObject(_arg_1:Long) : IGameObject
      {
         return this.objectById[_arg_1.low];
      }
      
      public function get objects() : Vector.<IGameObject>
      {
         return this._objects;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function get commandSender() : ICommandSender
      {
         return this.connection;
      }
      
      public function get rootObject() : IGameObject
      {
         return this.getObject(this._id);
      }
      
      public function addEventListener(_arg_1:ISpaceListener) : void
      {
         if(this.listeners.indexOf(_arg_1) == -1)
         {
            this.listeners.push(_arg_1);
         }
      }
      
      public function removeEventListener(_arg_1:ISpaceListener) : void
      {
         var _local_2:int = this.listeners.indexOf(_arg_1);
         if(_local_2 != -1)
         {
            this.listeners.splice(_local_2,1);
         }
      }
      
      public function modelsDataReady(_arg_1:IGameObject) : void
      {
         var _local_2:ISpaceListener = null;
         var _local_3:Vector.<ISpaceListener> = this.listeners.concat();
         for each(_local_2 in _local_3)
         {
            _local_2.objectCreated(_arg_1);
         }
      }
      
      public function toString() : String
      {
         return "[Space id=" + this.id + "]";
      }
   }
}

