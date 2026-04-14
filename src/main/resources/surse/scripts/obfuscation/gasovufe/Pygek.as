package obfuscation.gasovufe
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Pygek
   {
      
      private var _sound:SoundResource;
      
      private var pitekene:ImageResource;
      
      public function Pygek(_arg_1:SoundResource = null, _arg_2:ImageResource = null)
      {
         super();
         this._sound = _arg_1;
         this.pitekene = _arg_2;
      }
      
      public function get sound() : SoundResource
      {
         return this._sound;
      }
      
      public function set sound(_arg_1:SoundResource) : void
      {
         this._sound = _arg_1;
      }
      
      public function get sprite() : ImageResource
      {
         return this.pitekene;
      }
      
      public function set sprite(_arg_1:ImageResource) : void
      {
         this.pitekene = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleGoldBonusCC [";
         _local_1 += "sound = " + this.sound + " ";
         _local_1 += "sprite = " + this.sprite + " ";
         return _local_1 + "]";
      }
   }
}

