package controls.dropdownlist
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.utils.removeDisplayObject;
   import base.DiscreteSprite;
   import controls.ComboButton;
   import controls.base.LabelBase;
   import fl.controls.List;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import utils.ScrollStyleUtils;
   
   public class DropDownList extends DiscreteSprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      protected var button:ComboButton = new ComboButton();
      
      protected var _listBg:DPLBackground;
      
      protected var list:List = new List();
      
      protected var dp:DataProvider = new DataProvider();
      
      private var _label:LabelBase;
      
      private var hiddenInput:TextField;
      
      protected var _selectedItem:Object;
      
      protected var _selectedIndex:int = 0;
      
      private var _width:int;
      
      private var _listWidthExtension:int;
      
      private var _height:int = 151;
      
      protected var _value:Object;
      
      private var _isOpen:Boolean;
      
      private var _isOver:Boolean;
      
      private var viewName:String;
      
      public function DropDownList(_arg_1:String = "gameName")
      {
         super();
         this.viewName = _arg_1;
         this.init();
      }
      
      protected function init() : void
      {
         this.hiddenInput = new TextField();
         this.hiddenInput.visible = false;
         this.hiddenInput.type = TextFieldType.INPUT;
         this._label = new LabelBase();
         this._label.x = -10;
         this._label.y = 7;
         addChild(this.listBg);
         addChild(this.list);
         addChild(this.button);
         addChild(this._label);
         this.listBg.y = 5;
         this.list.y = 33;
         this.list.x = 3;
         this.list.setSize(144,241);
         this.list.rowHeight = 20;
         this.list.dataProvider = this.dp;
         this.setRenderer(ComboR);
         ScrollStyleUtils.setGrayStyle(this.list);
         this.list.focusEnabled = false;
         this.list.visible = false;
         this.listBg.visible = false;
         this.button.addEventListener(MouseEvent.CLICK,this.onButtonClick);
      }
      
      public function setRenderer(_arg_1:Class) : void
      {
         this.list.setStyle("cellRenderer",_arg_1);
      }
      
      protected function onButtonClick(_arg_1:MouseEvent) : void
      {
         if(this.isOpen)
         {
            this.close();
         }
         else
         {
            this.open();
         }
      }
      
      protected function open() : void
      {
         if(!this.isOpen)
         {
            this.setEvent();
            this.listBg.visible = this.list.visible = true;
            display.stage.focus = this.hiddenInput;
            display.stage.addChild(this.hiddenInput);
            this._isOpen = true;
            this._isOver = true;
            dispatchEvent(new Event(Event.OPEN));
         }
      }
      
      public function get isOpen() : Boolean
      {
         return this._isOpen;
      }
      
      private function setEvent() : void
      {
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.onItemClick);
         this.hiddenInput.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUpHiddenInput);
         display.stage.addEventListener(MouseEvent.CLICK,this.onClickStage);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      private function onClickStage(_arg_1:MouseEvent) : void
      {
         if(!this._isOver)
         {
            this.close();
         }
      }
      
      private function onRollOver(_arg_1:MouseEvent) : void
      {
         this._isOver = true;
      }
      
      private function onRollOut(_arg_1:MouseEvent) : void
      {
         this._isOver = false;
      }
      
      protected function close() : void
      {
         if(this.isOpen)
         {
            this.removeEvents();
            this.listBg.visible = this.list.visible = false;
            removeDisplayObject(this.hiddenInput);
            this.clearFocus();
            this._isOpen = false;
         }
      }
      
      private function removeEvents() : void
      {
         this.hiddenInput.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUpHiddenInput);
         this.list.removeEventListener(ListEvent.ITEM_CLICK,this.onItemClick);
         display.stage.removeEventListener(MouseEvent.CLICK,this.onClickStage);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      private function clearFocus() : void
      {
         if(display.stage.focus == this.hiddenInput)
         {
            display.stage.focus = null;
         }
      }
      
      public function get selectedItem() : Object
      {
         return this._selectedItem;
      }
      
      public function set selectedItem(_arg_1:Object) : void
      {
         if(_arg_1 == null)
         {
            this._selectedItem = null;
            this.button.label = "";
         }
         else
         {
            this._selectedIndex = this.dp.getItemIndex(_arg_1);
            this._selectedItem = this.dp.getItemAt(this._selectedIndex);
            this.button.label = _arg_1[this.viewName];
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get selectedIndex() : int
      {
         return this._selectedIndex;
      }
      
      public function set label(_arg_1:String) : void
      {
         this._label.text = _arg_1;
         this._label.autoSize = TextFieldAutoSize.RIGHT;
      }
      
      public function getLabelWidth() : int
      {
         return this._label.width;
      }
      
      protected function onItemClick(_arg_1:ListEvent) : void
      {
         var _local_2:Object = _arg_1.item;
         this._selectedIndex = _arg_1.index;
         if(_local_2.rang == 0)
         {
            this.button.label = _local_2[this.viewName];
            this._selectedItem = _local_2;
         }
         this.close();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function addItem(_arg_1:Object) : void
      {
         var _local_2:Object = null;
         this.dp.addItem(_arg_1);
         _local_2 = this.dp.getItemAt(0);
         this._selectedItem = _local_2;
         this.button.label = _local_2[this.viewName];
      }
      
      public function replaceItemAt(_arg_1:Object, _arg_2:int) : void
      {
         this.dp.replaceItemAt(_arg_1,_arg_2);
      }
      
      public function sortOn(_arg_1:Object, _arg_2:Object = null) : void
      {
         var _local_3:Object = null;
         this.dp.sortOn(_arg_1,_arg_2);
         if(this.dp.length > 0)
         {
            _local_3 = this.dp.getItemAt(0);
            this._selectedItem = _local_3;
            this._value = this._selectedItem[this.viewName];
            this.button.label = _local_3[this.viewName];
         }
      }
      
      public function clear() : void
      {
         this.dp = new DataProvider();
         this.list.dataProvider = this.dp;
         this.button.label = "";
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.draw();
      }
      
      public function set listWidthExtension(_arg_1:Number) : void
      {
         this._listWidthExtension = _arg_1;
         this.draw();
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = _arg_1;
         this.draw();
      }
      
      protected function draw() : void
      {
         this.listBg.width = this._width + this._listWidthExtension;
         this.listBg.height = this._height - 2;
         this.button.width = this._width;
         this.list.setSize(this._width + this._listWidthExtension,this._height - 34);
         this.list.invalidate();
      }
      
      public function set value(_arg_1:Object) : void
      {
         var _local_2:Object = null;
         var _local_3:int = 0;
         this._value = "";
         this.button.label = this._value.toString();
         this._selectedItem = null;
         while(_local_3 < this.dp.length)
         {
            _local_2 = this.dp.getItemAt(_local_3);
            if(_local_2[this.viewName] == _arg_1)
            {
               this._selectedItem = _local_2;
               this._value = this._selectedItem[this.viewName];
               this.button.label = this._value.toString();
               this.list.selectedIndex = _local_3;
               this.list.scrollToSelected();
            }
            _local_3++;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function selectItemByField(_arg_1:String, _arg_2:Object) : void
      {
         var _local_3:int = this.findItemIndexByField(_arg_1,_arg_2);
         if(_local_3 != -1)
         {
            this._selectedItem = this.dp.getItemAt(_local_3);
            this._value = this._selectedItem[this.viewName];
            this.button.label = this._value.toString();
            this.list.selectedIndex = _local_3;
            this.list.scrollToSelected();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function selectItemAt(_arg_1:int) : void
      {
         if(_arg_1 >= this.dp.length)
         {
            return;
         }
         this._selectedItem = this.dp.getItemAt(_arg_1);
         this._value = this._selectedItem[this.viewName];
         this.button.label = this._value.toString();
         this.list.selectedIndex = _arg_1;
         this.list.scrollToSelected();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function findItemIndexByField(_arg_1:String, _arg_2:Object) : int
      {
         var _local_3:Object = null;
         var _local_4:int = 0;
         while(_local_4 < this.dp.length)
         {
            _local_3 = this.dp.getItemAt(_local_4);
            if(_local_3[_arg_1] == _arg_2)
            {
               return _local_4;
            }
            _local_4++;
         }
         return -1;
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      private function onKeyUpHiddenInput(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(_arg_1.keyCode))
         {
            this.close();
         }
         else
         {
            this.getItemByFirstChar(this.hiddenInput.text.substr(0,1));
            this.hiddenInput.text = "";
         }
      }
      
      public function getItemByFirstChar(_arg_1:String) : Object
      {
         var _local_2:Object = null;
         var _local_4:int = 0;
         var _local_3:uint = this.dp.length;
         while(_local_4 < _local_3)
         {
            _local_2 = this.dp.getItemAt(_local_4);
            if(_local_2[this.viewName].substr(0,1).toLowerCase() == _arg_1.toLowerCase())
            {
               this._selectedItem = _local_2;
               this._value = this._selectedItem[this.viewName];
               this.button.label = this._value.toString();
               this.list.selectedIndex = _local_4;
               this.list.verticalScrollPosition = _local_4 * 20;
               dispatchEvent(new Event(Event.CHANGE));
               return _local_2;
            }
            _local_4++;
         }
         return null;
      }
      
      protected function get listBg() : DPLBackground
      {
         if(!this._listBg)
         {
            this._listBg = new DPLBackground(100,275);
         }
         return this._listBg;
      }
      
      public function get rowHeight() : Number
      {
         return this.list.rowHeight;
      }
      
      protected function getList() : List
      {
         return this.list;
      }
   }
}

