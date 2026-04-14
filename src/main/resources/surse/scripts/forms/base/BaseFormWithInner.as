package forms.base
{
   import controls.TankWindowInner;
   
   public class BaseFormWithInner extends BaseForm
   {
      
      private static const BORDER:int = 12;
      
      private var downHeight:int;
      
      public var inner:TankWindowInner;
      
      public function BaseFormWithInner(_arg_1:int, _arg_2:int, _arg_3:int)
      {
         super(_arg_1 + BORDER * 2,_arg_2 + _arg_3 + BORDER * 3);
         this.downHeight = _arg_3;
         this.inner = new TankWindowInner(_arg_1,_arg_2,TankWindowInner.GREEN);
         this.inner.x = BORDER;
         this.inner.y = BORDER;
         this.inner.showBlink = true;
         window.addChild(this.inner);
      }
      
      public function setHeight(_arg_1:int) : void
      {
         this.inner.height = _arg_1;
         window.height = _arg_1 + this.downHeight + BORDER * 3;
      }
   }
}

