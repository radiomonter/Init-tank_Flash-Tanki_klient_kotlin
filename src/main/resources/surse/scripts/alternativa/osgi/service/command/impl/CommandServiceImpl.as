package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class CommandServiceImpl implements CommandService
   {
      
      private static const TOKENIZER:RegExp = /(?:[^"\s]+)|(?:"[^"]*")/g;
      
      private const DEFAULT_SCOPE:String = "cmd";
      
      public var commands:Vector.<Command> = new Vector.<Command>();
      
      public function CommandServiceImpl()
      {
         super();
      }
      
      public function registerCommand(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Array, _arg_5:Function) : void
      {
         var _local_6:Command = new Command(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         this.commands.push(_local_6);
      }
      
      public function removeCommand(_arg_1:String, _arg_2:String, _arg_3:Array) : void
      {
         var _local_4:Command = null;
         var _local_5:int = 0;
         while(_local_5 < this.commands.length)
         {
            _local_4 = this.commands[_local_5];
            if(this.isEqualsFullCmd(_local_4,_arg_1,_arg_2))
            {
               if(_local_4.argsType.toString() == _arg_3.toString())
               {
                  this.commands.splice(_local_5,1);
                  return;
               }
            }
            _local_5++;
         }
      }
      
      public function execute(_arg_1:String, _arg_2:FormattedOutput) : void
      {
         var _local_3:String = null;
         var _local_4:Vector.<String> = null;
         var _local_5:Vector.<String> = this.parseCommands(_arg_1);
         var _local_6:FormattedOutputToString = new FormattedOutputToString();
         this.parseAndExecuteCommand(_local_5[0],[],_local_6);
         var _local_7:int = 1;
         while(_local_7 < _local_5.length)
         {
            _local_3 = _local_5[_local_7];
            _local_4 = _local_6.content;
            _local_6 = new FormattedOutputToString();
            this.parseAndExecuteCommand(_local_3,[_local_4],_local_6);
            _local_7++;
         }
         _arg_2.addLines(_local_6.content);
      }
      
      private function parseCommands(_arg_1:String) : Vector.<String>
      {
         var _local_2:String = null;
         var _local_3:String = null;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_4:Vector.<String> = new Vector.<String>();
         var _local_5:Boolean = true;
         _local_7 = 0;
         while(_local_7 < _arg_1.length)
         {
            _local_2 = _arg_1.charAt(_local_7);
            if(_local_2 == "\"")
            {
               _local_5 = !_local_5;
            }
            if(_local_2 == "|" && _local_5)
            {
               _local_3 = _arg_1.substr(_local_6,_local_7 - _local_6);
               _local_4.push(_local_3);
               _local_6 = _local_7 + 1;
            }
            _local_7++;
         }
         var _local_8:String = _arg_1.substr(_local_6,_arg_1.length - _local_6);
         _local_4.push(_local_8);
         return _local_4;
      }
      
      private function parseAndExecuteCommand(_arg_1:String, _arg_2:Array, _arg_3:FormattedOutput) : void
      {
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:Command = null;
         var _local_7:Array = null;
         var _local_10:int = 0;
         _arg_1 = _arg_1.replace(/^\s+|\s+$/g,"");
         var _local_8:Array = _arg_1.match(TOKENIZER);
         if(_local_8.length == 0)
         {
            throw new CommandNotFoundError(_arg_1,"");
         }
         var _local_9:Array = (_local_8[0] as String).split(".");
         if(_local_9.length == 1)
         {
            _local_4 = "cmd";
            _local_5 = _local_9[0];
         }
         else
         {
            if(_local_9.length != 2)
            {
               throw new InvalidCommandFormatError(_arg_1);
            }
            _local_4 = _local_9[0];
            _local_5 = _local_9[1];
         }
         _local_8.shift();
         while(_local_10 < this.commands.length)
         {
            _local_6 = this.commands[_local_10];
            if(this.isEqualsFullCmd(_local_6,_local_4,_local_5))
            {
               if(_local_6.argsType.length === _local_8.length + _arg_2.length)
               {
                  _local_7 = this.convert(_local_6.argsType,_local_8);
                  _local_7 = _local_7.concat(_arg_2);
                  _local_6.excute(_local_7,_arg_3);
                  return;
               }
            }
            _local_10++;
         }
         var _local_11:* = "";
         _local_10 = 0;
         while(_local_10 < this.commands.length)
         {
            _local_6 = this.commands[_local_10];
            if(_local_6.scope != this.DEFAULT_SCOPE)
            {
               if(_local_6.cmd == _local_5 || _local_6.scope == _local_4 || _local_6.scope == _local_5)
               {
                  _local_11 += _local_6.scope + "." + _local_6.cmd + " " + _local_6.help() + "\n";
               }
            }
            _local_10++;
         }
         throw new CommandNotFoundError(_arg_1,_local_11);
      }
      
      private function isEqualsFullCmd(_arg_1:Command, _arg_2:String, _arg_3:String) : Boolean
      {
         return _arg_1.scope == _arg_2 && _arg_1.cmd == _arg_3;
      }
      
      private function convert(param1:Array, param2:Array) : Array
      {
         var argsType:Array = null;
         argsType = param1;
         var stringParams:Array = param2;
         return stringParams.map(function(_arg_1:*, _arg_2:int, _arg_3:Array):*
         {
            var _local_4:* = undefined;
            var _local_5:* = argsType[_arg_2];
            switch(_local_5)
            {
               case String:
                  _local_4 = _arg_1 as String;
                  if(_local_4.charAt(0) == "\"")
                  {
                     _local_4 = _local_4.substr(1);
                  }
                  if(_local_4.charAt(_local_4.length - 1) == "\"")
                  {
                     _local_4 = _local_4.substr(0,_local_4.length - 1);
                  }
                  return _local_4;
               case int:
                  return int(_arg_1);
               case uint:
                  return uint(_arg_1);
               case Number:
                  return Number(_arg_1);
               default:
                  return;
            }
         });
      }
   }
}

