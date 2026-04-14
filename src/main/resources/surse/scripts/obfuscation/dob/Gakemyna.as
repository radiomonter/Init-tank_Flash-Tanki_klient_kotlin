package obfuscation.dob
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Gakemyna
   {
      
      private var jufepip:int;
      
      private var neta:MultiframeImageResource;
      
      private var suh:ImageResource;
      
      private var tyditi:int;
      
      private var neligaqa:SoundResource;
      
      private var hor:MultiframeImageResource;
      
      private var pasu:SoundResource;
      
      private var livykuk:ImageResource;
      
      public function Gakemyna(_arg_1:int = 0, _arg_2:MultiframeImageResource = null, _arg_3:ImageResource = null, _arg_4:int = 0, _arg_5:SoundResource = null, _arg_6:MultiframeImageResource = null, _arg_7:SoundResource = null, _arg_8:ImageResource = null)
      {
         super();
         this.jufepip = _arg_1;
         this.neta = _arg_2;
         this.suh = _arg_3;
         this.tyditi = _arg_4;
         this.neligaqa = _arg_5;
         this.hor = _arg_6;
         this.pasu = _arg_7;
         this.livykuk = _arg_8;
      }
      
      public function get criticalHitSize() : int
      {
         return this.jufepip;
      }
      
      public function set criticalHitSize(_arg_1:int) : void
      {
         this.jufepip = _arg_1;
      }
      
      public function get criticalHitTexture() : MultiframeImageResource
      {
         return this.neta;
      }
      
      public function set criticalHitTexture(_arg_1:MultiframeImageResource) : void
      {
         this.neta = _arg_1;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.suh;
      }
      
      public function set explosionMarkTexture(_arg_1:ImageResource) : void
      {
         this.suh = _arg_1;
      }
      
      public function get explosionSize() : int
      {
         return this.tyditi;
      }
      
      public function set explosionSize(_arg_1:int) : void
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
         var _local_1:* = "SmokyShootSFXCC [";
         _local_1 += "criticalHitSize = " + this.criticalHitSize + " ";
         _local_1 += "criticalHitTexture = " + this.criticalHitTexture + " ";
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

