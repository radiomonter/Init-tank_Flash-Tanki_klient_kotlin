package alternativa.tanks.gui.friends.list.renderer
{
   import alternativa.tanks.gui.friends.FriendActionIndicator;
   import alternativa.tanks.gui.friends.list.renderer.background.RendererBackGroundOutgoingList;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import services.contextmenu.IContextMenuService;
   
   public class FriendsOutgoingListRenderer extends CellRenderer
   {
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private var _labelsContainer:DisplayObject;
      
      private var _userLabel:UserLabel;
      
      private var _cancelRequestIndicator:FriendActionIndicator;
      
      public function FriendsOutgoingListRenderer()
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
         var _local_2:RendererBackGroundOutgoingList = new RendererBackGroundOutgoingList(false);
         var _local_3:RendererBackGroundOutgoingList = new RendererBackGroundOutgoingList(true);
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_2);
         setStyle("overSkin",_local_2);
         setStyle("selectedUpSkin",_local_3);
         setStyle("selectedOverSkin",_local_3);
         setStyle("selectedDownSkin",_local_3);
         this._labelsContainer = this.createLabels(_data);
         if(this._cancelRequestIndicator == null)
         {
            this._cancelRequestIndicator = new FriendActionIndicator(FriendActionIndicator.NO);
            addChild(this._cancelRequestIndicator);
         }
         this._cancelRequestIndicator.visible = false;
         this.addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this._cancelRequestIndicator.addEventListener(MouseEvent.CLICK,this.onClickCancelRequest,false,0,true);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.resize();
      }
      
      private function resize() : void
      {
         this._cancelRequestIndicator.x = _width - this._cancelRequestIndicator.width - 6;
      }
      
      private function createLabels(_arg_1:Object) : Sprite
      {
         var _local_2:Sprite = new Sprite();
         if(_arg_1.id != null)
         {
            this._userLabel = new UserLabel(_arg_1.id);
            this._userLabel.setUidColor(ColorConstants.GREEN_LABEL);
            this._userLabel.x = -3;
            this._userLabel.y = -1;
            _local_2.addChild(this._userLabel);
         }
         return _local_2;
      }
      
      private function onRollOver(_arg_1:MouseEvent) : void
      {
         this._cancelRequestIndicator.visible = true;
         super.selected = true;
      }
      
      private function onRollOut(_arg_1:MouseEvent) : void
      {
         this._cancelRequestIndicator.visible = false;
         super.selected = false;
      }
      
      private function onClickCancelRequest(_arg_1:MouseEvent) : void
      {
         contextMenuService.cancelRequest(this._userLabel.userId,this._userLabel.uid);
      }
      
      override public function set selected(_arg_1:Boolean) : void
      {
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
   }
}

