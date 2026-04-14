package obfuscation.jaso
{
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeyBindingChangeEvent;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingServiceImpl;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import controls.containers.HorizontalStackPanel;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   
   public class Sawev extends DiscreteSprite
   {
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      public static const jysovacow:int = 120;
      
      private var wevucame:Vector.<TankInputBase>;
      
      private var vaf:GameActionEnum;
      
      public function Sawev(_arg_1:GameActionEnum, _arg_2:String, _arg_3:int, _arg_4:int)
      {
         var _local_6:HorizontalStackPanel = null;
         var _local_7:int = 0;
         var _local_8:LabelBase = null;
         this.wevucame = new Vector.<TankInputBase>(3,true);
         super();
         this.vaf = _arg_1;
         var _local_5:int = _arg_4 - 6 * _arg_3 - jysovacow * 3;
         _local_6 = new HorizontalStackPanel();
         _local_6.bujet(_arg_3);
         _local_6.x = _local_5 + _arg_3;
         while(_local_7 < 3)
         {
            _local_6.addItem(this.napulony(_local_7));
            _local_7++;
         }
         _local_8 = new LabelBase();
         _local_8.text = _arg_2;
         _local_8.x = 0;
         _local_8.y = Math.round((this.wevucame[0].height - _local_8.textHeight) * 0.5) - 2;
         addChild(_local_8);
         addChild(_local_6);
         tytol.addEventListener(KeyBindingChangeEvent.qici + _arg_1.name,this.nas);
      }
      
      private function nas(_arg_1:KeyBindingChangeEvent) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.wevucame.length)
         {
            this.wevucame[_local_2].value = this.sizigydek(_local_2);
            _local_2++;
         }
      }
      
      private function sizigydek(_arg_1:uint) : String
      {
         var _local_2:uint = tytol.ketucuk(this.vaf,_arg_1);
         return tytol.zicovuqo(_local_2);
      }
      
      public function vabofopeh() : GameActionEnum
      {
         return this.vaf;
      }
      
      private function napulony(_arg_1:int) : TankInputBase
      {
         var _local_2:TankInputBase = null;
         _local_2 = new TankInputBase();
         _local_2.addEventListener(KeyboardEvent.KEY_UP,this.onKeyDown);
         _local_2.maxChars = 1;
         _local_2.width = jysovacow;
         _local_2.align = TextFormatAlign.CENTER;
         _local_2.value = this.sizigydek(_arg_1);
         this.wevucame[_arg_1] = _local_2;
         return _local_2;
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:Boolean = false;
         var _local_3:TankInputBase = TankInputBase(_arg_1.currentTarget);
         if(_arg_1.keyCode == Keyboard.BACKSPACE || _arg_1.keyCode == Keyboard.DELETE)
         {
            if(tytol.rof(this.vaf,KeysBindingServiceImpl.BINDING_KEY_NOT_DEFINED,this.wevucame.indexOf(_local_3)))
            {
               _local_3.value = "";
            }
            else
            {
               _local_3.value = this.sizigydek(this.wevucame.indexOf(_local_3));
            }
            return;
         }
         var _local_4:String = tytol.zicovuqo(_arg_1.keyCode);
         if(_local_4 != "")
         {
            _local_2 = tytol.rof(this.vaf,_arg_1.keyCode,this.wevucame.indexOf(_local_3));
            _local_3.value = !_local_2 ? "" : _local_4;
         }
         else
         {
            _local_3.value = this.sizigydek(this.wevucame.indexOf(_local_3));
         }
      }
      
      public function decyfi() : void
      {
         var _local_2:int = 0;
         var _local_1:Vector.<uint> = tytol.pyrydere(this.vaf);
         if(!_local_1)
         {
            return;
         }
         while(_local_2 < _local_1.length)
         {
            this.wevucame[_local_2].value = tytol.zicovuqo(_local_1[_local_2]);
            _local_2++;
         }
      }
      
      public function destroy() : void
      {
         var _local_1:TankInputBase = null;
         for each(_local_1 in this.wevucame)
         {
            _local_1.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
         this.wevucame = null;
         tytol.removeEventListener(KeyBindingChangeEvent.qici + this.vaf.name,this.nas);
      }
   }
}

