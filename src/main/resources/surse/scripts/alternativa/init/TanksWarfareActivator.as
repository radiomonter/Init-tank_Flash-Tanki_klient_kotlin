package alternativa.init
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import obfuscation.cefivofyh.Tevyky;
   import obfuscation.fudic.Kef;
   import obfuscation.mobakobup.Tiwo;
   import obfuscation.samelosin.Noqalob;
   
   public class TanksWarfareActivator extends CommonBundleActivator
   {
      
      public function TanksWarfareActivator()
      {
         super();
      }
      
      override public function start(_arg_1:OSGi) : void
      {
         registerModel(new Tiwo(),_arg_1);
         registerModel(new Tevyky(),_arg_1);
         registerModel(new Noqalob(),_arg_1);
         registerModel(new Kef(),_arg_1);
      }
   }
}

