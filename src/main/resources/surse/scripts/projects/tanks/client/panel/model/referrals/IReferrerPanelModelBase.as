package projects.tanks.client.panel.model.referrals
{
   public interface IReferrerPanelModelBase
   {
      
      function inviteSentSuccessfully() : void;
      
      function openReferrerPanel(param1:Array, param2:String, param3:String, param4:String) : void;
      
      function sendInviteEmailError(param1:String) : void;
   }
}

