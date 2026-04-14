package obfuscation.vat
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.models.battle.gui.chat.Wohokoryk;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   
   public class Visipykif implements Lafo
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      private var output:Wohokoryk;
      
      public function Visipykif(_arg_1:Wohokoryk)
      {
         super();
         this.output = _arg_1;
      }
      
      public function pypuvi(_arg_1:Array) : Boolean
      {
         if(_arg_1.length == 0)
         {
            return false;
         }
         var _local_2:String = _arg_1[0];
         blockUserService.blockUser(_local_2);
         this.output.fikaqu(localeService.getText(TanksLocale.TEXT_CHAT_PANEL_COMMAND_BLOCK,_local_2));
         return true;
      }
   }
}

