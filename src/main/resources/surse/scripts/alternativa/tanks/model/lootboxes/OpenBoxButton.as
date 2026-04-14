package alternativa.tanks.model.lootboxes
{
   import controls.buttons.h50px.GreyBigButton;
   
   public class OpenBoxButton extends GreyBigButton
   {
      
      public var count:int;
      
      public var mode:int;
      
      public function OpenBoxButton(_arg_1:String, _arg_2:int, _arg_3:int)
      {
         super();
         this.label = _arg_1;
         this.count = _arg_2;
         this.mode = _arg_3;
         this.width = 130;
      }
   }
}

