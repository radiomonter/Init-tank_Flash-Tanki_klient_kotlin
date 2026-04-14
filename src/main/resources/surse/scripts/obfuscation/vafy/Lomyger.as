package obfuscation.vafy
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Lomyger
   {
      
      private var midose:SoundResource;
      
      private var fibity:SoundResource;
      
      private var hohela:SoundResource;
      
      private var wugyl:SoundResource;
      
      private var cisyf:SoundResource;
      
      public function Lomyger(_arg_1:SoundResource = null, _arg_2:SoundResource = null, _arg_3:SoundResource = null, _arg_4:SoundResource = null, _arg_5:SoundResource = null)
      {
         super();
         this.midose = _arg_1;
         this.fibity = _arg_2;
         this.hohela = _arg_3;
         this.wugyl = _arg_4;
         this.cisyf = _arg_5;
      }
      
      public function get engineIdleSound() : SoundResource
      {
         return this.midose;
      }
      
      public function set engineIdleSound(_arg_1:SoundResource) : void
      {
         this.midose = _arg_1;
      }
      
      public function get engineMovingSound() : SoundResource
      {
         return this.fibity;
      }
      
      public function set engineMovingSound(_arg_1:SoundResource) : void
      {
         this.fibity = _arg_1;
      }
      
      public function get engineStartMovingSound() : SoundResource
      {
         return this.hohela;
      }
      
      public function set engineStartMovingSound(_arg_1:SoundResource) : void
      {
         this.hohela = _arg_1;
      }
      
      public function get dam() : SoundResource
      {
         return this.wugyl;
      }
      
      public function set dam(_arg_1:SoundResource) : void
      {
         this.wugyl = _arg_1;
      }
      
      public function get qabuwu() : SoundResource
      {
         return this.cisyf;
      }
      
      public function set qabuwu(_arg_1:SoundResource) : void
      {
         this.cisyf = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "EngineCC [";
         _local_1 += "engineIdleSound = " + this.engineIdleSound + " ";
         _local_1 += "engineMovingSound = " + this.engineMovingSound + " ";
         _local_1 += "engineStartMovingSound = " + this.engineStartMovingSound + " ";
         _local_1 += "engineStartSound = " + this.dam + " ";
         _local_1 += "engineStopMovingSound = " + this.qabuwu + " ";
         return _local_1 + "]";
      }
   }
}

