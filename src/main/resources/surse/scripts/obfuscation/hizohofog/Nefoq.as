package obfuscation.hizohofog
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Nefoq
   {
      
      private var qade:SoundResource;
      
      private var quseden:SoundResource;
      
      private var hojetu:SoundResource;
      
      private var lunavuje:SoundResource;
      
      private var lolok:SoundResource;
      
      private var ruligyzus:SoundResource;
      
      private var bogyfydi:SoundResource;
      
      private var bify:SoundResource;
      
      public function Nefoq(_arg_1:SoundResource = null, _arg_2:SoundResource = null, _arg_3:SoundResource = null, _arg_4:SoundResource = null, _arg_5:SoundResource = null, _arg_6:SoundResource = null, _arg_7:SoundResource = null, _arg_8:SoundResource = null)
      {
         super();
         this.qade = _arg_1;
         this.quseden = _arg_2;
         this.hojetu = _arg_3;
         this.lunavuje = _arg_4;
         this.lolok = _arg_5;
         this.ruligyzus = _arg_6;
         this.bogyfydi = _arg_7;
         this.bify = _arg_8;
      }
      
      public function get feziwen() : SoundResource
      {
         return this.qade;
      }
      
      public function set feziwen(_arg_1:SoundResource) : void
      {
         this.qade = _arg_1;
      }
      
      public function get flagDropSound() : SoundResource
      {
         return this.quseden;
      }
      
      public function set flagDropSound(_arg_1:SoundResource) : void
      {
         this.quseden = _arg_1;
      }
      
      public function get nagyzyco() : SoundResource
      {
         return this.hojetu;
      }
      
      public function set nagyzyco(_arg_1:SoundResource) : void
      {
         this.hojetu = _arg_1;
      }
      
      public function get flagReturnSound() : SoundResource
      {
         return this.lunavuje;
      }
      
      public function set flagReturnSound(_arg_1:SoundResource) : void
      {
         this.lunavuje = _arg_1;
      }
      
      public function get vefafirag() : SoundResource
      {
         return this.lolok;
      }
      
      public function set vefafirag(_arg_1:SoundResource) : void
      {
         this.lolok = _arg_1;
      }
      
      public function get flagTakeSound() : SoundResource
      {
         return this.ruligyzus;
      }
      
      public function set flagTakeSound(_arg_1:SoundResource) : void
      {
         this.ruligyzus = _arg_1;
      }
      
      public function get cijewicu() : SoundResource
      {
         return this.bogyfydi;
      }
      
      public function set cijewicu(_arg_1:SoundResource) : void
      {
         this.bogyfydi = _arg_1;
      }
      
      public function get winSound() : SoundResource
      {
         return this.bify;
      }
      
      public function set winSound(_arg_1:SoundResource) : void
      {
         this.bify = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "CaptureTheFlagSoundFX [";
         _local_1 += "enemiesWinSound = " + this.feziwen + " ";
         _local_1 += "flagDropSound = " + this.flagDropSound + " ";
         _local_1 += "flagDroppedByEnemiesSound = " + this.nagyzyco + " ";
         _local_1 += "flagReturnSound = " + this.flagReturnSound + " ";
         _local_1 += "flagReturnedByEnemiesSound = " + this.vefafirag + " ";
         _local_1 += "flagTakeSound = " + this.flagTakeSound + " ";
         _local_1 += "flagTakenByEnemiesSound = " + this.cijewicu + " ";
         _local_1 += "winSound = " + this.winSound + " ";
         return _local_1 + "]";
      }
   }
}

