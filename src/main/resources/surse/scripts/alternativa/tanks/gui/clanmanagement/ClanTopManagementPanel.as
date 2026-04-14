package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.components.flag.Flag;
   import alternativa.tanks.models.clan.info.IClanInfoModel;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.models.user.ClanUserService;
   import base.DiscreteSprite;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.base.ThreeLineBigButton;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanFunctionsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class ClanTopManagementPanel extends DiscreteSprite
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clanFunctionsService:ClanFunctionsService;
      
      [Inject]
      public static var clanMembersService:ClanMembersDataService;
      
      private static var currentUserId:String;
      
      private static const MARGIN:int = 10;
      
      public static const HEIGHT:int = 120;
      
      private var bitmapTOIcon:Class = ClanTopManagementPanel_bitmapTOIcon;
      
      private var TOIcon:Bitmap = new this.bitmapTOIcon();
      
      private var inner:WindowInner;
      
      private var clanNameLabel:LabelBase = new LabelBase();
      
      private var clanTagLabel:LabelBase = new LabelBase();
      
      private var clanTagText:LabelBase = new LabelBase();
      
      private var clanCreatorLabel:UserLabel;
      
      private var clanCreatorText:LabelBase;
      
      private var clanFlagPic:Flag = new Flag();
      
      private var membersCountLabel:LabelBase = new LabelBase();
      
      private var creationDateLabel:LabelBase = new LabelBase();
      
      private var enterOrLeaveButton:ThreeLineBigButton = new ThreeLineBigButton();
      
      private var _width:int;
      
      private var _height:int = 120;
      
      public function ClanTopManagementPanel(_arg_1:IGameObject)
      {
         super();
         var _local_2:IClanInfoModel = IClanInfoModel(_arg_1.adapt(IClanInfoModel));
         this.inner = new WindowInner(this._width,this._height,TankWindowInner.GREEN);
         this.inner.showBlink = true;
         addChild(this.inner);
         this.clanNameLabel.bold = true;
         this.clanNameLabel.size = 16;
         var _local_3:String = _local_2.getClanName();
         this.clanNameLabel.text = _local_3;
         this.clanCreatorLabel = new UserLabel(clanService.creatorId);
         this.clanFlagPic.setFlag(_local_2.getClanFlag());
         this.clanTagLabel.text = "[" + _local_2.getClanTag() + "]";
         this.setMembersCount();
         this.creationDateLabel.text = localeService.getText(TanksLocale.TEXT_CLAN_CREATION_DATE_WITH_COLON) + " " + clanService.creationDate;
         this.clanCreatorText = new LabelBase();
         this.clanCreatorText.text = localeService.getText(TanksLocale.TEXT_CLAN_FOUNDER_WITH_COLON);
         this.clanTagText.text = localeService.getText(TanksLocale.TEXT_CLAN_TAG_WITH_COLON);
         this.clanTagLabel.color = ColorConstants.GREEN_LABEL;
         this.inner.addChild(this.TOIcon);
         this.inner.addChild(this.clanNameLabel);
         this.inner.addChild(this.clanFlagPic);
         this.inner.addChild(this.clanCreatorText);
         this.inner.addChild(this.clanCreatorLabel);
         this.inner.addChild(this.clanTagText);
         this.inner.addChild(this.clanTagLabel);
         this.inner.addChild(this.membersCountLabel);
         this.inner.addChild(this.creationDateLabel);
         var _local_4:Boolean = clanMembersService.getPermission(getCurrentUserId()) == ClanPermission.SUPREME_COMMANDER;
         if(!_local_4)
         {
            this.enterOrLeaveButton.label = localeService.getText(TanksLocale.TEXT_CLAN_LEAVE);
            this.inner.addChild(this.enterOrLeaveButton);
            this.enterOrLeaveButton.addEventListener(MouseEvent.CLICK,this.onLeaveClick);
         }
         if(_local_4 && _local_2.getUsersCount() == 1)
         {
            this.enterOrLeaveButton.label = localeService.getText(TanksLocale.TEXT_CLAN_DISBAND);
            this.inner.addChild(this.enterOrLeaveButton);
            this.enterOrLeaveButton.addEventListener(MouseEvent.CLICK,this.onDissolveClick);
         }
         addEventListener(Event.ADDED_TO_STAGE,this.addResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private static function getCurrentUserId() : String
      {
         if(currentUserId == null)
         {
            currentUserId = userPropertiesService.userId;
         }
         return currentUserId;
      }
      
      public function setFlag(_arg_1:ClanFlag) : void
      {
         this.clanFlagPic.setFlag(_arg_1);
      }
      
      private function onDissolveClick(_arg_1:MouseEvent) : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALERT_DISBAND_CLAN),Vector.<String>([localeService.getText(TanksLocale.TEXT_FRIENDS_YES),localeService.getText(TanksLocale.TEXT_FRIENDS_CANCEL_BUTTON_TEXT)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanDissolveConfirm);
      }
      
      private function onLeaveClick(_arg_1:MouseEvent) : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALERT_LEAVE_CLAN),Vector.<String>([localeService.getText(TanksLocale.TEXT_FRIENDS_YES),localeService.getText(TanksLocale.TEXT_FRIENDS_CANCEL_BUTTON_TEXT)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanLeavingConfirm);
      }
      
      private function onClanLeavingConfirm(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanLeavingConfirm);
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_FRIENDS_YES))
         {
            this.enterOrLeaveButton.enabled = false;
            clanFunctionsService.leave();
         }
      }
      
      private function onClanDissolveConfirm(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onClanDissolveConfirm);
         if(_arg_1.typeButton == localeService.getText(TanksLocale.TEXT_FRIENDS_YES))
         {
            this.enterOrLeaveButton.enabled = false;
            clanFunctionsService.leave();
         }
      }
      
      private function addResizeListener(_arg_1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.inner.width = this.width;
         this.TOIcon.x = MARGIN;
         this.TOIcon.y = MARGIN;
         this.clanNameLabel.mouseEnabled = false;
         this.clanNameLabel.color = 16777215;
         this.clanNameLabel.x = this.TOIcon.x + this.TOIcon.width + MARGIN;
         this.clanNameLabel.y = MARGIN;
         this.clanFlagPic.x = this.clanNameLabel.x + this.clanNameLabel.width + 5;
         this.clanFlagPic.y = this.clanNameLabel.y + 2;
         this.clanCreatorText.x = this.clanNameLabel.x;
         this.clanCreatorText.y = this.clanNameLabel.y + this.clanNameLabel.height;
         this.clanCreatorLabel.mouseEnabled = false;
         this.clanCreatorLabel.x = this.clanCreatorText.x + this.clanCreatorText.width;
         this.clanCreatorLabel.y = this.clanCreatorText.y;
         this.membersCountLabel.mouseEnabled = false;
         this.membersCountLabel.x = this.clanNameLabel.x;
         this.membersCountLabel.y = HEIGHT - this.membersCountLabel.height - MARGIN;
         this.clanTagText.x = this.clanNameLabel.x;
         this.clanTagText.y = this.membersCountLabel.y - this.clanTagText.height;
         this.clanTagLabel.mouseEnabled = false;
         this.clanTagLabel.x = this.clanTagText.x + this.clanTagText.width;
         this.clanTagLabel.y = this.clanTagText.y;
         this.creationDateLabel.mouseEnabled = false;
         this.creationDateLabel.x = this.clanNameLabel.x;
         this.creationDateLabel.y = this.clanTagText.y - this.clanTagText.height;
         this.enterOrLeaveButton.x = this.width - this.enterOrLeaveButton.width - MARGIN;
         this.enterOrLeaveButton.y = MARGIN;
      }
      
      private function setMembersCount() : void
      {
         var _local_1:int = clanService.membersCount;
         if(clanMembersService.getPermission(getCurrentUserId()) == ClanPermission.SUPREME_COMMANDER)
         {
            this.enterOrLeaveButton.visible = _local_1 == 1;
         }
         this.membersCountLabel.text = localeService.getText(TanksLocale.TEXT_CLAN_NUMBER_MEMBERS_WITH_COLON) + " " + _local_1.toString();
      }
      
      public function userAdded() : void
      {
         this.setMembersCount();
      }
      
      public function userRemoved() : void
      {
         this.setMembersCount();
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = _arg_1;
         this.onResize();
      }
   }
}

