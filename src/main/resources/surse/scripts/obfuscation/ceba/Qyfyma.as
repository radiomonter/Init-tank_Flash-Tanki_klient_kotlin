package obfuscation.ceba
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Qyfyma
   {
      
      private var docuce:MultiframeImageResource;
      
      private var wyzow:SoundResource;
      
      private var qodunuwi:MultiframeImageResource;
      
      public function Qyfyma(_arg_1:MultiframeImageResource = null, _arg_2:SoundResource = null, _arg_3:MultiframeImageResource = null)
      {
         super();
         this.docuce = _arg_1;
         this.wyzow = _arg_2;
         this.qodunuwi = _arg_3;
      }
      
      public function get fireTexture() : MultiframeImageResource
      {
         return this.docuce;
      }
      
      public function set fireTexture(_arg_1:MultiframeImageResource) : void
      {
         this.docuce = _arg_1;
      }
      
      public function get flameSound() : SoundResource
      {
         return this.wyzow;
      }
      
      public function set flameSound(_arg_1:SoundResource) : void
      {
         this.wyzow = _arg_1;
      }
      
      public function get muzzlePlaneTexture() : MultiframeImageResource
      {
         return this.qodunuwi;
      }
      
      public function set muzzlePlaneTexture(_arg_1:MultiframeImageResource) : void
      {
         this.qodunuwi = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "FlameThrowingSFXCC [";
         _local_1 += "fireTexture = " + this.fireTexture + " ";
         _local_1 += "flameSound = " + this.flameSound + " ";
         _local_1 += "muzzlePlaneTexture = " + this.muzzlePlaneTexture + " ";
         return _local_1 + "]";
      }
   }
}

