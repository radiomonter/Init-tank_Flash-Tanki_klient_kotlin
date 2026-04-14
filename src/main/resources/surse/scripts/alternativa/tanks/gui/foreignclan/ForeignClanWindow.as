package alternativa.tanks.gui.foreignclan
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.ClanBonusItem;
   import alternativa.tanks.gui.clanmanagement.ClanDescriptionPanel;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.ClanMembersList;
   import alternativa.tanks.gui.components.flag.Flag;
   import alternativa.tanks.gui.notinclan.dialogs.ClanDialog;
   import alternativa.tanks.models.foreignclan.ForeignClanService;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.base.ThreeLineBigButton;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.client.clans.panel.foreignclan.ForeignClanData;
   import projects.tanks.clients.flash.commons.services.datetime.DateFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import utils.TimeFormatter;
   
   public class ForeignClanWindow extends ClanDialog
   {
      
      [Inject]
      public static var createClanService:ClanCreateService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var foreignClanService:ForeignClanService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const WIDTH:Number = 900;
      
      public static const HEIGHT:Number = 500;
      
      private var bitmapTOIcon:Class = ForeignClanWindow_bitmapTOIcon;
      
      private var TOIcon:Bitmap = new this.bitmapTOIcon();
      
      private var bitmapDeachIcon:Class = ForeignClanWindow_bitmapDeachIcon;
      
      private var bitmapKillsIcon:Class = ForeignClanWindow_bitmapKillsIcon;
      
      private var bitmapKillsDeathsIcon:Class = ForeignClanWindow_bitmapKillsDeathsIcon;
      
      private var bitmapPlayersIcon:Class = ForeignClanWindow_bitmapPlayersIcon;
      
      private var inner:WindowInner;
      
      private var clanNameLabel:LabelBase = new LabelBase();
      
      private var clanTagLabel:LabelBase = new LabelBase();
      
      private var clanTagText:LabelBase = new LabelBase();
      
      private var clanCreatorLabel:UserLabel;
      
      private var clanCreatorText:LabelBase;
      
      private var clanFlagPic:Flag;
      
      private var creationDateLabel:LabelBase = new LabelBase();
      
      private var countMembersItem:ClanBonusItem;
      
      private var killsCountItem:ClanBonusItem;
      
      private var deathsCountItem:ClanBonusItem;
      
      private var killsDeathsItem:ClanBonusItem;
      
      private var description:ClanDescriptionPanel;
      
      private var usersInner:WindowInner;
      
      private var list:ClanMembersList;
      
      private var restrictionInterval:uint = 0;
      
      private var _restrictionTime:int = 0;
      
      private var clanData:ForeignClanData;
      
      private var sendRequestButton:ThreeLineBigButton = new ThreeLineBigButton();
      
      public function ForeignClanWindow(_arg_1:ForeignClanData)
      {
         super();
         this.clanData = _arg_1;
         this.initClanInfo(_arg_1);
         this.initClanStatistics(_arg_1);
         this.initDescription(_arg_1);
         this.initUsers(_arg_1);
      }
      
      private function initClanInfo(_arg_1:ForeignClanData) : void
      {
         this.inner = new WindowInner(WIDTH - 2 * MARGIN,231,TankWindowInner.GREEN);
         this.inner.showBlink = true;
         addChild(this.inner);
         this.clanNameLabel.bold = true;
         this.clanNameLabel.size = 16;
         this.clanNameLabel.text = _arg_1.name;
         this.clanCreatorLabel = new UserLabel(_arg_1.creatorId);
         this.clanFlagPic = new Flag(this.getClanFlag(_arg_1.flagId));
         this.clanTagLabel.text = "[" + _arg_1.tag + "]";
         this.creationDateLabel.text = localeService.getText(TanksLocale.TEXT_CLAN_CREATION_DATE_WITH_COLON) + " " + DateFormatter.formatDateToLocalized(new Date(_arg_1.createTime));
         this.clanCreatorText = new LabelBase();
         this.clanCreatorText.text = localeService.getText(TanksLocale.TEXT_CLAN_FOUNDER_WITH_COLON);
         this.clanTagText.text = localeService.getText(TanksLocale.TEXT_CLAN_TAG_WITH_COLON);
         this.clanTagLabel.color = ColorConstants.GREEN_LABEL;
         this.initRequestButton(_arg_1);
         this.inner.addChild(this.TOIcon);
         this.inner.addChild(this.clanNameLabel);
         this.inner.addChild(this.clanFlagPic);
         this.inner.addChild(this.clanCreatorText);
         this.inner.addChild(this.clanCreatorLabel);
         this.inner.addChild(this.clanTagText);
         this.inner.addChild(this.clanTagLabel);
         this.inner.addChild(this.creationDateLabel);
         this.inner.addChild(this.sendRequestButton);
         this.inner.x = MARGIN;
         this.inner.y = MARGIN;
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
         this.creationDateLabel.mouseEnabled = false;
         this.creationDateLabel.x = this.clanCreatorText.x;
         this.creationDateLabel.y = this.clanCreatorText.y + this.clanCreatorText.height + 5;
         this.clanTagText.x = this.creationDateLabel.x;
         this.clanTagText.y = this.creationDateLabel.y + this.creationDateLabel.height + 5;
         this.clanTagLabel.mouseEnabled = false;
         this.clanTagLabel.x = this.clanTagText.x + this.clanTagText.width;
         this.clanTagLabel.y = this.clanTagText.y;
         this.sendRequestButton.width = 160;
         this.sendRequestButton.x = this.inner.width - this.sendRequestButton.width - MARGIN;
         this.sendRequestButton.y = MARGIN;
      }
      
      private function initRequestButton(_arg_1:ForeignClanData) : void
      {
         var _local_2:int = clanUserInfoService.restrictionTime;
         if(_arg_1.memberClan)
         {
            this.sendRequestButton.visible = false;
            return;
         }
         if(_arg_1.blocked)
         {
            this.sendRequestButton.visible = false;
            return;
         }
         if(_arg_1.minRankForAddClan > userPropertyService.rank)
         {
            this.sendRequestButton.visible = false;
         }
         if(!_arg_1.incomingRequestEnabled)
         {
            this.sendRequestButton.enabled = false;
            this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_NOT_RECRUITING);
            return;
         }
         if(_local_2 > 0)
         {
            this.sendRequestButton.enabled = false;
            this.initRestrictionTime();
            return;
         }
         this.sendRequestButton.enabled = true;
         if(_arg_1.requestInIncoming)
         {
            this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_ACCEPT_REQUEST);
            this.sendRequestButton.addEventListener(MouseEvent.CLICK,this.onAcceptRequest);
            return;
         }
         if(_arg_1.requestInOutgoing)
         {
            this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_REMOVE_REQUEST_TO_CLAN);
            this.sendRequestButton.addEventListener(MouseEvent.CLICK,this.onRevokeRequest);
            return;
         }
         this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_SEND_REQUEST);
         this.sendRequestButton.addEventListener(MouseEvent.CLICK,this.onSendRequest);
      }
      
      public function initRestrictionTime() : void
      {
         this._restrictionTime = clanUserInfoService.restrictionTime;
         if(this._restrictionTime > 0 && this.restrictionInterval == 0)
         {
            this.restrictionCountDown();
            this.restrictionInterval = setInterval(this.restrictionCountDown,1000);
         }
      }
      
      private function restrictionCountDown() : void
      {
         --this._restrictionTime;
         if(this._restrictionTime <= 0)
         {
            clearInterval(this.restrictionInterval);
            this.restrictionInterval = 0;
            this._restrictionTime = 0;
            this.initRequestButton(this.clanData);
         }
         else if(this.clanData.incomingRequestEnabled)
         {
            this.sendRequestButton.label = TimeFormatter.format(this._restrictionTime);
         }
      }
      
      private function onSendRequest(_arg_1:MouseEvent) : void
      {
         foreignClanService.sendRequest();
         this.sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onSendRequest);
         this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_REMOVE_REQUEST_TO_CLAN);
         this.sendRequestButton.addEventListener(MouseEvent.CLICK,this.onRevokeRequest);
      }
      
      private function onAcceptRequest(_arg_1:MouseEvent) : void
      {
         foreignClanService.acceptRequest();
         this.sendRequestButton.enabled = false;
      }
      
      private function onRevokeRequest(_arg_1:MouseEvent) : void
      {
         foreignClanService.revokeRequest();
         this.sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onRevokeRequest);
         this.sendRequestButton.label = localeService.getText(TanksLocale.TEXT_CLAN_SEND_REQUEST);
         this.sendRequestButton.addEventListener(MouseEvent.CLICK,this.onSendRequest);
      }
      
      private function initClanStatistics(_arg_1:ForeignClanData) : void
      {
         var _local_4:UserData = null;
         var _local_2:int = 0;
         var _local_3:int = 0;
         for each(_local_4 in _arg_1.users)
         {
            _local_2 += _local_4.kills;
            _local_3 += _local_4.deaths;
         }
         this.countMembersItem = new ClanBonusItem(new this.bitmapPlayersIcon() as Bitmap,localeService.getText(TanksLocale.TEXT_CLAN_PLAYERS_IN_CLAN),_arg_1.users.length.toString());
         this.killsCountItem = new ClanBonusItem(new this.bitmapKillsIcon() as Bitmap,localeService.getText(TanksLocale.TEXT_CLAN_TANKS_DESTROYED),_local_2.toString());
         this.deathsCountItem = new ClanBonusItem(new this.bitmapDeachIcon() as Bitmap,localeService.getText(TanksLocale.TEXT_CLAN_TANKS_LOST),_local_3.toString());
         this.killsDeathsItem = new ClanBonusItem(new this.bitmapKillsDeathsIcon() as Bitmap,localeService.getText(TanksLocale.TEXT_CLAN_KILL_DEATH_RATION),"");
         if(_local_3 == 0)
         {
            this.killsDeathsItem.setValue("0.00");
         }
         else
         {
            this.killsDeathsItem.setValue((Number(_local_2) / _local_3).toFixed(2));
         }
         this.inner.addChild(this.countMembersItem);
         this.inner.addChild(this.killsCountItem);
         this.inner.addChild(this.deathsCountItem);
         this.inner.addChild(this.killsDeathsItem);
         this.countMembersItem.x = MARGIN - 1;
         this.killsCountItem.x = this.countMembersItem.x + this.countMembersItem.width + MARGIN;
         this.deathsCountItem.x = this.killsCountItem.x + this.killsCountItem.width + MARGIN;
         this.killsDeathsItem.x = this.deathsCountItem.x + this.deathsCountItem.width + MARGIN;
         this.countMembersItem.y = this.TOIcon.y + this.TOIcon.height + MARGIN;
         this.killsCountItem.y = this.countMembersItem.y;
         this.deathsCountItem.y = this.countMembersItem.y;
         this.killsDeathsItem.y = this.countMembersItem.y;
      }
      
      public function initDescription(_arg_1:ForeignClanData) : void
      {
         var _local_2:String = _arg_1.description;
         if(_arg_1.blocked)
         {
            _local_2 = _arg_1.reasonForBlocking;
         }
         this.description = new ClanDescriptionPanel(_local_2);
         addChild(this.description);
         this.description.x = MARGIN;
         this.description.y = this.inner.y + this.inner.height + SMALL_MARGIN;
         this.description.width = this.width - 2 * MARGIN;
         this.description.height = 80;
      }
      
      private function initUsers(_arg_1:ForeignClanData) : void
      {
         var _local_3:UserData = null;
         var _local_4:Object = null;
         this.usersInner = new WindowInner(0,0,WindowInner.GREEN);
         this.usersInner.showBlink = true;
         this.usersInner.x = MARGIN;
         this.usersInner.y = this.description.y + this.description.height + SMALL_MARGIN;
         this.usersInner.width = this.width - 2 * MARGIN;
         this.usersInner.height = this.height - this.inner.height - this.description.height - closeButton.height - 3 * MARGIN - 2 * SMALL_MARGIN;
         addChild(this.usersInner);
         this.list = new ClanMembersList();
         var _local_2:Vector.<Object> = new Vector.<Object>();
         for each(_local_3 in _arg_1.users)
         {
            _local_4 = {};
            _local_4.score = _local_3.score.toString();
            _local_4.permission = _local_3.permission;
            _local_4.kills = _local_3.kills.toString();
            _local_4.deaths = _local_3.deaths.toString();
            _local_4.kd = this.getKD(_local_3).toFixed(2).toString();
            _local_4.date = _local_3.dateInClanInSec;
            _local_4.lastOnlineDate = _local_3.lastVisitTime;
            _local_4.id = _local_3.userId;
            _local_4.currentUserId = userPropertyService.userId;
            _local_4.currentUserPermission = ClanPermission.NOVICE;
            _local_4.isNew = false;
            _local_2.push(_local_4);
         }
         this.list.fillData(_local_2);
         this.list.x = 3;
         this.list.y = 3;
         this.list.width = this.usersInner.width - 6;
         this.list.height = this.usersInner.height - 4;
         this.usersInner.addChild(this.list);
      }
      
      public function getKD(_arg_1:UserData) : Number
      {
         var _local_2:Number = _arg_1.deaths;
         var _local_3:Number = Number(_arg_1.kills);
         if(_local_2 == 0)
         {
            return _local_3;
         }
         return _local_3 / _local_2;
      }
      
      public function getClanFlag(_arg_1:Long) : ClanFlag
      {
         var _local_3:ClanFlag = null;
         var _local_2:int = 0;
         while(_local_2 < createClanService.flags.length)
         {
            _local_3 = createClanService.flags[_local_2];
            if(_arg_1 == _local_3.id)
            {
               return _local_3;
            }
            _local_2++;
         }
         return createClanService.defaultFlag;
      }
      
      override public function get height() : Number
      {
         return HEIGHT;
      }
      
      override public function get width() : Number
      {
         return WIDTH;
      }
      
      override protected function removeEvents() : void
      {
         this.sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onSendRequest);
         this.sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onAcceptRequest);
         this.sendRequestButton.removeEventListener(MouseEvent.CLICK,this.onRevokeRequest);
         super.removeEvents();
      }
      
      override public function destroy() : void
      {
         if(this.restrictionInterval > 0)
         {
            clearInterval(this.restrictionInterval);
         }
         foreignClanService.resetWindow();
         super.destroy();
      }
      
      public function showAlertSmallRank() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_CLAN_RANK_LOW_TO_SEND_REQUEST));
         this.sendRequestButton.visible = false;
      }
      
      public function joinClan(_arg_1:String) : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_CLAN_JOINED_CLAN));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onJoinClan);
      }
      
      private function onJoinClan(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onJoinClan);
         foreignClanService.destroyWindow();
      }
      
      public function alreadyInClanOutgoing() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_CLAN_REQUEST_IS_ALREADY_SENT));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInClanOutgoing);
      }
      
      private function onAlreadyInClanOutgoing(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onJoinClan);
         this.destroy();
      }
      
      public function alreadyInIncoming() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_CLAN_ALREADY_INVITED_PLAYER));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInIncomig);
      }
      
      private function onAlreadyInIncomig(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onJoinClan);
         this.destroy();
      }
      
      public function clanBlocked(_arg_1:String) : void
      {
         alertService.showOkAlert(_arg_1);
         this.sendRequestButton.visible = false;
      }
      
      override protected function getImageHeaderId() : String
      {
         return "SYSTEM_MESSAGE";
      }
   }
}

