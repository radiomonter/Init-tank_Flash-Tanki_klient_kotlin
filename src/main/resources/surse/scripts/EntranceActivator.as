package
{
   import alternativa.init.BattleSelectModelActivator;
   import alternativa.init.ClansModelActivator;
   import alternativa.init.PanelModelActivator;
   import alternativa.init.TanksServicesActivator;
   import alternativa.init.UserModelActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.osgi.ProtocolActivator;
   import platform.client.core.general.resource.osgi.Activator;
   import platform.client.core.general.resourcelocale.osgi.Activator;
   import platform.client.core.general.socialnetwork.osgi.Activator;
   import platform.client.core.general.spaces.osgi.Activator;
   import platform.client.fp10.core.osgi.ClientActivator;
   import platform.client.models.commons.osgi.Activator;
   import platform.clients.fp10.commonsflash.Activator;
   import platform.clients.fp10.libraries.alternativaclientflash.Activator;
   import platform.clients.fp10.libraries.alternativapartners.osgi.PartnersActivator;
   import platform.clients.fp10.libraries.alternativapartnersflash.Activator;
   import platform.clients.fp10.libraries.alternativaprotocolflash.Activator;
   import platform.clients.fp10.models.alternativaspacesmodelsflash.Activator;
   import projects.tanks.client.clans.osgi.Activator;
   import projects.tanks.clients.flash.commons.osgi.Activator;
   import projects.tanks.clients.flash.commonsflash.Activator;
   import projects.tanks.clients.flash.resources.osgi.Activator;
   import projects.tanks.clients.flash.resourcesflash.Activator;
   import projects.tanks.clients.fp10.libraries.tanksservicesflash.Activator;
   import projects.tanks.clients.fp10.models.battlefieldmodelflash.Activator;
   import projects.tanks.clients.fp10.models.clansmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tanksbattleselectmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tankschatmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tanksgaragemodelflash.Activator;
   import projects.tanks.clients.fp10.models.tankspanelmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tanksusermodel.Activator;
   import projects.tanks.clients.fp10.tanksformsflash.Activator;
   
   public class EntranceActivator implements IBundleActivator
   {
      
      public function EntranceActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         new TanksServicesActivator().start(_arg_1);
         new ProtocolActivator().start(_arg_1);
         new ClientActivator().start(_arg_1);
         new platform.clients.fp10.libraries.alternativaclientflash.Activator().start(_arg_1);
         new platform.client.core.general.resource.osgi.Activator().start(_arg_1);
         new platform.client.core.general.resourcelocale.osgi.Activator().start(_arg_1);
         new platform.client.core.general.socialnetwork.osgi.Activator().start(_arg_1);
         new platform.client.core.general.spaces.osgi.Activator().start(_arg_1);
         new platform.client.models.commons.osgi.Activator().start(_arg_1);
         new platform.clients.fp10.commonsflash.Activator().start(_arg_1);
         new platform.clients.fp10.libraries.alternativapartnersflash.Activator().start(_arg_1);
         new platform.clients.fp10.libraries.alternativaprotocolflash.Activator().start(_arg_1);
         new platform.clients.fp10.models.alternativaspacesmodelsflash.Activator().start(_arg_1);
         new PartnersActivator().start(_arg_1);
         new projects.tanks.clients.flash.commonsflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.libraries.tanksservicesflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.models.tankspanelmodelflash.Activator().start(_arg_1);
         new PanelModelActivator().start(_arg_1);
         new projects.tanks.clients.fp10.models.tankschatmodelflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.models.tanksgaragemodelflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.models.battlefieldmodelflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.tanksformsflash.Activator().start(_arg_1);
         new projects.tanks.clients.flash.commons.osgi.Activator().start(_arg_1);
         new UserModelActivator().start(_arg_1);
         new projects.tanks.clients.fp10.models.tanksusermodel.Activator().start(_arg_1);
         new projects.tanks.client.clans.osgi.Activator().start(_arg_1);
         new ClansModelActivator().start(_arg_1);
         new projects.tanks.clients.fp10.models.clansmodelflash.Activator().start(_arg_1);
         new projects.tanks.clients.fp10.models.tanksbattleselectmodelflash.Activator().start(_arg_1);
         new projects.tanks.clients.flash.resources.osgi.Activator().start(_arg_1);
         new projects.tanks.clients.flash.resourcesflash.Activator().start(_arg_1);
         new BattleSelectModelActivator().start(_arg_1);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

