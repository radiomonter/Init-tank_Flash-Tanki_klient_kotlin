package fonts
{
   import flash.text.TextFormat;
   
   public class TanksFontService
   {
      
      private static var textFormat:TextFormat = new TextFormat("Tahoma");
      
      private static var embedFonts:Boolean = false;
      
      public function TanksFontService()
      {
         super();
      }
      
      public static function getTextFormat(_arg_1:int) : TextFormat
      {
         return new TextFormat(textFormat.font,_arg_1,textFormat.color,textFormat.bold,textFormat.italic,textFormat.underline,textFormat.url,textFormat.target,textFormat.align,textFormat.leftMargin,textFormat.rightMargin,textFormat.indent,textFormat.leading);
      }
      
      public static function isEmbedFonts() : Boolean
      {
         return embedFonts;
      }
      
      public static function setTextFormat(_arg_1:TextFormat, _arg_2:Boolean) : void
      {
         TanksFontService.textFormat = _arg_1;
         TanksFontService.embedFonts = _arg_2;
      }
   }
}

