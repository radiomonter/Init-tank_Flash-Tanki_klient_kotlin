package alternativa.tanks.models.notifier
{
   import alternativa.tanks.models.user.ClanUserService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.clans.notifier.ClanNotifierData;
   import projects.tanks.client.clans.notifier.ClanNotifierModelBase;
   import projects.tanks.client.clans.notifier.IClanNotifierModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.UserClanInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   [ModelInfo]
   public class ClanNotifierModel extends ClanNotifierModelBase implements IClanNotifierModelBase, ObjectLoadListener
   {
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      public function ClanNotifierModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:ClanNotifierData = getInitParam();
         var _local_2:UserClanInfo = new UserClanInfo(_local_1);
         clanUserInfoService.updateUserClanInfo(_local_2);
      }
      
      public function sendData(_arg_1:Vector.<ClanNotifierData>) : void
      {
         var _local_2:ClanNotifierData = null;
         var _local_3:UserClanInfo = null;
         for each(_local_2 in _arg_1)
         {
            _local_3 = new UserClanInfo(_local_2);
            clanUserInfoService.updateUserClanInfo(_local_3);
         }
         if(userInfoService.getCurrentUserId() == _local_2.userId && clanUserInfoService.updateFriendsClanButtonFunction != null)
         {
            clanUserInfoService.updateFriendsClanButtonFunction.call(null);
         }
      }
   }
}

