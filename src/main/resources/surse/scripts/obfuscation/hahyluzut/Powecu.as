package obfuscation.hahyluzut
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Powecu
   {
      
      private var wetadej:ImageResource;
      
      private var mujy:ImageResource;
      
      private var wymutoby:ImageResource;
      
      private var kuf:ImageResource;
      
      private var hipemihew:MultiframeImageResource;
      
      private var qula:MultiframeImageResource;
      
      private var pasu:SoundResource;
      
      private var byra:ImageResource;
      
      private var gurihys:MultiframeImageResource;
      
      private var fojovyhy:ImageResource;
      
      public function Powecu(_arg_1:ImageResource = null, _arg_2:ImageResource = null, _arg_3:ImageResource = null, _arg_4:ImageResource = null, _arg_5:MultiframeImageResource = null, _arg_6:MultiframeImageResource = null, _arg_7:SoundResource = null, _arg_8:ImageResource = null, _arg_9:MultiframeImageResource = null, _arg_10:ImageResource = null)
      {
         super();
         this.wetadej = _arg_1;
         this.mujy = _arg_2;
         this.wymutoby = _arg_3;
         this.kuf = _arg_4;
         this.hipemihew = _arg_5;
         this.qula = _arg_6;
         this.pasu = _arg_7;
         this.byra = _arg_8;
         this.gurihys = _arg_9;
         this.fojovyhy = _arg_10;
      }
      
      public function get chargingPart1() : ImageResource
      {
         return this.wetadej;
      }
      
      public function set chargingPart1(_arg_1:ImageResource) : void
      {
         this.wetadej = _arg_1;
      }
      
      public function get chargingPart2() : ImageResource
      {
         return this.mujy;
      }
      
      public function set chargingPart2(_arg_1:ImageResource) : void
      {
         this.mujy = _arg_1;
      }
      
      public function get chargingPart3() : ImageResource
      {
         return this.wymutoby;
      }
      
      public function set chargingPart3(_arg_1:ImageResource) : void
      {
         this.wymutoby = _arg_1;
      }
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.kuf;
      }
      
      public function set hitMarkTexture(_arg_1:ImageResource) : void
      {
         this.kuf = _arg_1;
      }
      
      public function get powTexture() : MultiframeImageResource
      {
         return this.hipemihew;
      }
      
      public function set powTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hipemihew = _arg_1;
      }
      
      public function get ringsTexture() : MultiframeImageResource
      {
         return this.qula;
      }
      
      public function set ringsTexture(_arg_1:MultiframeImageResource) : void
      {
         this.qula = _arg_1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.pasu;
      }
      
      public function set shotSound(_arg_1:SoundResource) : void
      {
         this.pasu = _arg_1;
      }
      
      public function get smokeImage() : ImageResource
      {
         return this.byra;
      }
      
      public function set smokeImage(_arg_1:ImageResource) : void
      {
         this.byra = _arg_1;
      }
      
      public function get sphereTexture() : MultiframeImageResource
      {
         return this.gurihys;
      }
      
      public function set sphereTexture(_arg_1:MultiframeImageResource) : void
      {
         this.gurihys = _arg_1;
      }
      
      public function get trailImage() : ImageResource
      {
         return this.fojovyhy;
      }
      
      public function set trailImage(_arg_1:ImageResource) : void
      {
         this.fojovyhy = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RailgunShootSFXCC [";
         _local_1 += "chargingPart1 = " + this.chargingPart1 + " ";
         _local_1 += "chargingPart2 = " + this.chargingPart2 + " ";
         _local_1 += "chargingPart3 = " + this.chargingPart3 + " ";
         _local_1 += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _local_1 += "powTexture = " + this.powTexture + " ";
         _local_1 += "ringsTexture = " + this.ringsTexture + " ";
         _local_1 += "shotSound = " + this.shotSound + " ";
         _local_1 += "smokeImage = " + this.smokeImage + " ";
         _local_1 += "sphereTexture = " + this.sphereTexture + " ";
         _local_1 += "trailImage = " + this.trailImage + " ";
         return _local_1 + "]";
      }
   }
}

