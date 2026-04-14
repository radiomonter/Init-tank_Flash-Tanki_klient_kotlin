package alternativa.tanks.gui.clanmanagement.clanmemberlist.members
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanMembersHeaderItem;
   import base.DiscreteSprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class HeaderClanMemberList extends DiscreteSprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static var HEADERS:Vector.<HeaderData>;
      
      private static var header:HeaderClanMemberList;
      
      private static var _weights:Vector.<Number> = Vector.<Number>([0.16,0.2,0.08,0.08,0.08,0.08,0.16,0.16]);
      
      private static var hiddenColumns:Vector.<Number> = new Vector.<Number>();
      
      private static var hideOrder:Vector.<Number> = Vector.<Number>([5,4,3,2,6,7,1]);
      
      protected static var _width:Number = 840;
      
      private static var gap:Number = 2;
      
      public function HeaderClanMemberList()
      {
         var _local_1:ClanMembersHeaderItem = null;
         var _local_3:int = 0;
         super();
         header = this;
         HEADERS = Vector.<HeaderData>([new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_NAME),TextFormatAlign.LEFT,2,180),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_POSITION),TextFormatAlign.LEFT,2,168),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_COLUMN_EXPERIENCE),TextFormatAlign.LEFT,2,67),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_COLUMN_DESTROYED),TextFormatAlign.LEFT,2,80),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_COLUMN_LOST),TextFormatAlign.LEFT,2,67),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_COLUMN_KILL_DEATH_RATIO),TextFormatAlign.LEFT,2,53),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_DAYS),TextFormatAlign.LEFT,2,134),new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_LAST_VISIT),TextFormatAlign.LEFT,2,134)]);
         var _local_2:int = int(HEADERS.length);
         while(_local_3 < _local_2)
         {
            _local_1 = new ClanMembersHeaderItem(HEADERS[_local_3].align);
            _local_1.label = HEADERS[_local_3].text;
            _local_1.setLabelPosX(HEADERS[_local_3].posX);
            _local_1.height = 18;
            addChild(_local_1);
            _local_3++;
         }
      }
      
      public static function getColumnX(_arg_1:int) : Number
      {
         return header.getChildAt(_arg_1).x;
      }
      
      public static function getColumnWidth(_arg_1:int) : Number
      {
         if(header.getChildAt(_arg_1).visible)
         {
            return Math.max(header.getChildAt(_arg_1).width,HEADERS[_arg_1].minWidth);
         }
         return 0;
      }
      
      public static function getPositionColumnWidth() : Number
      {
         return getColumnWidth(1);
      }
      
      protected function resize() : void
      {
         var _local_6:ClanMembersHeaderItem = null;
         var _local_8:Number = NaN;
         var _local_1:int = 0;
         var _local_3:int = 0;
         hiddenColumns = new Vector.<Number>();
         if(_width <= 985)
         {
            _local_1 = int(5 - (_width - 585) / 80);
         }
         hiddenColumns = hideOrder.slice(0,_local_1);
         var _local_2:Number = 0;
         while(_local_3 < HEADERS.length)
         {
            if(hiddenColumns.indexOf(_local_3) < 0)
            {
               _local_2 += _weights[_local_3];
            }
            _local_3++;
         }
         var _local_4:Number = 0;
         var _local_5:Vector.<Number> = new Vector.<Number>();
         _local_3 = 0;
         while(_local_3 < HEADERS.length)
         {
            _local_5.push(_weights[_local_3] / _local_2);
            _local_4 += _local_5[_local_3];
            _local_3++;
         }
         var _local_7:int = 1;
         _local_3 = 0;
         while(_local_3 < HEADERS.length)
         {
            _local_6 = getChildAt(_local_3) as ClanMembersHeaderItem;
            if(hiddenColumns.indexOf(_local_3) < 0)
            {
               _local_6.y = 1;
               _local_6.x = _local_7;
               _local_8 = _local_5[_local_3] / _local_4 * (_width + 2 - gap * (_weights.length - hiddenColumns.length + 1));
               _local_6.width = Math.max(_local_8,HEADERS[_local_3].minWidth);
               if(_local_3 < HEADERS.length - 1)
               {
                  _local_7 += _local_6.width + gap;
               }
               _local_6.visible = true;
            }
            else
            {
               _local_6.visible = false;
            }
            _local_3++;
         }
         getChildAt(numChildren - 1).width = _width + 3 - _local_7 - 2 * gap;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         _width = _arg_1;
         this.resize();
      }
   }
}

class HeaderData
{
   
   public var text:String;
   
   public var align:String;
   
   public var posX:int;
   
   public var minWidth:Number;
   
   public function HeaderData(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:Number = 0)
   {
      super();
      this.text = _arg_1;
      this.align = _arg_2;
      this.posX = _arg_3;
      this.minWidth = _arg_4;
   }
}
