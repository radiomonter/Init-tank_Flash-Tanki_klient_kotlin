package obfuscation.nefysehu
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class Soca
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public var color:uint;
      
      private var cifomeh:String;
      
      public function Soca(_arg_1:uint, _arg_2:String)
      {
         super();
         this.color = _arg_1;
         this.cifomeh = _arg_2;
      }
      
      public function getMessage(_arg_1:String) : String
      {
         return localeService.getText(this.cifomeh).replace("{point}",_arg_1);
      }
   }
}

