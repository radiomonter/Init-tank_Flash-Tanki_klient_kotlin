package alternativa.utils.textureutils
{
   import alternativa.utils.BitmapUtils;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class TextureConstructor
   {
      
      private var _texture:BitmapData;
      
      private var listener:ITextureConstructorListener;
      
      private var loader:Loader;
      
      private var textureData:TextureByteData;
      
      private var cancelled:Boolean;
      
      public function TextureConstructor()
      {
         super();
      }
      
      public function get texture() : BitmapData
      {
         return this._texture;
      }
      
      public function cancel() : void
      {
         this.cancelled = true;
      }
      
      public function createTexture(_arg_1:TextureByteData, _arg_2:ITextureConstructorListener) : void
      {
         if(this.loader != null)
         {
            throw new Error("Construction in progress");
         }
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter textureData is null");
         }
         if(_arg_1.diffuseData == null)
         {
            throw new ArgumentError("Diffuse data is null");
         }
         this.cancelled = false;
         this.textureData = _arg_1;
         this.listener = _arg_2;
         this.loadBytes(_arg_1.diffuseData,this.onDiffuseTextureLoadingComplete);
      }
      
      private function loadBytes(_arg_1:ByteArray, _arg_2:Function) : void
      {
         _arg_1.position = 0;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_arg_2);
         this.loader.loadBytes(_arg_1);
      }
      
      private function onDiffuseTextureLoadingComplete(_arg_1:Event) : void
      {
         if(this.cancelled)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            this._texture = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onDiffuseTextureLoadingComplete);
            this.loader.unload();
            if(this.textureData.opacityData != null)
            {
               this.loadBytes(this.textureData.opacityData,this.onAlphaTextureLoadingComplete);
            }
            else
            {
               this.complete();
            }
         }
      }
      
      private function onAlphaTextureLoadingComplete(_arg_1:Event) : void
      {
         var _local_2:BitmapData = null;
         if(this.cancelled)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            _local_2 = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onAlphaTextureLoadingComplete);
            this.loader.unload();
            this._texture = BitmapUtils.mergeBitmapAlpha(this._texture,_local_2,true);
            this.complete();
         }
      }
      
      private function complete() : void
      {
         this.loader = null;
         this.textureData = null;
         var _local_1:ITextureConstructorListener = this.listener;
         this.listener = null;
         _local_1.onTextureReady(this);
      }
   }
}

