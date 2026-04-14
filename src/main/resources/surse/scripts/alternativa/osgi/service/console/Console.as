package alternativa.osgi.service.console
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.console.variables.ConsoleVar;
   import alternativa.utils.CircularStringBuffer;
   import alternativa.utils.ICircularStringBuffer;
   import alternativa.utils.IStringBufferIterator;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   
   public class Console implements IConsole
   {
      
      private static const DEFAULT_BG_COLOR:uint = 16777215;
      
      private static const DEFAULT_FONT_COLOR:uint = 0;
      
      private static const DEFAULT_TEXT_FORMAT:TextFormat = new TextFormat("Courier New",12,DEFAULT_FONT_COLOR);
      
      private static const INPUT_HEIGHT:int = 20;
      
      private static const LINE_SPLITTER:RegExp = /\n|\r|\n\r/;
      
      private static const TOKENIZER:RegExp = /(?:[^"\s]+)|(?:"[^"]*")/g;
      
      private var stage:Stage;
      
      private var container:Sprite = new Sprite();
      
      private var outputContainer:Sprite;
      
      private var input:TextField;
      
      private var textFields:Vector.<TextField> = new Vector.<TextField>();
      
      private var charWidth:int;
      
      private var charHeight:int;
      
      private var hSpacing:int = 0;
      
      private var preventInput:Boolean;
      
      private var visible:Boolean;
      
      private var commandHistory:Array = [];
      
      private var commandHistoryIndex:int = 0;
      
      private var variables:Object = {};
      
      private var numPageLines:int;
      
      private var lineWidth:int;
      
      private var topPageLine:int;
      
      private var buffer:ICircularStringBuffer;
      
      private var _widthPercent:int;
      
      private var _heightPercent:int;
      
      private var align:int;
      
      private var consoleBackgroundColor:uint = 16777215;
      
      private var consoleForegroundColor:uint = 0;
      
      private var _alpha:Number = 1;
      
      private var filter:String;
      
      private var commandService:CommandService;
      
      private var lastException:Error;
      
      public function Console(_arg_1:CommandService, _arg_2:Stage, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
      {
         super();
         this.commandService = _arg_1;
         this.stage = _arg_2;
         this.buffer = new CircularStringBuffer(15000);
         this.calcTextMetrics(_arg_2);
         this.initInput();
         this.initOutput();
         this.setSize(_arg_3,_arg_4);
         this.horizontalAlignment = _arg_5;
         this.vericalAlignment = _arg_6;
         _arg_2.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         _arg_2.addEventListener(Event.RESIZE,this.onResize);
         _arg_1.registerCommand("console","hide","Спрятать консоль",[],this.onHide);
         _arg_1.registerCommand("console","copy","Скопировать содержимое консоли в буфер обмена",[],this.copyConsoleContent);
         _arg_1.registerCommand("cmd","clear","Очистить консоль",[],this.clearConsole);
         _arg_1.registerCommand("cmd","e","Показать последний exception",[],this.showException);
         _arg_1.registerCommand("console","height","Установить высоту консоли",[int],this.onConsoleHeight);
         _arg_1.registerCommand("console","width","Установить ширину консоли",[int],this.onConsoleWidth);
         _arg_1.registerCommand("console","halign","Выравнивание по горизонтали",[int],this.onHorizontalAlign);
         _arg_1.registerCommand("console","valign","Выравнивание по вертикали",[int],this.onVerticalAlign);
         _arg_1.registerCommand("console","alpha","Установить прозрачность консоли",[Number],this.onAlpha);
         _arg_1.registerCommand("console","bg","Установить цвет фона",[uint],this.onBackgroundColor);
         _arg_1.registerCommand("console","fg","Установить цвет шрифта",[uint],this.onForegroundColor);
         _arg_1.registerCommand("vars","list","Посмотреть список переменных",[],this.showVarsList);
         _arg_1.registerCommand("vars","show","Посмотреть переменную",[String],this.showVar);
         _arg_1.registerCommand("vars","set","Установить значение переменной",[String,String],this.setVar);
      }
      
      private function setVar(_arg_1:FormattedOutput, _arg_2:String, _arg_3:String) : void
      {
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:ConsoleVar = this.variables[_arg_2];
         if(_local_6 != null)
         {
            _local_4 = _local_6.toString();
            _local_5 = _local_6.acceptInput(_arg_3);
            if(_local_5 == null)
            {
               _arg_1.addText("New value " + _local_6.toString() + ", old value=" + _local_4);
               return;
            }
            throw new ConsoleVarChangeError(_arg_2,_arg_3,_local_5);
         }
         throw new ConsoleVarNotFoundError(_arg_2);
      }
      
      private function showVar(_arg_1:FormattedOutput, _arg_2:String) : void
      {
         var _local_3:ConsoleVar = this.variables[_arg_2];
         if(_local_3 != null)
         {
            _arg_1.addText(_local_3.toString());
            return;
         }
         throw new ConsoleVarNotFoundError(_arg_2);
      }
      
      private function showVarsList(_arg_1:FormattedOutput) : void
      {
         var _local_2:* = null;
         for(_local_2 in this.variables)
         {
            _arg_1.addText(_local_2);
         }
      }
      
      private function showException(_arg_1:FormattedOutput) : void
      {
         if(Boolean(this.lastException))
         {
            _arg_1.addText(this.lastException.getStackTrace());
         }
      }
      
      public function addVariable(_arg_1:ConsoleVar) : void
      {
         this.variables[_arg_1.getName()] = _arg_1;
      }
      
      public function removeVariable(_arg_1:String) : void
      {
         delete this.variables[_arg_1];
      }
      
      public function set horizontalAlignment(_arg_1:int) : void
      {
         _arg_1 = this.clamp(_arg_1,1,3);
         this.align = this.align & ~3 | _arg_1;
         this.updateAlignment();
      }
      
      public function get horizontalAlignment() : int
      {
         return this.align & 3;
      }
      
      public function set vericalAlignment(_arg_1:int) : void
      {
         _arg_1 = this.clamp(_arg_1,1,3);
         this.align = this.align & ~0x0C | _arg_1 << 2;
         this.updateAlignment();
      }
      
      public function get vericalAlignment() : int
      {
         return this.align >> 2 & 3;
      }
      
      public function addText(_arg_1:String) : void
      {
         var _local_2:* = this.buffer.size - this.topPageLine <= this.numPageLines;
         var _local_3:int = this.addLine(_arg_1);
         if(Boolean(_local_2))
         {
            this.scrollOutput(_local_3);
         }
      }
      
      public function addPrefixedText(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:* = this.buffer.size - this.topPageLine <= this.numPageLines;
         var _local_4:int = this.addPrefixedLine(_arg_1,_arg_2);
         if(Boolean(_local_3))
         {
            this.scrollOutput(_local_4);
         }
      }
      
      public function addLines(_arg_1:Vector.<String>) : void
      {
         var _local_2:int = 0;
         var _local_3:String = null;
         var _local_4:* = this.buffer.size - this.topPageLine <= this.numPageLines;
         for each(_local_3 in _arg_1)
         {
            _local_2 += this.addLine(_local_3);
         }
         if(Boolean(_local_4))
         {
            this.scrollOutput(_local_2);
         }
      }
      
      public function addPrefixedLines(_arg_1:String, _arg_2:Vector.<String>) : void
      {
         var _local_3:int = 0;
         var _local_4:String = null;
         var _local_5:* = this.buffer.size - this.topPageLine <= this.numPageLines;
         for each(_local_4 in _arg_2)
         {
            _local_3 += this.addPrefixedLine(_arg_1,_local_4);
         }
         if(Boolean(_local_5))
         {
            this.scrollOutput(_local_3);
         }
      }
      
      public function show() : void
      {
         if(this.visible)
         {
            return;
         }
         this.stage.addChild(this.container);
         this.stage.focus = this.input;
         this.visible = true;
         this.onResize(null);
         this.scrollOutput(0);
      }
      
      public function hide() : void
      {
         if(this.stage == null)
         {
            return;
         }
         if(this.visible)
         {
            this.stage.removeChild(this.container);
            this.stage.focus = this.stage;
            this.visible = false;
         }
      }
      
      public function isVisible() : Boolean
      {
         return this.visible;
      }
      
      public function setSize(_arg_1:int, _arg_2:int) : void
      {
         _arg_1 = this.clamp(_arg_1,1,100);
         _arg_2 = this.clamp(_arg_2,1,100);
         if(_arg_1 == this._widthPercent && _arg_2 == this._heightPercent)
         {
            return;
         }
         this._widthPercent = _arg_1;
         this._heightPercent = _arg_2;
         this.updateSize();
         this.updateAlignment();
      }
      
      public function set width(_arg_1:int) : void
      {
         this.setSize(_arg_1,this._heightPercent);
      }
      
      public function get width() : int
      {
         return this._widthPercent;
      }
      
      public function set height(_arg_1:int) : void
      {
         this.setSize(this._widthPercent,_arg_1);
      }
      
      public function get height() : int
      {
         return this._heightPercent;
      }
      
      public function hideDelayed(_arg_1:uint) : void
      {
         setTimeout(this.hide,_arg_1);
      }
      
      public function executeCommand(param1:String) : void
      {
         var len:int;
         var text:String = param1;
         if(Boolean(text.match(/^\s*$/)))
         {
            return;
         }
         len = int(this.commandHistory.length);
         if(len == 0 || this.commandHistory[len - 1] != text)
         {
            this.commandHistory.push(text);
         }
         this.commandHistoryIndex = len + 1;
         try
         {
            this.commandService.execute(text,this);
            return;
         }
         catch(e:Error)
         {
            addText(e.message);
            lastException = e;
            return;
         }
      }
      
      public function set alpha(_arg_1:Number) : void
      {
         this._alpha = _arg_1;
         this.updateSize();
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      private function calcTextMetrics(_arg_1:Stage) : void
      {
         var _local_2:TextField = new TextField();
         _local_2.defaultTextFormat = DEFAULT_TEXT_FORMAT;
         _local_2.text = "j";
         _arg_1.addChild(_local_2);
         this.charWidth = _local_2.textWidth;
         this.charHeight = _local_2.textHeight + 4;
         _arg_1.removeChild(_local_2);
      }
      
      private function initInput() : void
      {
         this.input = new TextField();
         this.input.defaultTextFormat = DEFAULT_TEXT_FORMAT;
         this.input.height = INPUT_HEIGHT;
         this.input.type = TextFieldType.INPUT;
         this.input.background = true;
         this.input.backgroundColor = DEFAULT_BG_COLOR;
         this.input.border = true;
         this.input.borderColor = DEFAULT_FONT_COLOR;
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.onInputKeyDown);
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.onInputKeyUp);
         this.input.addEventListener(TextEvent.TEXT_INPUT,this.onTextInput);
         this.container.addChild(this.input);
      }
      
      private function initOutput() : void
      {
         this.outputContainer = new Sprite();
         this.outputContainer.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this.container.addChild(this.outputContainer);
      }
      
      private function resizeOutput(_arg_1:int, _arg_2:int) : void
      {
         this.numPageLines = _arg_2 / (this.charHeight + this.hSpacing);
         this.lineWidth = _arg_1 / this.charWidth - 1;
         this.updateTextFields(_arg_1);
         this.scrollOutput(0);
         var _local_3:Graphics = this.outputContainer.graphics;
         _local_3.clear();
         _local_3.beginFill(this.consoleBackgroundColor,this._alpha);
         _local_3.drawRect(0,0,_arg_1,_arg_2);
         _local_3.endFill();
      }
      
      private function updateTextFields(_arg_1:int) : void
      {
         var _local_2:TextField = null;
         var _local_4:int = 0;
         while(this.textFields.length > this.numPageLines)
         {
            this.outputContainer.removeChild(this.textFields.pop());
         }
         while(this.textFields.length < this.numPageLines)
         {
            this.createTextField();
         }
         var _local_3:int = this.charHeight + this.hSpacing;
         while(_local_4 < this.textFields.length)
         {
            _local_2 = this.textFields[_local_4];
            _local_2.y = _local_4 * _local_3;
            _local_2.width = _arg_1;
            _local_4++;
         }
      }
      
      private function createTextField() : void
      {
         var _local_1:TextField = new TextField();
         _local_1.height = this.charHeight;
         _local_1.defaultTextFormat = DEFAULT_TEXT_FORMAT;
         _local_1.tabEnabled = false;
         _local_1.selectable = true;
         this.outputContainer.addChild(_local_1);
         this.textFields.push(_local_1);
      }
      
      private function scrollOutput(_arg_1:int) : void
      {
         this.topPageLine += _arg_1;
         if(this.topPageLine + this.numPageLines > this.buffer.size)
         {
            this.topPageLine = this.buffer.size - this.numPageLines;
         }
         if(this.topPageLine < 0)
         {
            this.topPageLine = 0;
         }
         this.updateOutput();
      }
      
      private function updateOutput() : void
      {
         if(this.container.parent != null)
         {
            this.printPage();
         }
      }
      
      private function printPage() : void
      {
         var _local_1:int = 0;
         var _local_2:IStringBufferIterator = this.buffer.getIterator(this.topPageLine);
         while(_local_1 < this.numPageLines && _local_2.hasNext())
         {
            TextField(this.textFields[_local_1++]).text = _local_2.getNext();
         }
         while(_local_1 < this.numPageLines)
         {
            TextField(this.textFields[_local_1++]).text = "";
         }
      }
      
      private function onInputKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(this.isToggleKey(_arg_1))
         {
            this.preventInput = true;
         }
         switch(_arg_1.keyCode)
         {
            case Keyboard.ENTER:
               this.processInput();
               break;
            case Keyboard.ESCAPE:
               if(this.input.text != "")
               {
                  this.input.text = "";
               }
               else
               {
                  this.hideDelayed(50);
               }
               break;
            case Keyboard.UP:
               this.historyUp();
               break;
            case Keyboard.DOWN:
               this.historyDown();
               break;
            case Keyboard.PAGE_UP:
               this.scrollOutput(-this.numPageLines);
               break;
            case Keyboard.PAGE_DOWN:
               this.scrollOutput(this.numPageLines);
         }
         _arg_1.stopPropagation();
      }
      
      private function onInputKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(!this.isToggleKey(_arg_1))
         {
            _arg_1.stopPropagation();
         }
      }
      
      private function onTextInput(_arg_1:TextEvent) : void
      {
         if(this.preventInput)
         {
            _arg_1.preventDefault();
            this.preventInput = false;
         }
      }
      
      private function isToggleKey(_arg_1:KeyboardEvent) : Boolean
      {
         return _arg_1.keyCode == 75 && _arg_1.ctrlKey && _arg_1.shiftKey;
      }
      
      private function processInput() : void
      {
         this.scrollOutput(this.buffer.size);
         var _local_1:String = this.input.text;
         this.input.text = "";
         this.addText("> " + _local_1);
         this.executeCommand(_local_1);
      }
      
      private function historyUp() : void
      {
         if(this.commandHistoryIndex == 0)
         {
            return;
         }
         --this.commandHistoryIndex;
         var _local_1:String = this.commandHistory[this.commandHistoryIndex];
         this.input.text = _local_1 == null ? "" : _local_1;
      }
      
      private function historyDown() : void
      {
         ++this.commandHistoryIndex;
         if(this.commandHistoryIndex >= this.commandHistory.length)
         {
            this.commandHistoryIndex = this.commandHistory.length;
            this.input.text = "";
         }
         else
         {
            this.input.text = this.commandHistory[this.commandHistoryIndex];
         }
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(this.isToggleKey(_arg_1))
         {
            if(this.visible)
            {
               this.hide();
            }
            else
            {
               this.show();
            }
         }
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.updateSize();
         this.updateAlignment();
      }
      
      private function addLine(_arg_1:String) : int
      {
         var _local_2:int = 0;
         var _local_3:String = null;
         var _local_4:int = 0;
         var _local_5:Array = _arg_1.split(LINE_SPLITTER);
         for each(_local_3 in _local_5)
         {
            if(!(this.filter && _local_3.indexOf(this.filter) < 0))
            {
               _local_4 = 0;
               while(_local_4 < _local_3.length)
               {
                  this.buffer.add(_local_3.substr(_local_4,this.lineWidth));
                  _local_2++;
                  _local_4 += this.lineWidth;
               }
            }
         }
         return _local_2;
      }
      
      private function addPrefixedLine(_arg_1:String, _arg_2:String) : int
      {
         var _local_3:int = 0;
         var _local_4:String = null;
         var _local_5:int = 0;
         var _local_6:Array = _arg_2.split(LINE_SPLITTER);
         var _local_7:int = this.lineWidth - _arg_1.length;
         for each(_local_4 in _local_6)
         {
            if(!(this.filter && _local_4.indexOf(this.filter) < 0))
            {
               _local_5 = 0;
               while(_local_5 < _local_4.length)
               {
                  this.buffer.add(_arg_1 + _local_4.substr(_local_5,_local_7));
                  _local_3++;
                  _local_5 += _local_7;
               }
            }
         }
         return _local_3;
      }
      
      private function onMouseWheel(_arg_1:MouseEvent) : void
      {
         this.scrollOutput(-_arg_1.delta);
      }
      
      private function clamp(_arg_1:int, _arg_2:int, _arg_3:int) : int
      {
         if(_arg_1 < _arg_2)
         {
            return _arg_2;
         }
         if(_arg_1 > _arg_3)
         {
            return _arg_3;
         }
         return _arg_1;
      }
      
      private function updateSize() : void
      {
         var _local_1:int = 0.01 * this._heightPercent * this.stage.stageHeight;
         var _local_2:int = 0.01 * this._widthPercent * this.stage.stageWidth;
         var _local_3:int = _local_1 - INPUT_HEIGHT;
         this.resizeOutput(_local_2,_local_3);
         this.input.y = _local_3;
         this.input.width = _local_2;
      }
      
      private function updateAlignment() : void
      {
         var _local_1:* = this.align & 3;
         switch(_local_1)
         {
            case 1:
               this.container.x = 0;
               break;
            case 2:
               this.container.x = this.stage.stageWidth - this.container.width;
               break;
            case 3:
               this.container.x = this.stage.stageWidth - this.container.width >> 1;
         }
         var _local_2:* = this.align >> 2 & 3;
         switch(_local_2)
         {
            case 1:
               this.container.y = 0;
               return;
            case 2:
               this.container.y = this.stage.stageHeight - this.container.height;
               return;
            case 3:
               this.container.y = this.stage.stageHeight - this.container.height >> 1;
         }
      }
      
      private function onHide(_arg_1:FormattedOutput) : void
      {
         this.hideDelayed(100);
      }
      
      private function copyConsoleContent(_arg_1:FormattedOutput) : void
      {
         var _local_2:IStringBufferIterator = this.buffer.getIterator(0);
         var _local_3:* = "Console content:\r\n";
         while(_local_2.hasNext())
         {
            _local_3 += _local_2.getNext() + "\r\n";
         }
         System.setClipboard(_local_3);
         this.addText("Content has been copied to clipboard");
      }
      
      private function clearConsole(_arg_1:FormattedOutput) : void
      {
         this.buffer.clear();
         this.scrollOutput(0);
      }
      
      private function onHorizontalAlign(_arg_1:FormattedOutput, _arg_2:int) : void
      {
         this.horizontalAlignment = _arg_2;
      }
      
      private function onVerticalAlign(_arg_1:FormattedOutput, _arg_2:int) : void
      {
         this.vericalAlignment = _arg_2;
      }
      
      private function onConsoleWidth(_arg_1:FormattedOutput, _arg_2:int) : void
      {
         this.setSize(_arg_2,this._heightPercent);
      }
      
      private function onConsoleHeight(_arg_1:FormattedOutput, _arg_2:int) : void
      {
         this.setSize(this._widthPercent,_arg_2);
      }
      
      private function onAlpha(_arg_1:FormattedOutput, _arg_2:Number) : void
      {
         this.alpha = _arg_2;
      }
      
      private function onBackgroundColor(_arg_1:FormattedOutput, _arg_2:uint) : void
      {
         this.updateSize();
         this.input.backgroundColor = _arg_2;
         _arg_1.addText("Background color set to " + _arg_2);
      }
      
      private function onForegroundColor(_arg_1:FormattedOutput, _arg_2:uint) : void
      {
         var _local_3:TextField = null;
         DEFAULT_TEXT_FORMAT.color = _arg_2;
         this.input.textColor = _arg_2;
         this.input.defaultTextFormat = DEFAULT_TEXT_FORMAT;
         for each(_local_3 in this.textFields)
         {
            _local_3.textColor = _arg_2;
            _local_3.defaultTextFormat = DEFAULT_TEXT_FORMAT;
         }
         _arg_1.addText("Foreground color set to " + _arg_2);
      }
      
      private function printVars(_arg_1:IConsole, _arg_2:Array) : void
      {
         this.printVariables(_arg_2[0],false);
      }
      
      private function printVarsValues(_arg_1:IConsole, _arg_2:Array) : void
      {
         this.printVariables(_arg_2[0],true);
      }
      
      private function printVariables(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_4:ConsoleVar = null;
         var _local_5:String = null;
         var _local_3:* = null;
         var _local_6:Array = [];
         for(_local_3 in this.variables)
         {
            if(_arg_1 == null || _arg_1 == "" || _local_3.indexOf(_arg_1) == 0)
            {
               _local_4 = this.variables[_local_3];
               _local_6.push(!_arg_2 ? _local_3 : _local_3 + " = " + _local_4.toString());
            }
         }
         if(_local_6.length > 0)
         {
            _local_6.sort();
            for each(_local_5 in _local_6)
            {
               this.addText(_local_5);
            }
         }
      }
      
      public function setCommandHandler(_arg_1:String, _arg_2:Function) : void
      {
      }
      
      public function removeCommandHandler(_arg_1:String) : void
      {
      }
   }
}

