package platform.client.fp10.core.logging.serverlog
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogTarget;
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.network.command.control.client.LogCommand;
   import platform.client.fp10.core.service.serverlog.impl.ServerLogPanel;
   
   public class ServerLogTarget implements LogTarget
   {
      
      private static const logLevels:Object = {
         "t":LogLevel.TRACE,
         "d":LogLevel.DEBUG,
         "i":LogLevel.INFO,
         "w":LogLevel.WARNING,
         "e":LogLevel.ERROR
      };
      
      private var commandSender:ICommandSender;
      
      private var channelLevels:Object = {};
      
      private var serverLogPanel:ServerLogPanel;
      
      public function ServerLogTarget(_arg_1:ICommandSender, _arg_2:String)
      {
         super();
         this.commandSender = _arg_1;
         this.setup(_arg_2);
      }
      
      private static function createMessage(_arg_1:String, _arg_2:Array) : String
      {
         var _local_3:int = 0;
         if(Boolean(_arg_2))
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
      
      private function setup(_arg_1:String) : void
      {
         var _local_2:String = null;
         var _local_3:Array = _arg_1.split(",");
         for each(_local_2 in _local_3)
         {
            this.setupChannelLevels(_local_2);
         }
      }
      
      private function setupChannelLevels(_arg_1:String) : void
      {
         var _local_2:String = null;
         var _local_3:LogLevel = null;
         if(!_arg_1)
         {
            return;
         }
         var _local_4:Array = _arg_1.split(":");
         var _local_5:String = _local_4[0];
         var _local_6:String = _local_4[1];
         if(!_local_5 || !_local_6)
         {
            return;
         }
         var _local_7:Object = {};
         var _local_8:Array = _local_6.split("");
         for each(_local_2 in _local_8)
         {
            _local_3 = logLevels[_local_2];
            if(Boolean(_local_3))
            {
               _local_7[_local_3] = true;
            }
         }
         this.channelLevels[_local_5] = _local_7;
      }
      
      public function log(_arg_1:Object, _arg_2:LogLevel, _arg_3:String, _arg_4:Array = null) : void
      {
         var _local_5:String = null;
         var _local_6:String = _arg_1.toString();
         if(this.isLogEnabled(_local_6,_arg_2))
         {
            _local_5 = createMessage(_arg_3,_arg_4);
            this.commandSender.sendCommand(new LogCommand(_arg_2.getValue(),_local_6,_local_5));
            if(Boolean(this.serverLogPanel))
            {
               this.serverLogPanel.addLogMessage(_arg_2.getName(),_local_6 + " " + _local_5);
            }
         }
      }
      
      private function isLogEnabled(_arg_1:String, _arg_2:LogLevel) : Boolean
      {
         var _local_3:Object = this.channelLevels[_arg_1];
         return Boolean(_local_3) && Boolean(_local_3[_arg_2]);
      }
      
      public function setLogPanel(_arg_1:ServerLogPanel) : void
      {
         this.serverLogPanel = _arg_1;
      }
   }
}

