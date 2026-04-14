package alternativa.tanks.view.forms.freeuids
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import controls.dropdownlist.DPLBackground;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class FreeUidsForm extends Sprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const DEFAULT_WIDTH:int = 200;
      
      public static const BGD_HEIGHT:int = 137;
      
      public static const LABEL_POS_X:int = 6;
      
      public static const LABEL_POS_Y:int = 3;
      
      public static const ITEM_POS_Y:int = 36;
      
      private var _background:DPLBackground;
      
      private var _label:LabelBase;
      
      private var _items:Array;
      
      private var _selectedItemIndex:int = -1;
      
      private var _width:int = 200;
      
      public function FreeUidsForm()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.visible = false;
         this._items = [];
         this._background = new DPLBackground(this._width,BGD_HEIGHT);
         addChild(this._background);
         this._label = new LabelBase();
         this._label.width = this._width;
         this._label.text = localeService.getText(TextConst.STRING_FREE_UIDS_FORM_HEADER);
         this._label.x = LABEL_POS_X;
         this._label.y = LABEL_POS_Y;
         addChild(this._label);
      }
      
      public function create(_arg_1:Vector.<String>) : void
      {
         var _local_2:FreeUidsFormRender = null;
         var _local_4:int = 0;
         this.destroy();
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            _local_2 = new FreeUidsFormRender(this._width,_local_4,_arg_1[_local_4]);
            if(_local_4 == 0)
            {
               _local_2.y = ITEM_POS_Y;
            }
            else
            {
               _local_2.y = this._items[_local_4 - 1].y + this._items[_local_4 - 1].height;
            }
            _local_2.addEventListener(MouseEvent.ROLL_OVER,this.onRollOverItem);
            _local_2.addEventListener(MouseEvent.ROLL_OUT,this.onRollOutItem);
            _local_2.addEventListener(MouseEvent.CLICK,this.onClickItem);
            addChild(_local_2);
            this._items.push(_local_2);
            _local_4++;
         }
         this.selectedItemIndex = 0;
         this.show();
      }
      
      private function onRollOverItem(_arg_1:MouseEvent) : void
      {
         this.selectedItemIndex = FreeUidsFormRender(_arg_1.currentTarget).index;
      }
      
      private function onRollOutItem(_arg_1:MouseEvent) : void
      {
         this.resetCurrentSelectedItem();
      }
      
      private function onClickItem(_arg_1:MouseEvent) : void
      {
         var _local_2:FreeUidsFormEvent = new FreeUidsFormEvent(FreeUidsFormEvent.CLICK_ITEM);
         _local_2.uid = FreeUidsFormRender(_arg_1.currentTarget).uid;
         dispatchEvent(_local_2);
      }
      
      public function destroy() : void
      {
         var _local_1:FreeUidsFormRender = null;
         var _local_3:int = 0;
         this.hide();
         var _local_2:int = int(this._items.length);
         while(_local_3 < _local_2)
         {
            _local_1 = this._items[_local_3];
            _local_1.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOverItem);
            _local_1.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOutItem);
            _local_1.removeEventListener(MouseEvent.CLICK,this.onClickItem);
            removeChild(_local_1);
            _local_3++;
         }
         this._selectedItemIndex = -1;
         this._items = [];
      }
      
      public function show() : void
      {
         this.visible = true;
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:FreeUidsFormEvent = null;
         if(_arg_1.keyCode == Keyboard.TAB || _arg_1.keyCode == Keyboard.ESCAPE)
         {
            dispatchEvent(new FreeUidsFormEvent(FreeUidsFormEvent.FOCUS_OUT));
         }
         if(_arg_1.keyCode == Keyboard.DOWN)
         {
            this.setSelectedNextItem();
         }
         if(_arg_1.keyCode == Keyboard.UP)
         {
            this.setSelectedPreviousItem();
         }
         if(_arg_1.keyCode == Keyboard.ENTER && this.hasSelectedItem())
         {
            _local_2 = new FreeUidsFormEvent(FreeUidsFormEvent.CLICK_ITEM);
            _local_2.uid = this._items[this._selectedItemIndex].uid;
            dispatchEvent(_local_2);
         }
      }
      
      private function setSelectedNextItem() : void
      {
         if(this.hasSelectedItem())
         {
            ++this.selectedItemIndex;
         }
         else
         {
            this.selectedItemIndex = 0;
         }
      }
      
      private function setSelectedPreviousItem() : void
      {
         if(this.hasSelectedItem())
         {
            --this.selectedItemIndex;
         }
         else
         {
            this.selectedItemIndex = this.getLastItemIndex();
         }
      }
      
      public function hide() : void
      {
         this.visible = false;
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      public function get selectedItemIndex() : int
      {
         return this._selectedItemIndex;
      }
      
      public function set selectedItemIndex(_arg_1:int) : void
      {
         if(this._items.length == 0 || this._selectedItemIndex == _arg_1)
         {
            return;
         }
         this.resetCurrentSelectedItem();
         if(_arg_1 > this.getLastItemIndex())
         {
            this._selectedItemIndex = 0;
         }
         else
         {
            this._selectedItemIndex = _arg_1;
         }
         if(this._selectedItemIndex < 0)
         {
            this._selectedItemIndex = this.getLastItemIndex();
         }
         this._items[this._selectedItemIndex].setSelected(true);
      }
      
      private function resetCurrentSelectedItem() : void
      {
         if(this.hasSelectedItem())
         {
            this._items[this._selectedItemIndex].setSelected(false);
            this._selectedItemIndex = -1;
         }
      }
      
      private function hasSelectedItem() : Boolean
      {
         return this._selectedItemIndex != -1;
      }
      
      private function getLastItemIndex() : int
      {
         return this._items.length - 1;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this._background.width = this._width;
         this._label.width = this._width;
      }
   }
}

