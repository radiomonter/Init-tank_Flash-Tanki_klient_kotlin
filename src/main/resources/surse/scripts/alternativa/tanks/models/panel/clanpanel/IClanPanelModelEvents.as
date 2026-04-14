package alternativa.tanks.models.panel.clanpanel
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanPanelModelEvents implements IClanPanelModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanPanelModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function sendInviteToClan(userId:String) : void
      {
         var i:int = 0;
         var m:IClanPanelModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanPanelModel(this.impl[i]);
               m.sendInviteToClan(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

