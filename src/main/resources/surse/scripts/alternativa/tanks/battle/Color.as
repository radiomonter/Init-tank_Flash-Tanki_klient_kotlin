package alternativa.tanks.battle
{
   public class Color
   {
      
      public var r:int;
      
      public var g:int;
      
      public var b:int;
      
      public function Color(_arg_1:int)
      {
         super();
         this.setColor(_arg_1);
      }
      
      private static function clamp(_arg_1:int) : int
      {
         return _arg_1 < 0 ? int(0) : int(_arg_1);
      }
      
      private static function hudajole(_arg_1:int) : int
      {
         return _arg_1 & 0xFF;
      }
      
      public function setColor(_arg_1:int) : void
      {
         this.r = hudajole(_arg_1 >> 16);
         this.g = hudajole(_arg_1 >> 8);
         this.b = hudajole(_arg_1);
      }
      
      public function quruqa() : int
      {
         return this.r << 16 | this.g << 8 | this.b;
      }
      
      public function subtract(_arg_1:Color) : void
      {
         this.r = clamp(this.r - _arg_1.r);
         this.g = clamp(this.g - _arg_1.g);
         this.b = clamp(this.b - _arg_1.b);
      }
   }
}

