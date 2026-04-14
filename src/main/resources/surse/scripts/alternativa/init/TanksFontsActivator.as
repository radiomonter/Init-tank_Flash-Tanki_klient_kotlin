package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import flash.text.Font;
   import flash.text.TextFormat;
   import fonts.TanksFontService;
   
   public class TanksFontsActivator implements IBundleActivator
   {
      
      private static const MyriadPro:Class = TanksFontsActivator_MyriadPro;
      
      private static const MyriadProB:Class = TanksFontsActivator_MyriadProB;
      
      public function TanksFontsActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:TextFormat = null;
         var _local_3:Boolean = false;
         var _local_4:String = ILocaleService(_arg_1.getService(ILocaleService)).language;
         if(_local_4 == "cn")
         {
            _local_3 = false;
            _local_2 = new TextFormat("simsun");
            _local_2.color = 16777215;
            _local_2.indent = 0;
         }
         else
         {
            _local_3 = true;
            Font.registerFont(MyriadPro);
            Font.registerFont(MyriadProB);
            _local_2 = new TextFormat("MyriadPro",12,false);
            _local_2.color = 16777215;
         }
         (_arg_1.getService(IHelpService) as IHelpService).setHelperTextFormat(_local_2,_local_3);
         TanksFontService.setTextFormat(_local_2,_local_3);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

