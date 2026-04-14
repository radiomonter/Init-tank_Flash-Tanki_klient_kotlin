package alternativa.tanks.gui.notinclan.clanslist
{
   import alternativa.tanks.models.user.IClanUserModel;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.IGameObject;
   
   public class UserOutgoingRequestLabel extends ClanInfoLabel
   {
      
      public function UserOutgoingRequestLabel(_arg_1:String)
      {
         super(_arg_1);
      }
      
      override protected function onCancelClick(_arg_1:MouseEvent) : void
      {
         cancelIndicator.visible = false;
         var _local_2:IGameObject = clanUserService.getObjectById(clanId);
         (clanUserService.userObject.adapt(IClanUserModel) as IClanUserModel).revoke(_local_2);
      }
      
      override public function showIndicators() : void
      {
         super.showIndicators();
      }
   }
}

