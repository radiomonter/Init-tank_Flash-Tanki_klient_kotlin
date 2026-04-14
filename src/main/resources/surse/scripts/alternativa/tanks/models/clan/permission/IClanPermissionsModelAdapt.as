package alternativa.tanks.models.clan.permission
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   
   public class IClanPermissionsModelAdapt implements IClanPermissionsModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanPermissionsModel;
      
      public function IClanPermissionsModelAdapt(_arg_1:IGameObject, _arg_2:IClanPermissionsModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function setPosition(id:String, position:ClanPermission) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.setPosition(id,position);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

