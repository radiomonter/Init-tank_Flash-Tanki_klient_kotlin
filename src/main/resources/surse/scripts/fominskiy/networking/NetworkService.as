package fominskiy.networking
{
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   
   public class NetworkService
   {
      
      public static var listeners:Vector.<INetworkListener>;
      
      public static const DELIM_COMMANDS_SYMBOL:String = "~dne";
      
      public static const DELIM_ARGUMENTS_SYMBOL:String = ";";
      
      private var badRequest:String = "";
      
      public function NetworkService()
      {
         super();
         listeners = new Vector.<INetworkListener>();
      }
      
      public static function getType(_arg_1:String) : Type
      {
         var _local_2:Type = null;
         switch(_arg_1)
         {
            case "auth":
               _local_2 = Type.AUTH;
               break;
            case "registration":
               _local_2 = Type.REGISTRATON;
               break;
            case "chat":
               _local_2 = Type.CHAT;
               break;
            case "lobby":
               _local_2 = Type.LOBBY;
               break;
            case "garage":
               _local_2 = Type.GARAGE;
               break;
            case "battle":
               _local_2 = Type.BATTLE;
               break;
            case "ping":
               _local_2 = Type.PING;
               break;
            case "lobby_chat":
               _local_2 = Type.LOBBY_CHAT;
               break;
            case "system":
               _local_2 = Type.SYSTEM;
               break;
            case "restore":
               _local_2 = Type.RESTORE;
               break;
            case "battle_select":
               _local_2 = Type.BATTLE_SELECT;
               break;
            case "clan":
               _local_2 = Type.CLAN;
               break;
            default:
               _local_2 = Type.UNKNOWN;
         }
         return _local_2;
      }
      
      public function protocolDecrypt(_arg_1:String, _arg_2:Network) : void
      {
         var _local_5:Array = null;
         var _local_6:Type = null;
         var _local_7:String = null;
         var _local_8:int = 0;
         var _local_9:Command = null;
         var _local_4:int = 0;
         _arg_1 = this.badRequest + _arg_1;
         var _local_3:Array = _arg_1.split(DELIM_COMMANDS_SYMBOL);
         while(_local_4 < _local_3.length - 1)
         {
            _local_5 = _local_3[_local_4].split(DELIM_ARGUMENTS_SYMBOL);
            _local_6 = getType(_local_5[0]);
            if(_local_6 == null || _local_6 == Type.UNKNOWN)
            {
               throw new Error("Что то пошло не так  " + _local_5[0]);
            }
            _local_7 = "";
            _local_8 = 1;
            while(_local_8 < _local_5.length)
            {
               _local_7 += _local_5[_local_8] + DELIM_ARGUMENTS_SYMBOL;
               _local_8++;
            }
            _local_9 = new Command(_local_6,_local_7.split(DELIM_ARGUMENTS_SYMBOL),_arg_1);
            this.sendRequestToAllListeners(_local_9);
            _local_4++;
         }
         this.badRequest = _local_3[_local_3.length - 1];
      }
      
      public function perigyfe(_arg_1:String, _arg_2:String) : Boolean
      {
         return _arg_2 == _arg_1.substring(_arg_1.length - _arg_2.length);
      }
      
      public function endWith(_arg_1:String) : Boolean
      {
         return _arg_1.charAt(_arg_1.length - 1) == DELIM_COMMANDS_SYMBOL;
      }
      
      public function sendRequestToAllListeners(_arg_1:Command) : void
      {
         var _local_2:INetworkListener = null;
         for each(_local_2 in listeners)
         {
            _local_2.onData(_arg_1);
         }
      }
      
      public function addListener(_arg_1:INetworkListener) : void
      {
         listeners.push(_arg_1);
      }
      
      public function removeListener(_arg_1:INetworkListener) : void
      {
         var _local_3:INetworkListener = null;
         var _local_2:int = 0;
         for each(_local_3 in listeners)
         {
            if(_local_3 == _arg_1)
            {
               break;
            }
            _local_2++;
         }
         listeners.removeAt(_local_2);
      }
   }
}

