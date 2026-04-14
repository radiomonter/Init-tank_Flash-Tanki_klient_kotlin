package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.service.battle.BattleUserInfoService;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battlecreate.Mydoqaq;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.Qesybeloq;
   import alternativa.tanks.service.battlelist.BattleListFormService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   
   public class BattleSelectModelActivator implements IBundleActivator
   {
      
      public function BattleSelectModelActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         _arg_1.registerService(IBattleCreateFormService,new Mydoqaq());
         _arg_1.registerService(IBattleListFormService,new BattleListFormService());
         _arg_1.registerService(IBattleInfoFormService,new Qesybeloq());
         _arg_1.registerService(IBattleUserInfoService,new BattleUserInfoService());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         _arg_1.unregisterService(IBattleCreateFormService);
         _arg_1.unregisterService(IBattleListFormService);
         _arg_1.unregisterService(IBattleInfoFormService);
         _arg_1.unregisterService(IBattleUserInfoService);
      }
   }
}

