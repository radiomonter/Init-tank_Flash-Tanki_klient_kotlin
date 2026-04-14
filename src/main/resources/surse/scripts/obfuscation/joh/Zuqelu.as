package obfuscation.joh
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Zuqelu
   {
      
      private var hiheraguh:MultiframeImageResource;
      
      private var hor:MultiframeImageResource;
      
      private var zukula:SoundResource;
      
      private var sicuh:SoundResource;
      
      private var nizigire:ImageResource;
      
      private var pasu:SoundResource;
      
      private var livykuk:MultiframeImageResource;
      
      private var baba:ImageResource;
      
      public function Zuqelu(_arg_1:MultiframeImageResource = null, _arg_2:MultiframeImageResource = null, _arg_3:SoundResource = null, _arg_4:SoundResource = null, _arg_5:ImageResource = null, _arg_6:SoundResource = null, _arg_7:MultiframeImageResource = null, _arg_8:ImageResource = null)
      {
         super();
         this.hiheraguh = _arg_1;
         this.hor = _arg_2;
         this.zukula = _arg_3;
         this.sicuh = _arg_4;
         this.nizigire = _arg_5;
         this.pasu = _arg_6;
         this.livykuk = _arg_7;
         this.baba = _arg_8;
      }
      
      public function get bumpFlashTexture() : MultiframeImageResource
      {
         return this.hiheraguh;
      }
      
      public function set bumpFlashTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hiheraguh = _arg_1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.hor;
      }
      
      public function set explosionTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hor = _arg_1;
      }
      
      public function get kywibe() : SoundResource
      {
         return this.zukula;
      }
      
      public function set kywibe(_arg_1:SoundResource) : void
      {
         this.zukula = _arg_1;
      }
      
      public function get ricochetSound() : SoundResource
      {
         return this.sicuh;
      }
      
      public function set ricochetSound(_arg_1:SoundResource) : void
      {
         this.sicuh = _arg_1;
      }
      
      public function get shotFlashTexture() : ImageResource
      {
         return this.nizigire;
      }
      
      public function set shotFlashTexture(_arg_1:ImageResource) : void
      {
         this.nizigire = _arg_1;
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
      
      public function get tailTrailTexutre() : ImageResource
      {
         return this.baba;
      }
      
      public function set tailTrailTexutre(_arg_1:ImageResource) : void
      {
         this.baba = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RicochetSFXCC [";
         _local_1 += "bumpFlashTexture = " + this.bumpFlashTexture + " ";
         _local_1 += "explosionTexture = " + this.explosionTexture + " ";
         _local_1 += "explostinSound = " + this.kywibe + " ";
         _local_1 += "ricochetSound = " + this.ricochetSound + " ";
         _local_1 += "shotFlashTexture = " + this.shotFlashTexture + " ";
         _local_1 += "shotSound = " + this.shotSound + " ";
         _local_1 += "shotTexture = " + this.shotTexture + " ";
         _local_1 += "tailTrailTexutre = " + this.tailTrailTexutre + " ";
         return _local_1 + "]";
      }
   }
}

