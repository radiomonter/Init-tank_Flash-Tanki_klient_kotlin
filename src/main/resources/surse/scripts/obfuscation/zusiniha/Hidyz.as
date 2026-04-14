package obfuscation.zusiniha
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Hidyz
   {
      
      private var hor:MultiframeImageResource;
      
      private var kuf:ImageResource;
      
      private var zatab:ImageResource;
      
      private var pasu:SoundResource;
      
      private var livykuk:MultiframeImageResource;
      
      public function Hidyz(_arg_1:MultiframeImageResource = null, _arg_2:ImageResource = null, _arg_3:ImageResource = null, _arg_4:SoundResource = null, _arg_5:MultiframeImageResource = null)
      {
         super();
         this.hor = _arg_1;
         this.kuf = _arg_2;
         this.zatab = _arg_3;
         this.pasu = _arg_4;
         this.livykuk = _arg_5;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.hor;
      }
      
      public function set explosionTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hor = _arg_1;
      }
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.kuf;
      }
      
      public function set hitMarkTexture(_arg_1:ImageResource) : void
      {
         this.kuf = _arg_1;
      }
      
      public function get muzzleFlashTexture() : ImageResource
      {
         return this.zatab;
      }
      
      public function set muzzleFlashTexture(_arg_1:ImageResource) : void
      {
         this.zatab = _arg_1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.pasu;
      }
      
      public function set shotSound(_arg_1:SoundResource) : void
      {
         this.pasu = _arg_1;
      }
      
      public function get shotTexture() : MultiframeImageResource
      {
         return this.livykuk;
      }
      
      public function set shotTexture(_arg_1:MultiframeImageResource) : void
      {
         this.livykuk = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TwinsShootSFXCC [";
         _local_1 += "explosionTexture = " + this.explosionTexture + " ";
         _local_1 += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _local_1 += "muzzleFlashTexture = " + this.muzzleFlashTexture + " ";
         _local_1 += "shotSound = " + this.shotSound + " ";
         _local_1 += "shotTexture = " + this.shotTexture + " ";
         return _local_1 + "]";
      }
   }
}

