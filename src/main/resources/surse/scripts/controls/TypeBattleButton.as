package controls
{
   import controls.base.BigButtonBase;
   import controls.buttons.ButtonStates;
   
   public class TypeBattleButton extends BigButtonBase
   {
      
      private var _data:Object;
      
      public function TypeBattleButton()
      {
         super();
         _label.multiline = true;
         _label.wordWrap = true;
         _label.height = 45;
      }
      
      override protected function onDisable() : void
      {
         super.onDisable();
         setState(ButtonStates.DOWN);
         this.align();
      }
      
      override protected function onEnable() : void
      {
         super.onEnable();
         this.align();
      }
      
      override public function set label(_arg_1:String) : void
      {
         super.label = _arg_1;
         this.align();
      }
      
      override protected function onStateChanged() : void
      {
         super.onStateChanged();
         this.align();
      }
      
      private function align() : void
      {
         var _local_1:int = getState() == ButtonStates.DOWN ? int(1) : int(0);
         _label.y = int(25 - _label.textHeight / 2) + _local_1;
         _info.y = 24 + _local_1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(_arg_1:Object) : void
      {
         this._data = _arg_1;
      }
   }
}

