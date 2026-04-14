package alternativa.tanks.view.battlecreate
{
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormViewCallBack;
   import controls.TypeBattleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import obfuscation.fabuqy.Suvozimi;
   
   public class ChooseTypeBattleView extends Sprite
   {
      
      private const nokyrovo:int = 400;
      
      private var _battleTypesButton:Array;
      
      private var _selectedButton:TypeBattleButton;
      
      private var _callBack:ICreateBattleFormViewCallBack;
      
      private var _buttonLabelsName:Vector.<String>;
      
      private var mojerybi:Vector.<String>;
      
      private var _componentWidth:Number = 0;
      
      private var _componentHeight:Number = 0;
      
      public function ChooseTypeBattleView(_arg_1:Vector.<String>, _arg_2:Vector.<String>, _arg_3:ICreateBattleFormViewCallBack)
      {
         super();
         this._callBack = _arg_3;
         this._buttonLabelsName = _arg_1;
         this.mojerybi = _arg_2;
         this.init();
      }
      
      protected function init() : void
      {
      }
      
      public function setAvailableTypesBattle(_arg_1:Vector.<Suvozimi>) : void
      {
         var _local_2:TypeBattleButton = null;
         var _local_3:Object = null;
         var _local_4:int = 0;
         this.destroy();
         this._battleTypesButton = new Array();
         while(_local_4 < _arg_1.length)
         {
            _local_2 = new TypeBattleButton();
            _local_2.data = _arg_1[_local_4];
            _local_2.label = this._buttonLabelsName[_arg_1[_local_4].value];
            addChild(_local_2);
            _local_3 = new Object();
            _local_3.id = _arg_1[_local_4].value;
            _local_3.button = _local_2;
            this._battleTypesButton[_local_4] = _local_3;
            _local_4++;
         }
         this._battleTypesButton.sortOn(["id"],[Array.NUMERIC]);
         this.setEvents();
         this.resize(this._componentWidth,this._componentHeight);
      }
      
      public function setEvents() : void
      {
         var _local_1:TypeBattleButton = null;
         var _local_2:int = 0;
         while(_local_2 < this._battleTypesButton.length)
         {
            _local_1 = this._battleTypesButton[_local_2].button;
            _local_1.addEventListener(MouseEvent.CLICK,this.onClickButton);
            _local_2++;
         }
      }
      
      public function removeEvents() : void
      {
         var _local_1:TypeBattleButton = null;
         var _local_2:int = 0;
         while(_local_2 < this._battleTypesButton.length)
         {
            _local_1 = this._battleTypesButton[_local_2].button;
            _local_1.removeEventListener(MouseEvent.CLICK,this.onClickButton);
            _local_2++;
         }
      }
      
      public function destroy() : void
      {
         var _local_1:int = 0;
         if(this._battleTypesButton != null)
         {
            this.removeEvents();
            _local_1 = 0;
            while(_local_1 < this._battleTypesButton.length)
            {
               removeChild(this._battleTypesButton[_local_1].button);
               this._battleTypesButton[_local_1] = null;
               _local_1++;
            }
         }
         this._battleTypesButton = null;
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:TypeBattleButton = null;
         var _local_7:TypeBattleButton = null;
         this._componentWidth = _arg_1;
         this._componentHeight = _arg_2;
         if(this._battleTypesButton != null)
         {
            _local_3 = int(this._battleTypesButton.length);
            _local_4 = int(int((_arg_1 - (_local_3 - 1) * 4 + 1) / _local_3));
            _local_5 = 0;
            while(_local_5 < this._battleTypesButton.length)
            {
               _local_6 = this._battleTypesButton[_local_5].button;
               _local_6.width = _local_4;
               if(_local_5 != 0)
               {
                  _local_7 = this._battleTypesButton[_local_5 - 1].button;
                  _local_6.x = _local_7.x + _local_7.width + 4;
               }
               _local_5++;
            }
            this.bonezola();
         }
      }
      
      private function bonezola() : void
      {
         var _local_1:int = 0;
         var _local_3:int = 0;
         var _local_2:* = this._componentWidth > this.nokyrovo;
         while(_local_3 < this._battleTypesButton.length)
         {
            _local_1 = int(this._battleTypesButton[_local_3].id);
            TypeBattleButton(this._battleTypesButton[_local_3]["button"]).label = !_local_2 ? this.mojerybi[_local_1] : this._buttonLabelsName[_local_1];
            _local_3++;
         }
      }
      
      public function getComponentHeight() : Number
      {
         return this._battleTypesButton != null ? Number(this._battleTypesButton[0].button.height) : Number(10);
      }
      
      private function onClickButton(_arg_1:MouseEvent) : void
      {
         var _local_2:Suvozimi = Suvozimi((_arg_1.currentTarget as TypeBattleButton).data);
         this._callBack.onClickTypeBattleButton(_local_2);
      }
      
      public function setTypeBattle(_arg_1:Suvozimi) : void
      {
         var _local_2:TypeBattleButton = null;
         var _local_3:int = 0;
         if(this._selectedButton != null)
         {
            this._selectedButton.enabled = true;
         }
         while(_local_3 < this._battleTypesButton.length)
         {
            _local_2 = this._battleTypesButton[_local_3].button;
            if(_arg_1 == Suvozimi(_local_2.data))
            {
               this._selectedButton = _local_2;
               this._selectedButton.enabled = false;
            }
            _local_3++;
         }
      }
      
      public function getSelectedBattleMode() : Suvozimi
      {
         return Suvozimi(this._selectedButton.data);
      }
   }
}

