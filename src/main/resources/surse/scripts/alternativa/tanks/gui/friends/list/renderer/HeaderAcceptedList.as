package alternativa.tanks.gui.friends.list.renderer
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class HeaderAcceptedList extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public static var HEADERS:Vector.<HeaderData>;
      
      protected var tabs:Vector.<Number>;
      
      protected var _width:int = 800;
      
      private var _serverNumberColumnName:LabelBase;
      
      public function HeaderAcceptedList()
      {
         var _local_1:FriendsHeaderItem = null;
         var _local_3:int = 0;
         this.tabs = new Vector.<Number>();
         super();
         HEADERS = Vector.<HeaderData>([new HeaderData(localeService.getText(TextConst.STRING_FRIENDS_NAME),TextFormatAlign.LEFT,2),new HeaderData(localeService.getText(TextConst.STRING_FRIENDS_BATTLE),TextFormatAlign.LEFT,2)]);
         var _local_2:int = int(HEADERS.length);
         while(_local_3 < _local_2)
         {
            _local_1 = new FriendsHeaderItem(HEADERS[_local_3].align);
            _local_1.label = HEADERS[_local_3].text;
            _local_1.setLabelPosX(HEADERS[_local_3].posX);
            _local_1.height = 18;
            addChild(_local_1);
            _local_3++;
         }
         this._serverNumberColumnName = new LabelBase();
         this._serverNumberColumnName.color = 860685;
         this._serverNumberColumnName.mouseEnabled = false;
         this._serverNumberColumnName.text = localeService.getText(TextConst.STRING_SERVER_LABEL_UPPERCASE);
         this._serverNumberColumnName.autoSize = TextFieldAutoSize.NONE;
         this._serverNumberColumnName.align = TextFormatAlign.RIGHT;
         this._serverNumberColumnName.width = 100;
         addChild(this._serverNumberColumnName);
         this.draw();
      }
      
      protected function draw() : void
      {
         var _local_1:FriendsHeaderItem = null;
         var _local_3:int = 0;
         this.tabs = Vector.<Number>([0,this._width / 2,this._width - 1]);
         var _local_2:int = int(HEADERS.length);
         while(_local_3 < _local_2)
         {
            _local_1 = getChildAt(_local_3) as FriendsHeaderItem;
            _local_1.width = this.tabs[_local_3 + 1] - this.tabs[_local_3] - 2;
            _local_1.x = this.tabs[_local_3];
            _local_3++;
         }
         if(this._serverNumberColumnName != null)
         {
            this._serverNumberColumnName.x = this._width - this._serverNumberColumnName.width - 6;
         }
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.draw();
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
