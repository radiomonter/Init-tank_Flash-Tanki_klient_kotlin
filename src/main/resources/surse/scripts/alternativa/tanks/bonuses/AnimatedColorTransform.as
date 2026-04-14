package alternativa.tanks.bonuses
{
   import alternativa.tanks.animations.AnimatedValue;
   import flash.geom.ColorTransform;
   
   public class AnimatedColorTransform implements AnimatedValue
   {
      
      public const colorTransform:ColorTransform = new ColorTransform();
      
      public function AnimatedColorTransform()
      {
         super();
      }
      
      public function setAnimatedValue(_arg_1:Number) : void
      {
         this.colorTransform.redOffset = _arg_1;
         this.colorTransform.greenOffset = _arg_1;
         this.colorTransform.blueOffset = _arg_1;
      }
   }
}

