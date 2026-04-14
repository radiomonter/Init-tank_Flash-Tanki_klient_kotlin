package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.service.IModelService;
   import alternativa.tanks.model.antiaddiction.AntiAddictionAlertModel;
   import alternativa.tanks.model.entrancealert.EntranceAlertModel;
   import alternativa.tanks.model.panel.CapabilitiesDumper;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.payment.PaymentModel;
   import alternativa.tanks.model.referals.ReferalsModel;
   import alternativa.tanks.model.user.UserDataModel;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Nijusyde;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.fps.Qyficequ;
   import alternativa.tanks.service.money.Hocok;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.notificationcategories.Fyhicofal;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.services.NewsService;
   import alternativa.tanks.services.NewsServiceImpl;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.DialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectServiceImpl;
   
   public class PanelModelActivator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      private var panelModel:PanelModel;
      
      private var userDataModel:UserDataModel;
      
      private var paymentModel:PaymentModel;
      
      private var referalsModel:ReferalsModel;
      
      private var antiAddictionModel:AntiAddictionAlertModel;
      
      private var entranceAlertModel:EntranceAlertModel;
      
      private var capabilitiesDumper:CapabilitiesDumper;
      
      public function PanelModelActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         PanelModelActivator.osgi = _arg_1;
         var _local_2:IModelService = IModelService(_arg_1.getService(IModelService));
         _arg_1.registerService(IMoneyService,new Hocok());
         _arg_1.registerService(IBlurService,new BlurService());
         _arg_1.registerService(ReconnectService,new ReconnectServiceImpl());
         _arg_1.registerService(IDialogsService,new DialogsService());
         _arg_1.registerService(INotificationGarageCategoriesService,new Fyhicofal());
         _arg_1.registerService(NewsService,new NewsServiceImpl());
         this.panelModel = new PanelModel();
         _local_2.add(this.panelModel);
         this.userDataModel = new UserDataModel();
         _local_2.add(this.userDataModel);
         this.antiAddictionModel = new AntiAddictionAlertModel();
         _local_2.add(this.antiAddictionModel);
         this.entranceAlertModel = new EntranceAlertModel();
         _local_2.add(this.entranceAlertModel);
         _arg_1.registerService(FPSService,new Qyficequ());
         this.capabilitiesDumper = new CapabilitiesDumper();
         IDumpService(_arg_1.getService(IDumpService)).registerDumper(this.capabilitiesDumper);
         _arg_1.registerService(DailyQuestNotifierService,new Nijusyde());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         var _local_2:IModelService = IModelService(_arg_1.getService(IModelService));
         _local_2.remove(this.panelModel.id);
         this.panelModel = null;
         _local_2.remove(this.userDataModel.id);
         this.userDataModel = null;
         _local_2.remove(this.paymentModel.id);
         this.paymentModel = null;
         _local_2.remove(this.antiAddictionModel.id);
         this.antiAddictionModel = null;
         _local_2.remove(this.entranceAlertModel.id);
         this.entranceAlertModel = null;
         IDumpService(_arg_1.getService(IDumpService)).unregisterDumper(this.capabilitiesDumper.dumperName);
         this.capabilitiesDumper = null;
         PanelModelActivator.osgi = null;
      }
   }
}

