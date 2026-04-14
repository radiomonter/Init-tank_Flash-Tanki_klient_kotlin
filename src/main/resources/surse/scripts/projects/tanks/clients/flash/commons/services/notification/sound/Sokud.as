package projects.tanks.clients.flash.commons.services.notification.sound
{
   import flash.media.Sound;
   
   public class Sokud implements INotificationSoundService
   {
      
      private var _notificationSound:Sound;
      
      public function Sokud()
      {
         super();
      }
      
      public function set notificationSound(_arg_1:Sound) : void
      {
         this._notificationSound = _arg_1;
      }
      
      public function playNotificationSound() : void
      {
         if(this._notificationSound != null)
         {
            this._notificationSound.play();
         }
      }
   }
}

