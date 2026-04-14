package alternativa
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.ClientLog;
   import alternativa.osgi.service.clientlog.DeprecatedClientLogWrapper;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.impl.CommandServiceImpl;
   import alternativa.osgi.service.command.impl.DefaultCommands;
   import alternativa.osgi.service.command.impl.OSGiCommands;
   import alternativa.osgi.service.console.Console;
   import alternativa.osgi.service.console.ConsoleLogTarget;
   import alternativa.osgi.service.console.IConsole;
   import alternativa.osgi.service.display.Display;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.DumpService;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.osgi.service.network.NetworkService;
   import alternativa.startup.ConnectionParameters;
   import alternativa.startup.IClientConfigurator;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class ClientConfigurator implements IClientConfigurator
   {
      
      protected var osgi:OSGi;
      
      private var console:IConsole;
      
      private var conAlignShortcutH:KeyboardShortcut;
      
      private var conAlignShortcutV:KeyboardShortcut;
      
      private var commandService:CommandServiceImpl;
      
      private var logService:LogService;
      
      public function ClientConfigurator()
      {
         super();
      }
      
      public function start(_arg_1:DisplayObjectContainer, _arg_2:ILauncherParams, _arg_3:ConnectionParameters, _arg_4:Vector.<String>) : void
      {
         this.osgi = OSGi.getInstance();
         this.commandService = new CommandServiceImpl();
         this.osgi.registerService(CommandService,this.commandService);
         this.initClientLog();
         this.initConsole(_arg_1.stage,_arg_2);
         this.osgi.registerService(ILauncherParams,_arg_2);
         this.osgi.registerService(IDisplay,new Display(_arg_1));
         this.osgi.registerService(INetworkService,new NetworkService(_arg_3));
         var _local_5:IDumpService = new DumpService(this.osgi);
         this.osgi.registerService(IDumpService,_local_5);
         this.registerCommand(this.osgi,this.commandService);
      }
      
      private function registerCommand(_arg_1:OSGi, _arg_2:CommandService) : void
      {
         new DefaultCommands(_arg_2);
         new OSGiCommands(_arg_1,_arg_2);
      }
      
      private function initClientLog() : void
      {
         this.logService = LogService(this.osgi.getService(LogService));
         this.osgi.registerService(IClientLog,new ClientLog(this.logService));
         OSGi.clientLog = new DeprecatedClientLogWrapper(this.logService);
      }
      
      private function storeStartupLog(_arg_1:Vector.<String>) : void
      {
         var _local_2:String = null;
         var _local_3:LogService = LogService(this.osgi.getService(LogService));
         var _local_4:Logger = _local_3.getLogger("startup");
         for each(_local_2 in _arg_1)
         {
            _local_4.info(_local_2);
         }
      }
      
      private function initConsole(_arg_1:Stage, _arg_2:ILauncherParams) : void
      {
         if(Boolean(this.console))
         {
            return;
         }
         this.console = this.createConsole(_arg_1);
         this.osgi.registerService(IConsole,this.console);
         this.logService.addLogTarget(new ConsoleLogTarget(this.commandService,this.console,_arg_2));
         this.configureConsole(_arg_1,this.console,"show,ha,va,w,h,alpha");
      }
      
      protected function createConsole(_arg_1:Stage) : IConsole
      {
         return new Console(this.commandService,_arg_1,50,100,1,1);
      }
      
      private function configureConsole(_arg_1:Stage, _arg_2:IConsole, _arg_3:String) : void
      {
         var _local_4:String = null;
         var _local_5:Array = null;
         var _local_6:Array = _arg_3.split(",");
         var _local_7:Object = {};
         for each(_local_4 in _local_6)
         {
            _local_5 = _local_4.split(":");
            _local_7[_local_5[0]] = _local_5[1];
         }
         if(_local_7["show"] != null)
         {
            _arg_2.show();
         }
         if(_local_7["ha"] != null)
         {
            _arg_2.horizontalAlignment = int(_local_7["ha"]);
         }
         if(_local_7["va"] != null)
         {
            _arg_2.vericalAlignment = int(_local_7["va"]);
         }
         if(_local_7["w"] != null)
         {
            _arg_2.width = int(_local_7["w"]);
         }
         if(_local_7["h"] != null)
         {
            _arg_2.height = int(_local_7["h"]);
         }
         if(_local_7["alpha"] != null)
         {
            _arg_2.executeCommand("con_alpha " + _local_7["alpha"]);
         }
         this.conAlignShortcutH = this.parseShortcut(_local_7["hsw"],Keyboard.LEFT,false,true,true);
         this.conAlignShortcutV = this.parseShortcut(_local_7["vsw"],Keyboard.UP,false,true,true);
         _arg_1.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey,true);
      }
      
      private function parseShortcut(_arg_1:String, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean) : KeyboardShortcut
      {
         if(_arg_1 == null)
         {
            return new KeyboardShortcut(_arg_2,_arg_3,_arg_4,_arg_5);
         }
         return new KeyboardShortcut(parseInt(_arg_1),_arg_1.indexOf("a") > -1,_arg_1.indexOf("c") > -1,_arg_1.indexOf("s") > -1);
      }
      
      private function onKey(_arg_1:KeyboardEvent) : void
      {
         switch(_arg_1.keyCode)
         {
            case this.conAlignShortcutH.keyCode:
               if(this.conAlignShortcutH.altKey == _arg_1.altKey && this.conAlignShortcutH.shiftKey == _arg_1.shiftKey && this.conAlignShortcutH.ctrlKey == _arg_1.ctrlKey)
               {
                  if(this.console.horizontalAlignment == 1)
                  {
                     this.console.horizontalAlignment = 2;
                  }
                  else
                  {
                     this.console.horizontalAlignment = 1;
                  }
               }
               return;
            case this.conAlignShortcutV.keyCode:
               if(this.conAlignShortcutV.altKey == _arg_1.altKey && this.conAlignShortcutV.shiftKey == _arg_1.shiftKey && this.conAlignShortcutV.ctrlKey == _arg_1.ctrlKey)
               {
                  if(this.console.vericalAlignment == 1)
                  {
                     this.console.vericalAlignment = 2;
                     break;
                  }
                  this.console.vericalAlignment = 1;
               }
         }
      }
   }
}

class KeyboardShortcut
{
   
   public var keyCode:int;
   
   public var altKey:Boolean;
   
   public var ctrlKey:Boolean;
   
   public var shiftKey:Boolean;
   
   public function KeyboardShortcut(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean)
   {
      super();
      this.keyCode = _arg_1;
      this.altKey = _arg_2;
      this.ctrlKey = _arg_3;
      this.shiftKey = _arg_4;
   }
}
