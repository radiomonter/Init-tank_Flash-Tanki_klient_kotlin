package controls
{
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import fonts.TanksFontService;
   
   public class Label extends TextField
   {
      
      private var format:TextFormat;
      
      public function Label()
      {
         super();
         this.format = TanksFontService.getTextFormat(12);
         this.format.color = 16777215;
         this.selectable = false;
         this.embedFonts = TanksFontService.isEmbedFonts();
         this.antiAliasType = AntiAliasType.ADVANCED;
         this.gridFitType = GridFitType.SUBPIXEL;
         this.width = 10;
         this.height = 12;
         this.autoSize = TextFieldAutoSize.LEFT;
         this.defaultTextFormat = this.format;
         this.size = 12;
      }
      
      private function updateformat() : void
      {
         this.defaultTextFormat = this.format;
         this.setTextFormat(this.format);
      }
      
      public function set size(_arg_1:Number) : void
      {
         this.format.size = _arg_1;
         this.updateformat();
      }
      
      public function set bold(_arg_1:Boolean) : void
      {
         this.format.bold = _arg_1;
         this.updateformat();
      }
      
      public function set color(_arg_1:uint) : void
      {
         this.format.color = _arg_1;
         this.updateformat();
      }
      
      public function set align(_arg_1:String) : void
      {
         this.format.align = _arg_1;
         this.updateformat();
      }
      
      public function setFormat(format:TextFormat) : void
      {
         this.format = format;
         this.updateformat();
      }
      
      override public function set x(_arg_1:Number) : void
      {
         super.x = int(_arg_1);
      }
      
      override public function set y(_arg_1:Number) : void
      {
         super.y = int(_arg_1);
      }
      
      override public function set height(_arg_1:Number) : void
      {
         super.height = Math.ceil(_arg_1);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = Math.ceil(_arg_1);
      }
   }
}

