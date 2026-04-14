package alternativa.tanks.gui.notinclan.clanslist
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanMembersHeaderItem;
   import alternativa.tanks.gui.notinclan.ClanListDialog;
   import alternativa.tanks.gui.notinclan.dialogs.ClanDialog;
   import base.DiscreteSprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ClansListHeader extends DiscreteSprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var HEADERS:Vector.<String>;
      
      public static var tabs:Vector.<Number> = Vector.<Number>([0.25,0.1,0.25,0.18,0.22]);
      
      private static var gap:Number = 2;
      
      public function ClansListHeader()
      {
         var _local_1:ClanMembersHeaderItem = null;
         var _local_3:int = 0;
         super();
         HEADERS = Vector.<String>([localeService.getText(TanksLocale.TEXT_CLAN_USER_CLAN_NAME),localeService.getText(TanksLocale.TEXT_CLAN_USER_CLAN_TAG),localeService.getText(TanksLocale.TEXT_CLAN_FOUNDER),localeService.getText(TanksLocale.TEXT_CLAN_USER_CLAN_NUMBER_MEMBERS),localeService.getText(TanksLocale.TEXT_CLAN_USER_CREATION_DATE)]);
         var _local_2:int = int(HEADERS.length);
         while(_local_3 < _local_2)
         {
            _local_1 = new ClanMembersHeaderItem(TextFormatAlign.LEFT);
            _local_1.label = HEADERS[_local_3];
            _local_1.height = 18;
            _local_1.y = 1;
            addChild(_local_1);
            _local_3++;
         }
         this.resize(ClanListDialog.WIDTH - 2 * ClanDialog.MARGIN);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this.resize(_arg_1);
      }
      
      protected function resize(_arg_1:Number) : void
      {
         var _local_2:ClanMembersHeaderItem = null;
         var _local_3:int = 0;
         var _local_5:int = 0;
         _local_3 = int(HEADERS.length);
         var _local_4:Number = gap - 1;
         while(_local_5 < _local_3)
         {
            _local_2 = getChildAt(_local_5) as ClanMembersHeaderItem;
            _local_2.width = tabs[_local_5] * (_arg_1 + 2 - gap * (tabs.length + 1));
            _local_2.x = _local_4;
            _local_2.y = 1;
            if(_local_5 != _local_3 - 1)
            {
               _local_4 += _local_2.width + gap;
            }
            _local_5++;
         }
         getChildAt(numChildren - 1).width = _arg_1 + 3 - _local_4 - 2 * gap;
      }
   }
}

