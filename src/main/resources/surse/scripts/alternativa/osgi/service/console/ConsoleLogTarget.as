package alternativa.osgi.service.console
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogTarget;
   
   public class ConsoleLogTarget implements LogTarget
   {
      
      private static const ANY_CHANNEL:* = "ANY_CHANNEL";
      
      private static const ANY_LOGLEVEL:LogLevel = null;
      
      private const EMPTY_VECTOR:Vector.<LogEntry> = new Vector.<LogEntry>(0);
      
      private const channels:Object = {};
      
      private var logEntrySequence:int;
      
      private var commandService:CommandService;
      
      private var bufferSize:int;
      
      private var connectedChannel:Object = {};
      
      private var connectToAllChannel:Boolean;
      
      private var console:IConsole;
      
      public function ConsoleLogTarget(_arg_1:CommandService, _arg_2:IConsole, _arg_3:ILauncherParams)
      {
         super();
         this.console = _arg_2;
         this.commandService = _arg_1;
         this.bufferSize = 1000;
         _arg_1.registerCommand("log","channels","Список каналов",[],this.cmdChannelsList);
         _arg_1.registerCommand("log","channel","Показать сообщения из канала",[String],this.cmdShowChannel);
         _arg_1.registerCommand("log","connect","Показывать новые сообщения из канала",[String],this.cmdConnectChannel);
         _arg_1.registerCommand("log","disconnect","Показывать новые сообщения из канала",[String],this.cmdDisconnectChannel);
         _arg_1.registerCommand("log","trace","Посмотреть trace сообщения",[],this.cmdShow(LogLevel.TRACE));
         _arg_1.registerCommand("log","info","Посмотреть info сообщения",[],this.cmdShow(LogLevel.INFO));
         _arg_1.registerCommand("log","warning","Посмотреть warning сообщения",[],this.cmdShow(LogLevel.WARNING));
         _arg_1.registerCommand("log","debug","Посмотреть debug сообщения",[],this.cmdShow(LogLevel.DEBUG));
         _arg_1.registerCommand("log","error","Посмотреть error сообщения",[],this.cmdShow(LogLevel.ERROR));
      }
      
      public function log(_arg_1:Object, _arg_2:LogLevel, _arg_3:String, _arg_4:Array = null) : void
      {
         var _local_5:LogEntry = new LogEntry(this.logEntrySequence++,_arg_1,_arg_2,_arg_3,_arg_4);
         var _local_6:Vector.<LogEntry> = this.getOrCreateBufferForChannel(_arg_1);
         _local_6.push(_local_5);
         if(Boolean(this.connectedChannel[_arg_1]) || this.connectToAllChannel)
         {
            this.print(this.console,_local_5);
         }
         if(_local_6.length > this.bufferSize)
         {
            _local_6.splice(1,100);
         }
      }
      
      private function setupAutoConnectedChannel(_arg_1:ILauncherParams) : void
      {
         var _local_2:String = null;
         var _local_3:String = _arg_1.getParameter("showlog");
         if(Boolean(_local_3))
         {
            if(_local_3 == "*")
            {
               this.connectToAllChannel = true;
            }
            else
            {
               for each(_local_2 in _local_3.split(","))
               {
                  this.connectedChannel[_local_2] = true;
               }
            }
         }
      }
      
      private function cmdDisconnectChannel(_arg_1:FormattedOutput, _arg_2:String) : void
      {
         delete this.connectedChannel[_arg_2];
      }
      
      private function cmdConnectChannel(_arg_1:FormattedOutput, _arg_2:String) : void
      {
         this.connectedChannel[_arg_2] = _arg_2;
      }
      
      private function cmdShow(param1:LogLevel) : Function
      {
         var logLevel:LogLevel = null;
         logLevel = param1;
         return function(_arg_1:FormattedOutput):void
         {
            var _local_2:* = undefined;
            var _local_3:* = getLogEntriesForLevel(logLevel);
            for each(_local_2 in _local_3)
            {
               print(_arg_1,_local_2);
            }
         };
      }
      
      private function getLogEntriesForLevel(param1:LogLevel) : Vector.<LogEntry>
      {
         var channelName:String = null;
         var channelEntries:Vector.<LogEntry> = null;
         var logEntry:LogEntry = null;
         var logLevel:LogLevel = param1;
         var result:Vector.<LogEntry> = new Vector.<LogEntry>();
         for(channelName in this.channels)
         {
            channelEntries = this.channels[channelName];
            for each(logEntry in channelEntries)
            {
               if(logEntry.level == logLevel)
               {
                  result.push(logEntry);
               }
            }
         }
         result.sort(function(_arg_1:LogEntry, _arg_2:LogEntry):Number
         {
            return _arg_1.ordinal - _arg_2.ordinal;
         });
         return result;
      }
      
      private function cmdShowChannel(_arg_1:FormattedOutput, _arg_2:String) : void
      {
         var _local_3:LogEntry = null;
         var _local_5:int = 0;
         var _local_4:Vector.<LogEntry> = this.getBufferForChannel(_arg_2);
         while(_local_5 < _local_4.length)
         {
            _local_3 = _local_4[_local_5];
            if(this.filtered(_local_3,_arg_2,ANY_LOGLEVEL))
            {
               this.print(_arg_1,_local_3);
            }
            _local_5++;
         }
      }
      
      private function cmdChannelsList(_arg_1:FormattedOutput) : void
      {
         var _local_2:* = null;
         for(_local_2 in this.channels)
         {
            _arg_1.addText(_local_2);
         }
      }
      
      private function filtered(_arg_1:LogEntry, _arg_2:*, _arg_3:LogLevel) : Boolean
      {
         if(_arg_1.level != _arg_3 && _arg_3 != ANY_LOGLEVEL)
         {
            return false;
         }
         if(_arg_1.object != _arg_2 && _arg_2 != ANY_CHANNEL)
         {
            return false;
         }
         return true;
      }
      
      private function insertVars(_arg_1:String, _arg_2:Array) : String
      {
         var _local_3:int = 0;
         if(_arg_2 != null)
         {
            _local_3 = 0;
            while(_local_3 < _arg_2.length)
            {
               _arg_1 = _arg_1.replace("%" + (_local_3 + 1),_arg_2[_local_3]);
               _local_3++;
            }
         }
         return _arg_1;
      }
      
      private function print(_arg_1:FormattedOutput, _arg_2:LogEntry) : void
      {
         _arg_1.addText(_arg_2.level.getName() + " [" + _arg_2.object + "] " + this.insertVars(_arg_2.message,_arg_2.params));
      }
      
      private function getOrCreateBufferForChannel(_arg_1:Object) : Vector.<LogEntry>
      {
         var _local_2:Vector.<LogEntry> = this.getBufferForChannel(_arg_1);
         if(_local_2 == this.EMPTY_VECTOR)
         {
            _local_2 = new Vector.<LogEntry>();
            this.channels[_arg_1] = _local_2;
         }
         return _local_2;
      }
      
      private function getBufferForChannel(_arg_1:Object) : Vector.<LogEntry>
      {
         return Boolean(this.channels[_arg_1]) ? this.channels[_arg_1] : this.EMPTY_VECTOR;
      }
   }
}

