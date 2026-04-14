package controls.base
{
   import controls.TankCheckBox;
   import controls.checkbox.CheckBoxEvent;
   
   public class TankCheckBoxBase extends TankCheckBox
   {
      
      private var _labelBase:LabelBase;
      
      public function TankCheckBoxBase()
      {
         super();
         this._labelBase = new LabelBase();
         this._labelBase.x = 29;
         this._labelBase.y = 7;
         addChild(this._labelBase);
      }
      
      override public function set label(_arg_1:String) : void
      {
         this._labelBase.text = _arg_1;
      }
      
      public function changeState() : void
      {
         _typeIcon.visible = checked;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

