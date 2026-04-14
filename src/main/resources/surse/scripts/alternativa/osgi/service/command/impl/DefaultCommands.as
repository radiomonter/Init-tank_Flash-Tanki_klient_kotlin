package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import flash.system.System;
   
   public class DefaultCommands
   {
      
      private var commandService:CommandServiceImpl;
      
      public function DefaultCommands(_arg_1:CommandService)
      {
         super();
         this.commandService = _arg_1 as CommandServiceImpl;
         _arg_1.registerCommand("cmd","help","Список всех команд",[],this.cmdList);
         _arg_1.registerCommand("cmd","help","Помощь по конкретной команде",[String],this.cmdHelp);
         _arg_1.registerCommand("cmd","grep","Поиск по строке",[String,Vector],this.cmdGrep);
         _arg_1.registerCommand("cmd","clip","Копировать вывод конвеера в буфер обмена",[Vector],this.cmdClipboard);
      }
      
      private function cmdList(param1:FormattedOutput) : void
      {
         var command:Command = null;
         var i:int = 0;
         var output:FormattedOutput = param1;
         var sortedCommands:Vector.<Command> = this.commandService.commands.sort(function(_arg_1:Command, _arg_2:Command):Number
         {
            var _local_3:* = _arg_1.scope.localeCompare(_arg_2.scope);
            if(_local_3 != 0)
            {
               return _local_3;
            }
            return _arg_1.cmd.localeCompare(_arg_2.cmd);
         });
         while(i < sortedCommands.length)
         {
            command = sortedCommands[i];
            output.addText(command.scope + "." + command.cmd);
            i += 1;
         }
      }
      
      private function cmdHelp(_arg_1:FormattedOutput, _arg_2:String) : void
      {
         var _local_3:Command = null;
         var _local_4:Boolean = false;
         var _local_5:int = 0;
         while(_local_5 < this.commandService.commands.length)
         {
            _local_3 = this.commandService.commands[_local_5];
            if(_local_3.scope + "." + _local_3.cmd == _arg_2 || _local_3.scope + "." + _local_3.cmd == "cmd." + _arg_2)
            {
               _arg_1.addText(_local_3.scope + "." + _local_3.cmd + " " + _local_3.help());
               _local_4 = true;
            }
            _local_5++;
         }
         if(!_local_4)
         {
            _arg_1.addText("Команда не найдена " + _arg_2);
         }
      }
      
      private function cmdGrep(_arg_1:FormattedOutput, _arg_2:String, _arg_3:Vector.<String>) : void
      {
         var _local_4:String = null;
         for each(_local_4 in _arg_3)
         {
            if(_local_4.indexOf(_arg_2) != -1)
            {
               _arg_1.addText(_local_4);
            }
         }
      }
      
      private function cmdClipboard(_arg_1:FormattedOutput, _arg_2:Vector.<String>) : void
      {
         var _local_3:String = _arg_2.join("\n");
         System.setClipboard(_local_3);
         _arg_1.addLines(_arg_2);
      }
   }
}

