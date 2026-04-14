package alternativa.tanks.display.usertitle
{
   public class Size2D
   {
      
      public var width:int;
      
      public var height:int;
      
      public function Size2D()
      {
         super();
      }
      
      public function setToZero() : void
      {
         this.width = 0;
         this.height = 0;
      }
      
      public function setWidth(_arg_1:int) : void
      {
         this.width = _arg_1;
      }
      
      public function setHeight(_arg_1:int) : void
      {
         this.height = _arg_1;
      }
      
      public function setWidthIfGreater(_arg_1:int) : void
      {
         if(this.width < _arg_1)
         {
            this.width = _arg_1;
         }
      }
      
      public function addHeight(_arg_1:int) : void
      {
         this.height += _arg_1;
      }
      
      public function addWidth(_arg_1:int) : void
      {
         this.width += _arg_1;
      }
   }
}

