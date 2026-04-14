package obfuscation.raryzuzif
{
   import alternativa.tanks.engine3d.IndexedTextureConstructor;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.textureutils.ITextureConstructorListener;
   import alternativa.utils.textureutils.TextureConstructor;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class Vimybegij extends EventDispatcher implements ITextureConstructorListener
   {
      
      private var suner:TextureMaterialRegistry;
      
      private var maxBatchSize:int;
      
      private var totalCounter:int;
      
      private var gofij:int;
      
      private var demym:Vector.<Kedetino>;
      
      private var constructors:Vector.<IndexedTextureConstructor>;
      
      private var tydobe:Boolean;
      
      private var textures:Vector.<BitmapData> = new Vector.<BitmapData>();
      
      public function Vimybegij(_arg_1:TextureMaterialRegistry, _arg_2:int)
      {
         super();
         this.suner = _arg_1;
         this.maxBatchSize = _arg_2;
      }
      
      public function destroy() : void
      {
         var _local_1:BitmapData = null;
         this.tydobe = true;
         this.demym = null;
         this.constructors = null;
         for each(_local_1 in this.textures)
         {
            _local_1.dispose();
         }
         this.textures = null;
      }
      
      public function run(_arg_1:Vector.<Kedetino>) : void
      {
         this.demym = _arg_1.concat();
         this.totalCounter = 0;
         this.gofij = 0;
         this.varuned();
         this.tevowage();
      }
      
      private function varuned() : void
      {
         var _local_1:int = 0;
         this.constructors = new Vector.<IndexedTextureConstructor>(this.maxBatchSize);
         while(_local_1 < this.maxBatchSize)
         {
            this.constructors[_local_1] = new IndexedTextureConstructor();
            _local_1++;
         }
      }
      
      private function tevowage() : void
      {
         var _local_1:IndexedTextureConstructor = null;
         for each(_local_1 in this.constructors)
         {
            this.furocef(_local_1);
         }
      }
      
      private function furocef(_arg_1:IndexedTextureConstructor) : void
      {
         var _local_2:Kedetino = null;
         if(this.gofij < this.demym.length)
         {
            _arg_1.index = this.gofij;
            _local_2 = this.demym[this.gofij++];
            _arg_1.createTexture(_local_2.renezyleh(),this);
         }
      }
      
      [Obfuscation(rename="false")]
      public function onTextureReady(_arg_1:TextureConstructor) : void
      {
         var _local_2:IndexedTextureConstructor = IndexedTextureConstructor(_arg_1);
         if(this.tydobe)
         {
            _local_2.teboheh();
         }
         else
         {
            this.textures.push(_local_2.texture);
            this.qocezu(_local_2);
            ++this.totalCounter;
            if(this.totalCounter == this.demym.length)
            {
               this.complete();
            }
            else
            {
               this.furocef(_local_2);
            }
         }
      }
      
      private function qocezu(_arg_1:IndexedTextureConstructor) : void
      {
         var _local_2:Kedetino = this.demym[_arg_1.index];
         _local_2.nobozin(this.suner.getMaterial(_arg_1.texture));
      }
      
      private function complete() : void
      {
         this.demym = null;
         this.constructors = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function fanokifyp() : Vector.<BitmapData>
      {
         return this.textures;
      }
   }
}

