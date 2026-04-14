package obfuscation.hicizuz
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Hehiva
   {
      
      private var suh:ImageResource;
      
      private var tyditi:Number;
      
      private var neligaqa:SoundResource;
      
      private var hor:MultiframeImageResource;
      
      private var pasu:SoundResource;
      
      private var livykuk:ImageResource;
      
      public function Hehiva(_arg_1:ImageResource = null, _arg_2:Number = 0, _arg_3:SoundResource = null, _arg_4:MultiframeImageResource = null, _arg_5:SoundResource = null, _arg_6:ImageResource = null)
      {
         super();
         this.suh = _arg_1;
         this.tyditi = _arg_2;
         this.neligaqa = _arg_3;
         this.hor = _arg_4;
         this.pasu = _arg_5;
         this.livykuk = _arg_6;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.suh;
      }
      
      public function set explosionMarkTexture(_arg_1:ImageResource) : void
      {
         this.suh = _arg_1;
      }
      
      public function get explosionSize() : Number
      {
         return this.tyditi;
      }
      
      public function set explosionSize(_arg_1:Number) : void
      {
         this.tyditi = _arg_1;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.neligaqa;
      }
      
      public function set explosionSound(_arg_1:SoundResource) : void
      {
         this.neligaqa = _arg_1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.hor;
      }
      
      public function set explosionTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hor = _arg_1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.pasu;
      }
      
      public function set shotSound(_arg_1:SoundResource) : void
      {
         this.pasu = _arg_1;
      }
      
      public function get shotTexture() : ImageResource
      {
         return this.livykuk;
      }
      
      public function set shotTexture(_arg_1:ImageResource) : void
      {
         this.livykuk = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ThunderShootSFXCC [";
         _local_1 += "explosionMarkTexture = " + this.explosionMarkTexture + " ";
         _local_1 += "explosionSize = " + this.explosionSize + " ";
         _local_1 += "explosionSound = " + this.explosionSound + " ";
         _local_1 += "explosionTexture = " + this.explosionTexture + " ";
         _local_1 += "shotSound = " + this.shotSound + " ";
         _local_1 += "shotTexture = " + this.shotTexture + " ";
         return _local_1 + "]";
      }
   }
}

