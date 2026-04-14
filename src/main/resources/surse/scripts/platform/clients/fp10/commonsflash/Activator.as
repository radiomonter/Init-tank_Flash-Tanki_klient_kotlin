package platform.clients.fp10.commonsflash
{
   import alternativa.model.description.DescriptionModel;
   import alternativa.model.description.IDescription;
   import alternativa.model.description.IDescriptionAdapt;
   import alternativa.model.description.IDescriptionEvents;
   import alternativa.model.timeperiod.TimePeriod;
   import alternativa.model.timeperiod.TimePeriodAdapt;
   import alternativa.model.timeperiod.TimePeriodEvents;
   import alternativa.model.timeperiod.TimePeriodModel;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.models.commons.description.IDescriptionModelBase;
   import platform.client.models.commons.periodtime.ITimePeriodModelBase;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         osgi = _arg_1;
         var _local_2:ModelRegistry = osgi.getService(ModelRegistry) as ModelRegistry;
         _local_2.registerAdapt(IDescription,IDescriptionAdapt);
         _local_2.registerEvents(IDescription,IDescriptionEvents);
         var _local_3:ModelRegistry = osgi.getService(ModelRegistry) as ModelRegistry;
         _local_3.add(new DescriptionModel(),Vector.<Class>([IDescription,IDescriptionModelBase]));
         _local_2.registerAdapt(TimePeriod,TimePeriodAdapt);
         _local_2.registerEvents(TimePeriod,TimePeriodEvents);
         _local_3.add(new TimePeriodModel(),Vector.<Class>([TimePeriod,ITimePeriodModelBase,ObjectLoadListener]));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

