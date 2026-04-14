package alternativa.tanks.gui.components.indicators
{
   import alternativa.tanks.models.service.ClanNotificationsManager;
   
   public class NewCandidateIndicator extends LabelNewIndicator
   {
      
      private var userId:String;
      
      private var _visible:Boolean = true;
      
      public function NewCandidateIndicator(_arg_1:String)
      {
         super();
         this.userId = _arg_1;
      }
      
      override public function hide() : void
      {
         this._visible = false;
      }
      
      override public function show() : void
      {
         this._visible = true;
      }
      
      override public function updateNotifications() : void
      {
         visible = ClanNotificationsManager.userInIncomingNotifications(this.userId) && this._visible;
      }
   }
}

