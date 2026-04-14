package alternativa.tanks.models.clan.permission
{
   import alternativa.tanks.gui.clanmanagement.ClanActionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.client.clans.clan.permissions.ClanPermissionsModelBase;
   import projects.tanks.client.clans.clan.permissions.IClanPermissionsModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   [ModelInfo]
   public class ClanPermissionsModel extends ClanPermissionsModelBase implements IClanPermissionsModel, IClanPermissionsModelBase, ObjectLoadListener
   {
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      public function ClanPermissionsModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanUserInfoService.actions = getInitParam().actions;
         ClanPermissionsManager.permissionsModel = object.adapt(IClanPermissionsModel) as IClanPermissionsModel;
      }
      
      public function updateActions(_arg_1:Vector.<ClanAction>) : void
      {
         clanUserInfoService.actions = _arg_1;
         ClanActionsManager.updateActions();
      }
      
      public function setPosition(_arg_1:String, _arg_2:ClanPermission) : void
      {
         server.setPermissionForUser(_arg_1,_arg_2);
      }
   }
}

