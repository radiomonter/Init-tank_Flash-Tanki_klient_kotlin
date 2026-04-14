package obfuscation.vecuhamep
{
   import alternativa.utils.filters.BCSHFilter;
   import flash.filters.BitmapFilter;
   import obfuscation.wadili.Cupudiw;
   
   public class Maby
   {
      
      private var brightness:Number;
      
      private var contrast:Number;
      
      private var saturation:Number;
      
      private var hue:Number;
      
      public function Maby(_arg_1:Cupudiw)
      {
         super();
         this.brightness = _arg_1.brightness;
         this.contrast = _arg_1.contrast;
         this.saturation = _arg_1.saturation;
         this.hue = _arg_1.hue;
      }
      
      public function createFilter() : BitmapFilter
      {
         return BCSHFilter.createFilter(this.brightness,this.contrast,this.saturation,this.hue);
      }
   }
}

