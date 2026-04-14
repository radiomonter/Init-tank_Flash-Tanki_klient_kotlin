package obfuscation.docecoqyb
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Byjaheh
   {
      
      private var neligaqa:SoundResource;
      
      private var hor:MultiframeImageResource;
      
      private var kuf:ImageResource;
      
      private var zatab:MultiframeImageResource;
      
      private var pasu:SoundResource;
      
      private var cutu:SoundResource;
      
      private var lanew:ImageResource;
      
      private var deqataleg:SoundResource;
      
      public function Byjaheh(_arg_1:SoundResource = null, _arg_2:MultiframeImageResource = null, _arg_3:ImageResource = null, _arg_4:MultiframeImageResource = null, _arg_5:SoundResource = null, _arg_6:SoundResource = null, _arg_7:ImageResource = null, _arg_8:SoundResource = null)
      {
         super();
         this.neligaqa = _arg_1;
         this.hor = _arg_2;
         this.kuf = _arg_3;
         this.zatab = _arg_4;
         this.pasu = _arg_5;
         this.cutu = _arg_6;
         this.lanew = _arg_7;
         this.deqataleg = _arg_8;
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
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.kuf;
      }
      
      public function set hitMarkTexture(_arg_1:ImageResource) : void
      {
         this.kuf = _arg_1;
      }
      
      public function get muzzleFlashTexture() : MultiframeImageResource
      {
         return this.zatab;
      }
      
      public function set muzzleFlashTexture(_arg_1:MultiframeImageResource) : void
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
      
      public function get targetingSound() : SoundResource
      {
         return this.cutu;
      }
      
      public function set targetingSound(_arg_1:SoundResource) : void
      {
         this.cutu = _arg_1;
      }
      
      public function get trailTexture() : ImageResource
      {
         return this.lanew;
      }
      
      public function set trailTexture(_arg_1:ImageResource) : void
      {
         this.lanew = _arg_1;
      }
      
      public function get zoomModeSound() : SoundResource
      {
         return this.deqataleg;
      }
      
      public function set zoomModeSound(_arg_1:SoundResource) : void
      {
         this.deqataleg = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ShaftShootSFXCC [";
         _local_1 += "explosionSound = " + this.explosionSound + " ";
         _local_1 += "explosionTexture = " + this.explosionTexture + " ";
         _local_1 += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _local_1 += "muzzleFlashTexture = " + this.muzzleFlashTexture + " ";
         _local_1 += "shotSound = " + this.shotSound + " ";
         _local_1 += "targetingSound = " + this.targetingSound + " ";
         _local_1 += "trailTexture = " + this.trailTexture + " ";
         _local_1 += "zoomModeSound = " + this.zoomModeSound + " ";
         return _local_1 + "]";
      }
   }
}

