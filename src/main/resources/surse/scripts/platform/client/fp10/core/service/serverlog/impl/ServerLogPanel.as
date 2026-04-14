package platform.client.fp10.core.service.serverlog.impl
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   
   public class ServerLogPanel
   {
      
      private var textFormat:TextFormat = new TextFormat("Courier",14);
      
      private var textColor:uint = 0;
      
      private var bgColor:uint = 14540253;
      
      private var stage:Stage;
      
      private var btnShowLog:ErrorLogButton;
      
      private var btnCloseLog:ErrorLogButton;
      
      private var btnCopyLog:ErrorLogButton;
      
      private var btnClearLog:ErrorLogButton;
      
      private var container:Sprite;
      
      private var output:Sprite;
      
      private var levelFilter:Object = {};
      
      private var entries:Vector.<LogEntry> = new Vector.<LogEntry>();
      
      private var filteredEntries:Vector.<LogEntry> = new Vector.<LogEntry>();
      
      private var logLevels:Array = [];
      
      private var textFields:Vector.<TextField> = new Vector.<TextField>();
      
      private var filterButtons:Vector.<FilterButton> = new Vector.<FilterButton>();
      
      private var charWidth:int;
      
      private var charHeight:int;
      
      private var hSpacing:int = 2;
      
      private var numLines:int;
      
      private var lineWidth:int;
      
      private var currentLine:int;
      
      public function ServerLogPanel(_arg_1:Stage)
      {
         super();
         this.stage = _arg_1;
         this.container = new Sprite();
         this.btnShowLog = new ErrorLogButton("[Click to view server log messages]",16776960,16711680);
         this.btnShowLog.addEventListener(MouseEvent.CLICK,this.onBtnShowLogClick);
         this.btnCloseLog = new ErrorLogButton("[Close]",65280,0);
         this.btnCloseLog.addEventListener(MouseEvent.CLICK,this.onBtnCloseClick);
         this.container.addChild(this.btnCloseLog);
         this.btnCopyLog = new ErrorLogButton("[Copy to clipboard]",65280,0);
         this.btnCopyLog.addEventListener(MouseEvent.CLICK,this.onBtnCopyClick);
         this.btnCopyLog.x = this.btnCloseLog.width;
         this.container.addChild(this.btnCopyLog);
         this.btnClearLog = new ErrorLogButton("[Clear]",65280,0);
         this.btnClearLog.addEventListener(MouseEvent.CLICK,this.onBtnClearClick);
         this.btnClearLog.x = this.btnCopyLog.x + this.btnCopyLog.width;
         this.container.addChild(this.btnClearLog);
         this.container.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         this.container.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this.output = new Sprite();
         this.container.addChild(this.output);
         _arg_1.addEventListener(Event.RESIZE,this.onStageResize);
         this.calcTextMetrics(_arg_1);
         this.onStageResize(null);
      }
      
      public function addLogMessage(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:String = null;
         var _local_4:int = 0;
         this.updateLogLevels(_arg_1);
         var _local_5:int = this.currentLine;
         var _local_6:int = this.lineWidth - _arg_1.length - 3;
         var _local_7:Array = _arg_2.split(/\n|\r|\n\r/);
         for each(_local_3 in _local_7)
         {
            _local_4 = 0;
            while(_local_4 < _local_3.length)
            {
               this.addLogEntry(new LogEntry(_arg_1,_local_3.substr(_local_4,_local_6)));
               _local_4 += _local_6;
            }
         }
         if(this.container.parent == null)
         {
            this.stage.addChild(this.btnShowLog);
         }
         else if(_local_5 != this.currentLine)
         {
            this.updateOutput();
         }
      }
      
      private function addLogEntry(_arg_1:LogEntry) : void
      {
         this.entries.push(_arg_1);
         if(this.levelFilter[_arg_1.logLevel] != null)
         {
            this.filteredEntries.push(_arg_1);
            if(this.currentLine == this.filteredEntries.length - 1)
            {
               this.currentLine = this.filteredEntries.length;
            }
         }
      }
      
      private function updateOutput() : void
      {
         if(this.container.parent != null)
         {
            this.printEntries(this.filteredEntries,this.currentLine);
         }
      }
      
      private function calcTextMetrics(_arg_1:Stage) : void
      {
         var _local_2:TextField = new TextField();
         _local_2.defaultTextFormat = this.textFormat;
         _local_2.text = "a";
         _arg_1.addChild(_local_2);
         this.charWidth = _local_2.textWidth;
         this.charHeight = _local_2.textHeight;
         _arg_1.removeChild(_local_2);
      }
      
      private function resizeOutput(_arg_1:int, _arg_2:int) : void
      {
         this.numLines = _arg_2 / (this.charHeight + this.hSpacing);
         this.lineWidth = _arg_1 / this.charWidth;
         this.updateTextFields(_arg_1);
         this.scrollOutput(0);
         var _local_3:Graphics = this.output.graphics;
         _local_3.clear();
         _local_3.beginFill(this.bgColor);
         _local_3.drawRect(0,0,_arg_1,_arg_2);
         _local_3.endFill();
      }
      
      private function updateTextFields(_arg_1:int) : void
      {
         var _local_2:TextField = null;
         var _local_4:int = 0;
         while(this.textFields.length > this.numLines)
         {
            this.output.removeChild(this.textFields.pop());
         }
         while(this.textFields.length < this.numLines)
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
         _local_1.textColor = this.textColor;
         _local_1.defaultTextFormat = this.textFormat;
         this.output.addChild(_local_1);
         this.textFields.push(_local_1);
      }
      
      private function printEntries(_arg_1:Vector.<LogEntry>, _arg_2:int) : void
      {
         var _local_3:int = 0;
         var _local_4:LogEntry = null;
         var _local_5:int = _arg_2 - this.numLines;
         if(_local_5 < 0)
         {
            _local_5 = 0;
         }
         else
         {
            _arg_2 = this.numLines;
         }
         _local_3 = 0;
         while(_local_3 < _arg_2)
         {
            _local_4 = _arg_1[_local_5 + _local_3];
            this.textFields[_local_3].text = _local_4.toString();
            _local_3++;
         }
         while(_local_3 < this.numLines)
         {
            this.textFields[_local_3++].text = "";
         }
      }
      
      private function filterByLevels() : void
      {
         var _local_1:LogEntry = null;
         this.filteredEntries.length = 0;
         for each(_local_1 in this.entries)
         {
            if(this.levelFilter[_local_1.logLevel] != null)
            {
               this.filteredEntries.push(_local_1);
            }
         }
         this.scrollOutput(0);
      }
      
      private function updateLogLevels(_arg_1:String) : void
      {
         var _local_2:FilterButton = null;
         var _local_3:int = this.logLevels.indexOf(_arg_1);
         if(_local_3 < 0)
         {
            this.logLevels.push(_arg_1);
            this.logLevels.sort();
            this.levelFilter[_arg_1] = true;
            _local_2 = new FilterButton("[" + _arg_1 + "]",65280,21760,0,_arg_1);
            this.container.addChild(_local_2);
            _local_2.addEventListener(MouseEvent.CLICK,this.onFilterButtonClick);
            _local_2.y = 20;
            this.filterButtons.push(_local_2);
            this.filterButtons.sort(this.filterSort);
            this.updateFilterButtons();
         }
      }
      
      private function updateFilterButtons() : void
      {
         var _local_1:FilterButton = null;
         var _local_2:int = 0;
         for each(_local_1 in this.filterButtons)
         {
            _local_1.x = _local_2;
            _local_2 += _local_1.width;
         }
      }
      
      private function filterSort(_arg_1:FilterButton, _arg_2:FilterButton) : Number
      {
         if(_arg_1.filterString == _arg_2.filterString)
         {
            return 0;
         }
         if(_arg_1.filterString > _arg_2.filterString)
         {
            return 1;
         }
         return -1;
      }
      
      private function onFilterButtonClick(_arg_1:MouseEvent) : void
      {
         var _local_2:FilterButton = FilterButton(_arg_1.target);
         _local_2.active = !_local_2.active;
         if(_local_2.active)
         {
            this.levelFilter[_local_2.filterString] = true;
         }
         else
         {
            delete this.levelFilter[_local_2.filterString];
         }
         this.filterByLevels();
         this.updateOutput();
      }
      
      private function onBtnShowLogClick(_arg_1:Event) : void
      {
         this.stage.removeChild(this.btnShowLog);
         this.stage.addChild(this.container);
         this.onStageResize(null);
      }
      
      private function onStageResize(_arg_1:Event) : void
      {
         var _local_2:int = 40;
         this.output.y = _local_2;
         this.resizeOutput(this.stage.stageWidth,this.stage.stageHeight - _local_2);
         this.printEntries(this.filteredEntries,this.currentLine);
      }
      
      private function onBtnCloseClick(_arg_1:Event) : void
      {
         this.stage.removeChild(this.container);
         this.stage.focus = this.stage;
      }
      
      private function onBtnCopyClick(_arg_1:Event) : void
      {
         var _local_2:LogEntry = null;
         var _local_3:* = "";
         for each(_local_2 in this.filteredEntries)
         {
            _local_3 += _local_2.toString() + "\n";
         }
         System.setClipboard(_local_3);
      }
      
      private function onBtnClearClick(_arg_1:Event) : void
      {
         var _local_2:FilterButton = null;
         this.entries.length = 0;
         this.filteredEntries.length = 0;
         for each(_local_2 in this.filterButtons)
         {
            _local_2.removeEventListener(MouseEvent.CLICK,this.onFilterButtonClick);
            this.container.removeChild(_local_2);
         }
         this.filterButtons.length = 0;
         this.logLevels.length = 0;
         this.levelFilter = {};
         this.currentLine = 0;
         this.updateOutput();
      }
      
      private function onKey(_arg_1:KeyboardEvent) : void
      {
         switch(_arg_1.keyCode)
         {
            case Keyboard.PAGE_UP:
               this.scrollOutput(-this.numLines);
               return;
            case Keyboard.PAGE_DOWN:
               this.scrollOutput(this.numLines);
         }
      }
      
      private function scrollOutput(_arg_1:int) : void
      {
         this.currentLine += _arg_1;
         if(this.currentLine < this.numLines)
         {
            this.currentLine = this.numLines;
         }
         if(this.currentLine > this.filteredEntries.length)
         {
            this.currentLine = this.filteredEntries.length;
         }
         this.updateOutput();
      }
      
      private function onMouseWheel(_arg_1:MouseEvent) : void
      {
         this.scrollOutput(-_arg_1.delta);
      }
   }
}

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class LogEntry
{
   
   public var logLevel:String;
   
   public var text:String;
   
   public function LogEntry(_arg_1:String, _arg_2:String)
   {
      super();
      this.logLevel = _arg_1;
      this.text = _arg_2;
   }
   
   public function toString() : String
   {
      return "[" + this.logLevel + "] " + this.text;
   }
}

class ErrorLogButton extends Sprite
{
   
   internal var label:TextField;
   
   public function ErrorLogButton(_arg_1:String, _arg_2:uint, _arg_3:uint)
   {
      super();
      mouseChildren = false;
      buttonMode = true;
      this.label = new TextField();
      this.label.defaultTextFormat = new TextFormat("Tahoma",12,_arg_2);
      this.label.autoSize = TextFieldAutoSize.LEFT;
      this.label.text = _arg_1;
      this.label.background = true;
      this.label.backgroundColor = _arg_3;
      addChild(this.label);
   }
}

class FilterButton extends Sprite
{
   
   public var filterString:String;
   
   internal var _active:Boolean = true;
   
   internal var label:TextField;
   
   internal var activeBgColor:uint;
   
   internal var inactiveBgColor:uint;
   
   public function FilterButton(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:String)
   {
      super();
      this.activeBgColor = _arg_3;
      this.inactiveBgColor = _arg_4;
      this.filterString = _arg_5;
      mouseChildren = false;
      buttonMode = true;
      this.label = new TextField();
      this.label.defaultTextFormat = new TextFormat("Tahoma",12,_arg_2);
      this.label.autoSize = TextFieldAutoSize.LEFT;
      this.label.text = _arg_1;
      this.label.background = true;
      this.label.backgroundColor = _arg_3;
      addChild(this.label);
   }
   
   public function get active() : Boolean
   {
      return this._active;
   }
   
   public function set active(_arg_1:Boolean) : void
   {
      this._active = _arg_1;
      this.label.backgroundColor = !this._active ? uint(this.inactiveBgColor) : uint(this.activeBgColor);
   }
}
