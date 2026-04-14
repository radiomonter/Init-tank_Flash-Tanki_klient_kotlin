package obfuscation.syhis
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Linebaz
   {
      
      private var telatejo:SoundResource;
      
      private var fesepe:SoundResource;
      
      private var lejom:SoundResource;
      
      private var kokoby:SoundResource;
      
      private var zyniqeb:SoundResource;
      
      private var qorofunoq:SoundResource;
      
      private var harolucug:SoundResource;
      
      private var navo:SoundResource;
      
      private var rese:SoundResource;
      
      private var qabeva:SoundResource;
      
      public function Linebaz(_arg_1:SoundResource = null, _arg_2:SoundResource = null, _arg_3:SoundResource = null, _arg_4:SoundResource = null, _arg_5:SoundResource = null, _arg_6:SoundResource = null, _arg_7:SoundResource = null, _arg_8:SoundResource = null, _arg_9:SoundResource = null, _arg_10:SoundResource = null)
      {
         super();
         this.telatejo = _arg_1;
         this.fesepe = _arg_2;
         this.lejom = _arg_3;
         this.kokoby = _arg_4;
         this.zyniqeb = _arg_5;
         this.qorofunoq = _arg_6;
         this.harolucug = _arg_7;
         this.navo = _arg_8;
         this.rese = _arg_9;
         this.qabeva = _arg_10;
      }
      
      public function get pointCaptureStartNegativeSound() : SoundResource
      {
         return this.telatejo;
      }
      
      public function set pointCaptureStartNegativeSound(_arg_1:SoundResource) : void
      {
         this.telatejo = _arg_1;
      }
      
      public function get pointCaptureStartPositiveSound() : SoundResource
      {
         return this.fesepe;
      }
      
      public function set pointCaptureStartPositiveSound(_arg_1:SoundResource) : void
      {
         this.fesepe = _arg_1;
      }
      
      public function get pointCaptureStopNegativeSound() : SoundResource
      {
         return this.lejom;
      }
      
      public function set pointCaptureStopNegativeSound(_arg_1:SoundResource) : void
      {
         this.lejom = _arg_1;
      }
      
      public function get pointCaptureStopPositiveSound() : SoundResource
      {
         return this.kokoby;
      }
      
      public function set pointCaptureStopPositiveSound(_arg_1:SoundResource) : void
      {
         this.kokoby = _arg_1;
      }
      
      public function get pointCapturedNegativeSound() : SoundResource
      {
         return this.zyniqeb;
      }
      
      public function set pointCapturedNegativeSound(_arg_1:SoundResource) : void
      {
         this.zyniqeb = _arg_1;
      }
      
      public function get pointCapturedPositiveSound() : SoundResource
      {
         return this.qorofunoq;
      }
      
      public function set pointCapturedPositiveSound(_arg_1:SoundResource) : void
      {
         this.qorofunoq = _arg_1;
      }
      
      public function get pointNeutralizedNegativeSound() : SoundResource
      {
         return this.harolucug;
      }
      
      public function set pointNeutralizedNegativeSound(_arg_1:SoundResource) : void
      {
         this.harolucug = _arg_1;
      }
      
      public function get pointNeutralizedPositiveSound() : SoundResource
      {
         return this.navo;
      }
      
      public function set pointNeutralizedPositiveSound(_arg_1:SoundResource) : void
      {
         this.navo = _arg_1;
      }
      
      public function get pointScoreDecreasingSound() : SoundResource
      {
         return this.rese;
      }
      
      public function set pointScoreDecreasingSound(_arg_1:SoundResource) : void
      {
         this.rese = _arg_1;
      }
      
      public function get pointScoreIncreasingSound() : SoundResource
      {
         return this.qabeva;
      }
      
      public function set pointScoreIncreasingSound(_arg_1:SoundResource) : void
      {
         this.qabeva = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DominationSounds [";
         _local_1 += "pointCaptureStartNegativeSound = " + this.pointCaptureStartNegativeSound + " ";
         _local_1 += "pointCaptureStartPositiveSound = " + this.pointCaptureStartPositiveSound + " ";
         _local_1 += "pointCaptureStopNegativeSound = " + this.pointCaptureStopNegativeSound + " ";
         _local_1 += "pointCaptureStopPositiveSound = " + this.pointCaptureStopPositiveSound + " ";
         _local_1 += "pointCapturedNegativeSound = " + this.pointCapturedNegativeSound + " ";
         _local_1 += "pointCapturedPositiveSound = " + this.pointCapturedPositiveSound + " ";
         _local_1 += "pointNeutralizedNegativeSound = " + this.pointNeutralizedNegativeSound + " ";
         _local_1 += "pointNeutralizedPositiveSound = " + this.pointNeutralizedPositiveSound + " ";
         _local_1 += "pointScoreDecreasingSound = " + this.pointScoreDecreasingSound + " ";
         _local_1 += "pointScoreIncreasingSound = " + this.pointScoreIncreasingSound + " ";
         return _local_1 + "]";
      }
   }
}

