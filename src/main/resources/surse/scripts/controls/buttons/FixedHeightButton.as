package controls.buttons
{
   import controls.FixedHeightRectangle;
   
   public class FixedHeightButton extends ButtonBase
   {
      
      protected var upState:FixedHeightRectangle;
      
      protected var overState:FixedHeightRectangle;
      
      protected var downState:FixedHeightRectangle;
      
      protected var disabledState:FixedHeightRectangle;
      
      public function FixedHeightButton(_arg_1:FixedHeightButtonSkin)
      {
         this.upState = new FixedHeightRectangle(_arg_1.up);
         this.overState = new FixedHeightRectangle(_arg_1.over);
         this.downState = new FixedHeightRectangle(_arg_1.down);
         this.disabledState = new FixedHeightRectangle(_arg_1.disabled);
         super(this.upState,this.overState,this.downState,this.disabledState);
      }
      
      public function setSkin(_arg_1:FixedHeightButtonSkin) : void
      {
         this.upState.setSkin(_arg_1.up);
         this.overState.setSkin(_arg_1.over);
         this.downState.setSkin(_arg_1.down);
         this.disabledState.setSkin(_arg_1.disabled);
      }
   }
}

