package alternativa.tanks.gui.friends.list.renderer
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.friends.FriendActionIndicator;
   import alternativa.tanks.gui.friends.list.renderer.background.RendererBackGroundIncomingList;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import services.contextmenu.IContextMenuService;
   
   public class FriendsIncomingListRenderer extends CellRenderer
   {
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var _labelsContainer:DisplayObject;
      
      private var _userLabel:UserLabel;
      
      private var _acceptRequestIndicator:FriendActionIndicator;
      
      private var _rejectRequestIndicator:FriendActionIndicator;
      
      private var _isNewLabel:LabelBase;
      
      public function FriendsIncomingListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         mouseEnabled = false;
         mouseChildren = true;
         useHandCursor = false;
         buttonMode = false;
         var _local_2:RendererBackGroundIncomingList = new RendererBackGroundIncomingList(false);
         var _local_3:RendererBackGroundIncomingList = new RendererBackGroundIncomingList(true);
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_2);
         setStyle("overSkin",_local_2);
         setStyle("selectedUpSkin",_local_3);
         setStyle("selectedOverSkin",_local_3);
         setStyle("selectedDownSkin",_local_3);
         this._labelsContainer = this.createLabels(_data);
         if(this._acceptRequestIndicator == null)
         {
            this._acceptRequestIndicator = new FriendActionIndicator(FriendActionIndicator.YES);
            addChild(this._acceptRequestIndicator);
         }
         this._acceptRequestIndicator.visible = false;
         if(this._rejectRequestIndicator == null)
         {
            this._rejectRequestIndicator = new FriendActionIndicator(FriendActionIndicator.NO);
            addChild(this._rejectRequestIndicator);
         }
         this._rejectRequestIndicator.visible = false;
         if(this._isNewLabel == null)
         {
            this._isNewLabel = new LabelBase();
            this._isNewLabel.text = localeService.getText(TextConst.STRING_FRIENDS_NEW) + "!";
            this._isNewLabel.height = 18;
            this._isNewLabel.y = -1;
            this._isNewLabel.color = ColorConstants.GREEN_LABEL;
            addChild(this._isNewLabel);
            this._isNewLabel.mouseEnabled = false;
         }
         this._isNewLabel.visible = _data.isNew;
         this.addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this._acceptRequestIndicator.addEventListener(MouseEvent.CLICK,this.onClickAcceptRequest,false,0,true);
         this._rejectRequestIndicator.addEventListener(MouseEvent.CLICK,this.onClickRejectRequest,false,0,true);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.resize();
      }
      
      private function resize() : void
      {
         this._rejectRequestIndicator.x = _width - this._rejectRequestIndicator.width - 6;
         this._acceptRequestIndicator.x = this._rejectRequestIndicator.x - this._acceptRequestIndicator.width - 1;
         this._isNewLabel.x = _width - this._isNewLabel.width - 6;
      }
      
      private function createLabels(_arg_1:Object) : Sprite
      {
         var _local_2:Sprite = new Sprite();
         if(_arg_1.id != null)
         {
            this._userLabel = new UserLabel(_arg_1.id);
            this._userLabel.x = -3;
            this._userLabel.y = -1;
            _local_2.addChild(this._userLabel);
            this._userLabel.setUidColor(ColorConstants.GREEN_LABEL);
         }
         return _local_2;
      }
      
      private function onRollOver(_arg_1:MouseEvent) : void
      {
         this._acceptRequestIndicator.visible = true;
         this._rejectRequestIndicator.visible = true;
         if(Boolean(_data.isNew))
         {
            this._isNewLabel.visible = false;
         }
         super.selected = true;
      }
      
      private function onRollOut(_arg_1:MouseEvent) : void
      {
         this._acceptRequestIndicator.visible = false;
         this._rejectRequestIndicator.visible = false;
         if(Boolean(_data.isNew))
         {
            this._isNewLabel.visible = true;
         }
         super.selected = false;
      }
      
      private function onClickAcceptRequest(_arg_1:MouseEvent) : void
      {
         contextMenuService.acceptRequest(this._userLabel.userId,this._userLabel.uid);
      }
      
      private function onClickRejectRequest(_arg_1:MouseEvent) : void
      {
         contextMenuService.rejectRequest(this._userLabel.userId,this._userLabel.uid);
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this._labelsContainer != null)
         {
            setStyle("icon",this._labelsContainer);
         }
      }
      
      override protected function drawBackground() : void
      {
         var _local_1:String = !enabled ? "disabled" : mouseState;
         if(selected)
         {
            _local_1 = "selected" + _local_1.substr(0,1).toUpperCase() + _local_1.substr(1);
         }
         _local_1 += "Skin";
         var _local_2:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_local_1));
         addChildAt(background,0);
         if(_local_2 != null && _local_2 != background)
         {
            removeChild(_local_2);
         }
      }
      
      override public function set selected(_arg_1:Boolean) : void
      {
      }
   }
}

