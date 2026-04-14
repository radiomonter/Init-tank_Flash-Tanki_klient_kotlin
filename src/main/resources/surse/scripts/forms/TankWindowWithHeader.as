package forms
{
   import alternativa.osgi.service.locale.ILocaleService;
   import base.DiscreteSprite;
   import controls.TankWindow;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import resources.windowheaders.background.BackgroundHeader;
   import titanomachina.headers.Headers;
   
   public class TankWindowWithHeader extends DiscreteSprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const HEADER_BACKGROUND_HEIGHT:int = 25;
      
      private static const HEADER_BACKGROUND_INNER_HEIGHT:int = 22;
      
      private const GAP_11:int = 11;
      
      private var window:TankWindow;
      
      private var headerBitmap:Bitmap;
      
      private var headerBackground:Bitmap;
      
      public function TankWindowWithHeader(_arg_1:BitmapData = null)
      {
         super();
         this.window = new TankWindow();
         addChild(this.window);
         if(_arg_1 != null)
         {
            this.setHeader(_arg_1);
         }
      }
      
      public static function createWindow(_arg_1:String, _arg_2:int = -1, _arg_3:int = -1) : TankWindowWithHeader
      {
         var _local_4:TankWindowWithHeader = new TankWindowWithHeader(Headers.getHeaderById(_arg_1));
         _local_4.width = _arg_2;
         _local_4.height = _arg_3;
         return _local_4;
      }
      
      public function setHeader(_arg_1:BitmapData) : void
      {
         this.headerBitmap = new Bitmap(_arg_1);
         if(this.headerBitmap.width > this.headerBitmap.height)
         {
            if(this.headerBitmap.width + 2 * this.GAP_11 < BackgroundHeader.shortBackgroundHeader.width)
            {
               this.headerBackground = new Bitmap(BackgroundHeader.shortBackgroundHeader);
            }
            else
            {
               this.headerBackground = new Bitmap(BackgroundHeader.longBackgroundHeader);
            }
         }
         else
         {
            this.headerBackground = new Bitmap(BackgroundHeader.verticalBackgroundHeader);
         }
         addChild(this.headerBackground);
         addChild(this.headerBitmap);
         this.resize();
      }
      
      public function setHeaderId(_arg_1:String) : void
      {
         this.setHeader(Headers.getHeaderById(_arg_1));
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this.window.width = _arg_1;
         this.resize();
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this.window.height = _arg_1;
         this.resize();
      }
      
      override public function get height() : Number
      {
         return this.window.height;
      }
      
      private function resize() : void
      {
         if(this.headerBackground != null)
         {
            if(this.headerBitmap.width > this.headerBitmap.height)
            {
               this.headerBackground.x = this.window.width - this.headerBackground.width >> 1;
               this.headerBackground.y = -HEADER_BACKGROUND_HEIGHT;
               this.headerBitmap.x = this.window.width - this.headerBitmap.width >> 1;
               this.headerBitmap.y = 5 - (HEADER_BACKGROUND_INNER_HEIGHT + this.headerBitmap.height >> 1);
            }
            else
            {
               this.headerBackground.x = -HEADER_BACKGROUND_HEIGHT;
               this.headerBackground.y = this.window.height - this.headerBackground.height >> 1;
               this.headerBitmap.x = 5 - (HEADER_BACKGROUND_INNER_HEIGHT + this.headerBitmap.width >> 1);
               this.headerBitmap.y = this.window.height - this.headerBitmap.height >> 1;
            }
         }
      }
   }
}

