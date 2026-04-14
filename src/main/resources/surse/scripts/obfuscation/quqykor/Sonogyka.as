package obfuscation.quqykor
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Sonogyka
   {
      
      private var hor:MultiframeImageResource;
      
      private var cuzuz:MultiframeImageResource;
      
      private var zevaruv:MultiframeImageResource;
      
      public function Sonogyka(_arg_1:MultiframeImageResource = null, _arg_2:MultiframeImageResource = null, _arg_3:MultiframeImageResource = null)
      {
         super();
         this.hor = _arg_1;
         this.cuzuz = _arg_2;
         this.zevaruv = _arg_3;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.hor;
      }
      
      public function set explosionTexture(_arg_1:MultiframeImageResource) : void
      {
         this.hor = _arg_1;
      }
      
      public function get kyjyhedo() : MultiframeImageResource
      {
         return this.cuzuz;
      }
      
      public function set kyjyhedo(_arg_1:MultiframeImageResource) : void
      {
         this.cuzuz = _arg_1;
      }
      
      public function get vamet() : MultiframeImageResource
      {
         return this.zevaruv;
      }
      
      public function set vamet(_arg_1:MultiframeImageResource) : void
      {
         this.zevaruv = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TankExplosionCC [";
         _local_1 += "explosionTexture = " + this.explosionTexture + " ";
         _local_1 += "shockWaveTexture = " + this.kyjyhedo + " ";
         _local_1 += "smokeTextureId = " + this.vamet + " ";
         return _local_1 + "]";
      }
   }
}

