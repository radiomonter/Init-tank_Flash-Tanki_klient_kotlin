package platform.clients.fp10.libraries.alternativaclientflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.Protocol;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import obfuscation.bekiz.Nofot;
   import obfuscation.bekiz.Sig;
   import obfuscation.vaqu.Werowabe;
   import platform.client.fp10.core.CoreCommands;
   import platform.client.fp10.core.logging.serverlog.UncaughtErrorServerLogImpl;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.IObjectLoadListenerAdapt;
   import platform.client.fp10.core.model.IObjectLoadListenerEvents;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListenerAdapt;
   import platform.client.fp10.core.model.ObjectLoadListenerEvents;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectLoadPostListenerAdapt;
   import platform.client.fp10.core.model.ObjectLoadPostListenerEvents;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.ObjectUnloadListenerAdapt;
   import platform.client.fp10.core.model.ObjectUnloadListenerEvents;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListenerAdapt;
   import platform.client.fp10.core.model.ObjectUnloadPostListenerEvents;
   import platform.client.fp10.core.network.command.control.server.OpenSpaceCommand;
   import platform.client.fp10.core.network.connection.ControlConnectionSender;
   import platform.client.fp10.core.network.connection.SocketConnection;
   import platform.client.fp10.core.network.handler.ControlCommandHandler;
   import platform.client.fp10.core.network.handler.SpaceCommandHandler;
   import platform.client.fp10.core.protocol.codec.ControlRootCodec;
   import platform.client.fp10.core.protocol.codec.GameObjectCodec;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.registry.impl.ModelsRegistryImpl;
   import platform.client.fp10.core.registry.impl.ResourceRegistryImpl;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.resource.IResourceLoader;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceLoader;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.Resource3DS;
   import platform.client.fp10.core.service.IResourceTimer;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.client.fp10.core.service.address.impl.AddressServiceFakeImpl;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import platform.client.fp10.core.service.transport.ITransportService;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.impl.GameObject;
   import platform.client.fp10.core.type.impl.Space;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegisterAdapt:ModelRegistry;
         var codec:ICodec = null;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         var protocol:IProtocol = Protocol.defaultInstance;
         codec = new Sig(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImageResource,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImageResource,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Sig(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImageResource,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImageResource,true),true,1),new OptionalCodecDecorator(codec));
         codec = new Nofot(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(MultiframeImageResource,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(MultiframeImageResource,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Nofot(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(MultiframeImageResource,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(MultiframeImageResource,true),true,1),new OptionalCodecDecorator(codec));
         codec = new Werowabe(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Werowabe(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,true),true,1),new OptionalCodecDecorator(codec));
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            Space.logService = LogService(_arg_1);
         },function():LogService
         {
            return Space.logService;
         });
         osgi.injectService(IErrorMessageService,function(_arg_1:Object):void
         {
            Space.messageBoxService = IErrorMessageService(_arg_1);
         },function():IErrorMessageService
         {
            return Space.messageBoxService;
         });
         osgi.injectService(INetworkService,function(_arg_1:Object):void
         {
            Space.networkService = INetworkService(_arg_1);
         },function():INetworkService
         {
            return Space.networkService;
         });
         osgi.injectService(ITransportService,function(_arg_1:Object):void
         {
            Space.transportService = ITransportService(_arg_1);
         },function():ITransportService
         {
            return Space.transportService;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            GameObject.modelRegistry = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return GameObject.modelRegistry;
         });
         osgi.injectService(ILauncherParams,function(_arg_1:Object):void
         {
            AddressServiceFakeImpl.launcherParams = ILauncherParams(_arg_1);
         },function():ILauncherParams
         {
            return AddressServiceFakeImpl.launcherParams;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            UncaughtErrorServerLogImpl.loggerService = LogService(_arg_1);
         },function():LogService
         {
            return UncaughtErrorServerLogImpl.loggerService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            ControlCommandHandler.logService = LogService(_arg_1);
         },function():LogService
         {
            return ControlCommandHandler.logService;
         });
         osgi.injectService(IErrorMessageService,function(_arg_1:Object):void
         {
            ControlCommandHandler.messageBoxService = IErrorMessageService(_arg_1);
         },function():IErrorMessageService
         {
            return ControlCommandHandler.messageBoxService;
         });
         osgi.injectService(SpaceRegistry,function(_arg_1:Object):void
         {
            ControlCommandHandler.spaceRegistry = SpaceRegistry(_arg_1);
         },function():SpaceRegistry
         {
            return ControlCommandHandler.spaceRegistry;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ControlCommandHandler.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ControlCommandHandler.display;
         });
         osgi.injectService(ILauncherParams,function(_arg_1:Object):void
         {
            ControlCommandHandler.launcherParams = ILauncherParams(_arg_1);
         },function():ILauncherParams
         {
            return ControlCommandHandler.launcherParams;
         });
         osgi.injectService(AddressService,function(_arg_1:Object):void
         {
            ControlCommandHandler.addressService = AddressService(_arg_1);
         },function():AddressService
         {
            return ControlCommandHandler.addressService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            SpaceCommandHandler.logService = LogService(_arg_1);
         },function():LogService
         {
            return SpaceCommandHandler.logService;
         });
         osgi.injectService(SpaceRegistry,function(_arg_1:Object):void
         {
            SpaceCommandHandler.spaceRegistry = SpaceRegistry(_arg_1);
         },function():SpaceRegistry
         {
            return SpaceCommandHandler.spaceRegistry;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            SpaceCommandHandler.modelRegistry = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return SpaceCommandHandler.modelRegistry;
         });
         osgi.injectService(IProtocol,function(_arg_1:Object):void
         {
            SpaceCommandHandler.protocol = IProtocol(_arg_1);
         },function():IProtocol
         {
            return SpaceCommandHandler.protocol;
         });
         osgi.injectService(ITransportService,function(_arg_1:Object):void
         {
            SpaceCommandHandler.transportService = ITransportService(_arg_1);
         },function():ITransportService
         {
            return SpaceCommandHandler.transportService;
         });
         osgi.injectService(SpaceRegistry,function(_arg_1:Object):void
         {
            OpenSpaceCommand.spaceRegistry = SpaceRegistry(_arg_1);
         },function():SpaceRegistry
         {
            return OpenSpaceCommand.spaceRegistry;
         });
         osgi.injectService(INetworkService,function(_arg_1:Object):void
         {
            OpenSpaceCommand.networkService = INetworkService(_arg_1);
         },function():INetworkService
         {
            return OpenSpaceCommand.networkService;
         });
         osgi.injectService(ITransportService,function(_arg_1:Object):void
         {
            ControlConnectionSender.transportService = ITransportService(_arg_1);
         },function():ITransportService
         {
            return ControlConnectionSender.transportService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            SocketConnection.logService = LogService(_arg_1);
         },function():LogService
         {
            return SocketConnection.logService;
         });
         osgi.injectService(IErrorMessageService,function(_arg_1:Object):void
         {
            SocketConnection.messageBoxService = IErrorMessageService(_arg_1);
         },function():IErrorMessageService
         {
            return SocketConnection.messageBoxService;
         });
         osgi.injectService(ILauncherParams,function(_arg_1:Object):void
         {
            SocketConnection.launcherParams = ILauncherParams(_arg_1);
         },function():ILauncherParams
         {
            return SocketConnection.launcherParams;
         });
         osgi.injectService(INetworkService,function(_arg_1:Object):void
         {
            SocketConnection.networkService = INetworkService(_arg_1);
         },function():INetworkService
         {
            return SocketConnection.networkService;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            BatchResourceLoader.logService = LogService(_arg_1);
         },function():LogService
         {
            return BatchResourceLoader.logService;
         });
         osgi.injectService(IErrorMessageService,function(_arg_1:Object):void
         {
            BatchResourceLoader.messageBoxService = IErrorMessageService(_arg_1);
         },function():IErrorMessageService
         {
            return BatchResourceLoader.messageBoxService;
         });
         osgi.injectService(IResourceLoader,function(_arg_1:Object):void
         {
            BatchResourceLoader.resourceLoader = IResourceLoader(_arg_1);
         },function():IResourceLoader
         {
            return BatchResourceLoader.resourceLoader;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            BatchResourceLoader.resourceRegistry = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return BatchResourceLoader.resourceRegistry;
         });
         osgi.injectService(IResourceLocalStorage,function(_arg_1:Object):void
         {
            ResourceLoader.localStorage = IResourceLocalStorage(_arg_1);
         },function():IResourceLocalStorage
         {
            return ResourceLoader.localStorage;
         });
         osgi.injectService(INetworkService,function(_arg_1:Object):void
         {
            ResourceLoader.networkSerice = INetworkService(_arg_1);
         },function():INetworkService
         {
            return ResourceLoader.networkSerice;
         });
         osgi.injectService(IResourceLocalStorage,function(_arg_1:Object):void
         {
            ImageResource.resourceLocalStorage = IResourceLocalStorage(_arg_1);
         },function():IResourceLocalStorage
         {
            return ImageResource.resourceLocalStorage;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            LocalizedImageResource.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return LocalizedImageResource.localeService;
         });
         osgi.injectService(IResourceLocalStorage,function(_arg_1:Object):void
         {
            Resource3DS.resourceLocalStorage = IResourceLocalStorage(_arg_1);
         },function():IResourceLocalStorage
         {
            return Resource3DS.resourceLocalStorage;
         });
         osgi.injectService(IResourceLocalStorage,function(_arg_1:Object):void
         {
            MultiframeImageResource.resourceLocalStorage = IResourceLocalStorage(_arg_1);
         },function():IResourceLocalStorage
         {
            return MultiframeImageResource.resourceLocalStorage;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            Resource.resourceRegistry = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return Resource.resourceRegistry;
         });
         osgi.injectService(IResourceTimer,function(_arg_1:Object):void
         {
            Resource.resourceTimer = IResourceTimer(_arg_1);
         },function():IResourceTimer
         {
            return Resource.resourceTimer;
         });
         osgi.injectService(ILauncherParams,function(_arg_1:Object):void
         {
            Resource.launcherParams = ILauncherParams(_arg_1);
         },function():ILauncherParams
         {
            return Resource.launcherParams;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            Resource.logService = LogService(_arg_1);
         },function():LogService
         {
            return Resource.logService;
         });
         osgi.injectService(IResourceLoader,function(_arg_1:Object):void
         {
            ResourceRegistryImpl.resourceLoader = IResourceLoader(_arg_1);
         },function():IResourceLoader
         {
            return ResourceRegistryImpl.resourceLoader;
         });
         osgi.injectService(IProtocol,function(_arg_1:Object):void
         {
            ModelsRegistryImpl.protocol = IProtocol(_arg_1);
         },function():IProtocol
         {
            return ModelsRegistryImpl.protocol;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            ModelsRegistryImpl.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return ModelsRegistryImpl.clientLog;
         });
         osgi.injectService(LogService,function(_arg_1:Object):void
         {
            ControlRootCodec.logService = LogService(_arg_1);
         },function():LogService
         {
            return ControlRootCodec.logService;
         });
         osgi.injectService(SpaceRegistry,function(_arg_1:Object):void
         {
            GameObjectCodec.spaceRegistry = SpaceRegistry(_arg_1);
         },function():SpaceRegistry
         {
            return GameObjectCodec.spaceRegistry;
         });
         osgi.injectService(GameTypeRegistry,function(_arg_1:Object):void
         {
            CoreCommands.gameTypeRegistry = GameTypeRegistry(_arg_1);
         },function():GameTypeRegistry
         {
            return CoreCommands.gameTypeRegistry;
         });
         osgi.injectService(ModelRegistry,function(_arg_1:Object):void
         {
            CoreCommands.modelRegister = ModelRegistry(_arg_1);
         },function():ModelRegistry
         {
            return CoreCommands.modelRegister;
         });
         osgi.injectService(SpaceRegistry,function(_arg_1:Object):void
         {
            CoreCommands.spaceRegistry = SpaceRegistry(_arg_1);
         },function():SpaceRegistry
         {
            return CoreCommands.spaceRegistry;
         });
         osgi.injectService(ResourceRegistry,function(_arg_1:Object):void
         {
            CoreCommands.resourceRegistry = ResourceRegistry(_arg_1);
         },function():ResourceRegistry
         {
            return CoreCommands.resourceRegistry;
         });
         osgi.injectService(CommandService,function(_arg_1:Object):void
         {
            CoreCommands.commandService = CommandService(_arg_1);
         },function():CommandService
         {
            return CoreCommands.commandService;
         });
         osgi.injectService(ITransportService,function(_arg_1:Object):void
         {
            CoreCommands.transportService = ITransportService(_arg_1);
         },function():ITransportService
         {
            return CoreCommands.transportService;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(ObjectUnloadPostListener,ObjectUnloadPostListenerAdapt);
         modelRegisterAdapt.registerEvents(ObjectUnloadPostListener,ObjectUnloadPostListenerEvents);
         modelRegisterAdapt.registerAdapt(ObjectUnloadListener,ObjectUnloadListenerAdapt);
         modelRegisterAdapt.registerEvents(ObjectUnloadListener,ObjectUnloadListenerEvents);
         modelRegisterAdapt.registerAdapt(IObjectLoadListener,IObjectLoadListenerAdapt);
         modelRegisterAdapt.registerEvents(IObjectLoadListener,IObjectLoadListenerEvents);
         modelRegisterAdapt.registerAdapt(ObjectLoadListener,ObjectLoadListenerAdapt);
         modelRegisterAdapt.registerEvents(ObjectLoadListener,ObjectLoadListenerEvents);
         modelRegisterAdapt.registerAdapt(ObjectLoadPostListener,ObjectLoadPostListenerAdapt);
         modelRegisterAdapt.registerEvents(ObjectLoadPostListener,ObjectLoadPostListenerEvents);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

