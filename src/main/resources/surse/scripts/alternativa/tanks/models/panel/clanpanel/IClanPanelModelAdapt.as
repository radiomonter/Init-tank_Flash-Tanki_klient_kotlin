package alternativa.tanks.models.panel.clanpanel
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanPanelModelAdapt implements IClanPanelModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanPanelModel;
      
      public function IClanPanelModelAdapt(_arg_1:IGameObject, _arg_2:IClanPanelModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function sendInviteToClan(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.sendInviteToClan(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

