package obfuscation.tuw
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Weqocypoz
   {
      
      private var navohy:MultiframeImageResource;
      
      private var ticegot:ImageResource;
      
      private var komohokos:SoundResource;
      
      private var lofuqo:MultiframeImageResource;
      
      private var dudo:ImageResource;
      
      private var gas:SoundResource;
      
      private var faw:SoundResource;
      
      public function Weqocypoz(_arg_1:MultiframeImageResource = null, _arg_2:ImageResource = null, _arg_3:SoundResource = null, _arg_4:MultiframeImageResource = null, _arg_5:ImageResource = null, _arg_6:SoundResource = null, _arg_7:SoundResource = null)
      {
         super();
         this.navohy = _arg_1;
         this.ticegot = _arg_2;
         this.komohokos = _arg_3;
         this.lofuqo = _arg_4;
         this.dudo = _arg_5;
         this.gas = _arg_6;
         this.faw = _arg_7;
      }
      
      public function get damagingBall() : MultiframeImageResource
      {
         return this.navohy;
      }
      
      public function set damagingBall(_arg_1:MultiframeImageResource) : void
      {
         this.navohy = _arg_1;
      }
      
      public function get damagingRay() : ImageResource
      {
         return this.ticegot;
      }
      
      public function set damagingRay(_arg_1:ImageResource) : void
      {
         this.ticegot = _arg_1;
      }
      
      public function get damagingSound() : SoundResource
      {
         return this.komohokos;
      }
      
      public function set damagingSound(_arg_1:SoundResource) : void
      {
         this.komohokos = _arg_1;
      }
      
      public function get healingBall() : MultiframeImageResource
      {
         return this.lofuqo;
      }
      
      public function set healingBall(_arg_1:MultiframeImageResource) : void
      {
         this.lofuqo = _arg_1;
      }
      
      public function get healingRay() : ImageResource
      {
         return this.dudo;
      }
      
      public function set healingRay(_arg_1:ImageResource) : void
      {
         this.dudo = _arg_1;
      }
      
      public function get healingSound() : SoundResource
      {
         return this.gas;
      }
      
      public function set healingSound(_arg_1:SoundResource) : void
      {
         this.gas = _arg_1;
      }
      
      public function get idleSound() : SoundResource
      {
         return this.faw;
      }
      
      public function set idleSound(_arg_1:SoundResource) : void
      {
         this.faw = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "IsisSFXCC [";
         _local_1 += "damagingBall = " + this.damagingBall + " ";
         _local_1 += "damagingRay = " + this.damagingRay + " ";
         _local_1 += "damagingSound = " + this.damagingSound + " ";
         _local_1 += "healingBall = " + this.healingBall + " ";
         _local_1 += "healingRay = " + this.healingRay + " ";
         _local_1 += "healingSound = " + this.healingSound + " ";
         _local_1 += "idleSound = " + this.idleSound + " ";
         return _local_1 + "]";
      }
   }
}

