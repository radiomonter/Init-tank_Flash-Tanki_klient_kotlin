package obfuscation.bidop
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Dowefu
   {
      
      private var mewidamez:Number;
      
      private var pywacew:MultiframeImageResource;
      
      private var nije:MultiframeImageResource;
      
      private var kavobihe:SoundResource;
      
      public function Dowefu(_arg_1:Number = 0, _arg_2:MultiframeImageResource = null, _arg_3:MultiframeImageResource = null, _arg_4:SoundResource = null)
      {
         super();
         this.mewidamez = _arg_1;
         this.pywacew = _arg_2;
         this.nije = _arg_3;
         this.kavobihe = _arg_4;
      }
      
      public function get particleSpeed() : Number
      {
         return this.mewidamez;
      }
      
      public function set particleSpeed(_arg_1:Number) : void
      {
         this.mewidamez = _arg_1;
      }
      
      public function get particleTextureResource() : MultiframeImageResource
      {
         return this.pywacew;
      }
      
      public function set particleTextureResource(_arg_1:MultiframeImageResource) : void
      {
         this.pywacew = _arg_1;
      }
      
      public function get planeTextureResource() : MultiframeImageResource
      {
         return this.nije;
      }
      
      public function set planeTextureResource(_arg_1:MultiframeImageResource) : void
      {
         this.nije = _arg_1;
      }
      
      public function get shotSoundResource() : SoundResource
      {
         return this.kavobihe;
      }
      
      public function set shotSoundResource(_arg_1:SoundResource) : void
      {
         this.kavobihe = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "FreezeSFXCC [";
         _local_1 += "particleSpeed = " + this.particleSpeed + " ";
         _local_1 += "particleTextureResource = " + this.particleTextureResource + " ";
         _local_1 += "planeTextureResource = " + this.planeTextureResource + " ";
         _local_1 += "shotSoundResource = " + this.shotSoundResource + " ";
         return _local_1 + "]";
      }
   }
}

