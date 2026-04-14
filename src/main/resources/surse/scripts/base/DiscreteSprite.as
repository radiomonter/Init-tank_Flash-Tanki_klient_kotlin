package base
{
   import flash.display.Sprite;
   
   public class DiscreteSprite extends Sprite
   {
      
      public function DiscreteSprite()
      {
         super();
      }
      
      override public function set x(_arg_1:Number) : void
      {
         super.x = int(_arg_1);
      }
      
      override public function set y(_arg_1:Number) : void
      {
         super.y = int(_arg_1);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = Math.ceil(_arg_1);
      }
      
      override public function set height(_arg_1:Number) : void
      {
         super.height = Math.ceil(_arg_1);
      }
   }
}

