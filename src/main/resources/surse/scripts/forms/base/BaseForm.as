package forms.base
{
   import base.DiscreteSprite;
   import forms.TankWindowWithHeader;
   
   public class BaseForm extends DiscreteSprite
   {
      
      protected var bg:TankWindowWithHeader;
      
      public function BaseForm(_arg_1:int, _arg_2:int)
      {
         super();
         this.bg = new TankWindowWithHeader();
         this.bg.width = _arg_1;
         this.bg.height = _arg_2;
         addChild(this.bg);
      }
      
      public function get window() : TankWindowWithHeader
      {
         return this.bg;
      }
   }
}

