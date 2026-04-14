package alternativa.tanks.gui.clanmanagement.clanmemberlist.candidates
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanMembersHeaderItem;
   import base.DiscreteSprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class HeaderClanCandidateList extends DiscreteSprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static var HEADERS:Vector.<HeaderData>;
      
      public static var tabs:Vector.<Number> = Vector.<Number>([1]);
      
      private static const GAP:int = 2;
      
      protected var _width:int = 800;
      
      private var headerCells:Vector.<ClanMembersHeaderItem>;
      
      public function HeaderClanCandidateList()
      {
         var _local_1:ClanMembersHeaderItem = null;
         var _local_3:int = 0;
         this.headerCells = new Vector.<ClanMembersHeaderItem>();
         super();
         HEADERS = Vector.<HeaderData>([new HeaderData(localeService.getText(TanksLocale.TEXT_CLAN_MEMBER_NAME),TextFormatAlign.LEFT,2)]);
         var _local_2:int = int(HEADERS.length);
         while(_local_3 < _local_2)
         {
            _local_1 = new ClanMembersHeaderItem(HEADERS[_local_3].align);
            _local_1.label = HEADERS[_local_3].text;
            _local_1.setLabelPosX(HEADERS[_local_3].posX);
            _local_1.height = 18;
            addChild(_local_1);
            this.headerCells.push(_local_1);
            _local_3++;
         }
         this.align();
      }
      
      protected function align() : void
      {
         var _local_1:ClanMembersHeaderItem = null;
         var _local_2:int = 0;
         var _local_4:int = 0;
         _local_2 = int(HEADERS.length);
         var _local_3:Number = GAP - 1;
         while(_local_4 < _local_2)
         {
            _local_1 = this.headerCells[_local_4];
            _local_1.width = tabs[_local_4] * (this._width + 2 - GAP * (tabs.length + 1));
            _local_1.x = _local_3;
            _local_1.y = 1;
            if(_local_4 != _local_2 - 1)
            {
               _local_3 += _local_1.width + GAP;
            }
            _local_4++;
         }
         this.headerCells[this.headerCells.length - 1].width = this._width + 3 - _local_3 - 2 * GAP;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.align();
      }
   }
}

class HeaderData
{
   
   public var text:String;
   
   public var align:String;
   
   public var posX:int;
   
   public function HeaderData(_arg_1:String, _arg_2:String, _arg_3:int)
   {
      super();
      this.text = _arg_1;
      this.align = _arg_2;
      this.posX = _arg_3;
   }
}
