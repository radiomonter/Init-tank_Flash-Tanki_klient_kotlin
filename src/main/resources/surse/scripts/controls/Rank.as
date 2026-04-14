package controls
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Rank
   {
      
      public static var ranks:Array;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Rank()
      {
         super();
      }
      
      public static function name(_arg_1:int) : String
      {
         var _local_2:String = null;
         if(ranks == null)
         {
            _local_2 = localeService.getText(TanksLocale.TEXT_RANK_NAMES);
            ranks = _local_2.split(",");
         }
         if(_arg_1 > ranks.length)
         {
            return ranks[ranks.length - 1] + " " + (_arg_1 + 1 - ranks.length);
         }
         return ranks[_arg_1 - 1];
      }
   }
}

