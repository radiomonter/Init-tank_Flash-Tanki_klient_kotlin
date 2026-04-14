package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.components.helpers.BubbleItem;
   import base.DiscreteSprite;
   import controls.ValidationIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   import forms.events.LoginFormEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class SearchInputView extends DiscreteSprite implements ISearchInput
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private static const SEARCH_TIMEOUT:int = 600;
      
      private var _searchTextInput:TankInputBase;
      
      private var _searchLabel:LabelBase;
      
      private var _sendRequestButton:DefaultButtonBase;
      
      private var _validateCheckUidIcon:ValidationIcon;
      
      private var _searchTimeOut:uint;
      
      private var _searchName:String;
      
      private var _searchExist:Boolean;
      
      private var _searchUserId:String;
      
      private var _searchLabelText:String;
      
      private var _searchLabelDisabledText:String;
      
      private var _sendButtonText:String;
      
      private var _sendButtonDisabledText:String;
      
      private var _sourceData:ISourceData;
      
      private var _width:Number;
      
      public function SearchInputView(_arg_1:ISourceData, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String)
      {
         super();
         this._sourceData = _arg_1;
         this._searchLabelText = _arg_2;
         this._sendButtonText = _arg_3;
         this._searchLabelDisabledText = _arg_4;
         this._sendButtonDisabledText = _arg_5;
         _arg_1.setSearchInput(this);
         this.init();
      }
      
      private function init() : void
      {
         this._searchTextInput = new TankInputBase();
         this._searchTextInput.maxChars = 20;
         this._searchTextInput.restrict = "0-9.a-zA-z_ \\-*";
         addChild(this._searchTextInput);
         this._searchLabel = new LabelBase();
         addChild(this._searchLabel);
         this._searchLabel.mouseEnabled = false;
         this._searchLabel.color = ColorConstants.LIST_LABEL_HINT;
         this._searchLabel.text = this._searchLabelText;
         this._validateCheckUidIcon = new ValidationIcon();
         addChild(this._validateCheckUidIcon);
         this._sendRequestButton = new DefaultButtonBase();
         this._sendRequestButton.width = 120;
         addChild(this._sendRequestButton);
         this._sendRequestButton.label = this._sendButtonText;
         this._sendRequestButton.enable = false;
         this.resize(100);
         this.show();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.resize(this._width);
      }
      
      public function resize(_arg_1:Number) : void
      {
         this._searchTextInput.width = _arg_1 - this._sendRequestButton.width - 11;
         this._searchTextInput.x = 0;
         this._searchLabel.x = this._searchTextInput.x + 3;
         this._searchLabel.y = this._searchTextInput.y + 7;
         this._validateCheckUidIcon.x = this._searchTextInput.x + this._searchTextInput.width - this._validateCheckUidIcon.width - 15;
         this._validateCheckUidIcon.y = this._searchTextInput.y + 7;
         this._sendRequestButton.x = this._searchTextInput.width;
      }
      
      public function hide() : void
      {
         clearTimeout(this._searchTimeOut);
         this.removeEvents();
         this.clearSearchFriendTextInput();
         this.visible = false;
      }
      
      private function removeEvents() : void
      {
         this._sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onClickAddRequestButton);
         this._searchTextInput.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchFriend);
         this._searchTextInput.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchFriend);
         this._searchTextInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onSearchFriendTextChange);
         this._searchTextInput.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      public function show() : void
      {
         this.visible = true;
         this.setEvents();
         this._searchTextInput.value = "";
         this.updateVisibleSearchFriendLabel();
      }
      
      private function setEvents() : void
      {
         this._sendRequestButton.addEventListener(MouseEvent.CLICK,this.onClickAddRequestButton);
         this._searchTextInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchFriend);
         this._searchTextInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchFriend);
         this._searchTextInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onSearchFriendTextChange);
         this._searchTextInput.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function onClickAddRequestButton(_arg_1:MouseEvent = null) : void
      {
         if(this._searchExist && this._searchName != null)
         {
            this._sourceData.addByUid(this._searchName);
            this.clearSearchFriendTextInput();
         }
      }
      
      private function clearSearchFriendTextInput() : void
      {
         this._searchTextInput.value = "";
         this._sendRequestButton.enable = false;
         this._validateCheckUidIcon.turnOff();
         this._searchExist = false;
         this._searchName = null;
      }
      
      private function onFocusInSearchFriend(_arg_1:FocusEvent) : void
      {
         this._searchLabel.visible = false;
      }
      
      private function onFocusOutSearchFriend(_arg_1:FocusEvent) : void
      {
         this.updateVisibleSearchFriendLabel();
      }
      
      private function updateVisibleSearchFriendLabel() : void
      {
         if(this._searchTextInput.value.length == 0)
         {
            this._searchLabel.visible = true;
            this._validateCheckUidIcon.turnOff();
            this._searchTextInput.validValue = true;
         }
      }
      
      private function onSearchFriendTextChange(_arg_1:LoginFormEvent) : void
      {
         this._searchExist = false;
         this._sendRequestButton.enable = false;
         this._validateCheckUidIcon.startProgress();
         this._validateCheckUidIcon.y = this._searchTextInput.y + 5;
         if(this._searchTextInput.value.length > 0)
         {
            this._searchLabel.visible = false;
         }
         clearTimeout(this._searchTimeOut);
         this._searchTimeOut = setTimeout(this.searchFriendTextChange,SEARCH_TIMEOUT);
      }
      
      private function searchFriendTextChange() : void
      {
         if(this._searchTextInput.value.length == 0)
         {
            this._validateCheckUidIcon.turnOff();
            this._searchTextInput.validValue = true;
            BubbleItem.hide();
         }
         else
         {
            this._searchName = this._searchTextInput.value;
            this._sourceData.checkUid(this._searchName);
         }
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.ENTER)
         {
            this.onClickAddRequestButton();
         }
      }
      
      public function onUidExist() : void
      {
         BubbleItem.hide();
         this._searchTextInput.validValue = true;
         this._validateCheckUidIcon.markAsValid();
         this._validateCheckUidIcon.y = this._searchTextInput.y + 7;
         if(userPropertiesService.userName.toLowerCase() != this._searchName.toLowerCase())
         {
            this._searchExist = true;
            this._sendRequestButton.enable = true;
         }
      }
      
      public function onUidNotExist() : void
      {
         BubbleItem.hide();
         this._searchName = null;
         this.markAsInvalidInput();
      }
      
      public function onUserLowRank(_arg_1:String) : void
      {
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
         this.markAsInvalidInput();
      }
      
      private function markAsInvalidInput() : void
      {
         this._searchTextInput.validValue = false;
         this._validateCheckUidIcon.markAsInvalid();
         this._validateCheckUidIcon.y = this._searchTextInput.y + 7;
         this._sendRequestButton.enable = false;
      }
      
      public function onAlreadyInAccepted(_arg_1:String) : void
      {
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
         this.markAsInvalidInput();
      }
      
      public function onAlreadyInOutgoing(_arg_1:String) : void
      {
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
         this.markAsInvalidInput();
      }
      
      public function onAlreadyInIncoming(_arg_1:String, _arg_2:String) : void
      {
         this._searchUserId = _arg_1;
         BubbleItem.createBubble(_arg_2,this._searchTextInput,this);
         this.markAsInvalidInput();
      }
      
      public function onAlreadyInClan(_arg_1:String) : void
      {
         this.markAsInvalidInput();
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
      }
      
      public function onRestrictionOnJoin(_arg_1:String) : void
      {
         this.markAsInvalidInput();
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
      }
      
      public function clanBlocked(_arg_1:String) : void
      {
         this.markAsInvalidInput();
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
      }
      
      public function incomingRequestDisabled(_arg_1:String) : void
      {
         this.markAsInvalidInput();
         BubbleItem.createBubble(_arg_1,this._searchTextInput,this);
      }
      
      public function set enable(_arg_1:Boolean) : void
      {
         this._sendRequestButton.enable = _arg_1;
         this._searchTextInput.enable = _arg_1;
         if(_arg_1)
         {
            this._sendRequestButton.label = this._sendButtonText;
            this._searchLabel.text = this._searchLabelText;
         }
         else
         {
            this._sendRequestButton.label = this._sendButtonDisabledText;
            this._searchLabel.text = this._searchLabelDisabledText;
         }
      }
      
      public function get sendRequestButton() : DefaultButtonBase
      {
         return this._sendRequestButton;
      }
   }
}

