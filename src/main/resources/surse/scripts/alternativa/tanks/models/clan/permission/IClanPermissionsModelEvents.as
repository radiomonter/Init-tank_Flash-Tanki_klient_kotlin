package alternativa.tanks.models.clan.permission
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   
   public class IClanPermissionsModelEvents implements IClanPermissionsModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanPermissionsModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function setPosition(id:String, position:ClanPermission) : void
      {
         var i:int = 0;
         var m:IClanPermissionsModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanPermissionsModel(this.impl[i]);
               m.setPosition(id,position);
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

