package alternativa.tanks.model.item
{
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.client.battleselect.model.item.BattleItemModelBase;
   import projects.tanks.client.battleselect.model.item.IBattleItemModelBase;
   
   public class BattleItemModel extends BattleItemModelBase implements IBattleItemModelBase, IObjectLoadListener, IBattleItem
   {
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function BattleItemModel()
      {
         super();
      }
      
      public function madePrivate() : void
      {
         battleListFormService.madePrivate(object.name,getInitParam().name);
      }
      
      public function updateName(_arg_1:String) : void
      {
         battleListFormService.updateName(object.name,_arg_1);
      }
      
      public function updateSuspicious(_arg_1:Boolean) : void
      {
         battleListFormService.updateSuspicious(object.name,_arg_1);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         battleListFormService.battleItemRecord(object);
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
         battleUserInfoService.tofawa(object);
         battleListFormService.weqogos(object.name);
      }
      
      public function getConstructor() : BattleItemCC
      {
         return getInitParam();
      }
   }
}

