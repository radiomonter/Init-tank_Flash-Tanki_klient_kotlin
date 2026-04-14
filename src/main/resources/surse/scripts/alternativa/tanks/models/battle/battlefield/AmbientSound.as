package alternativa.tanks.models.battle.battlefield
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import obfuscation.lozewaby.Guh;
   
   public class AmbientSound
   {
      
      private var sound:Sound;
      
      private var soundManager:Guh;
      
      private var soundChannel:SoundChannel;
      
      public function AmbientSound(_arg_1:Sound, _arg_2:Guh)
      {
         super();
         this.sound = _arg_1;
         this.soundManager = _arg_2;
      }
      
      public function play(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            if(this.soundChannel == null)
            {
               this.soundChannel = this.soundManager.nekile(this.sound,0,100000,new SoundTransform(0.5));
            }
         }
         else if(this.soundChannel != null)
         {
            this.soundManager.luqire(this.soundChannel);
            this.soundChannel = null;
         }
      }
   }
}

