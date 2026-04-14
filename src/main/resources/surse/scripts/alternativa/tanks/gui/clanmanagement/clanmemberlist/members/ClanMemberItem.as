package alternativa.tanks.gui.clanmanagement.clanmemberlist.members
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.ClanActionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.PermissionLabel;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.*;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanUserItem;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.DeleteIndicator;
   import alternativa.tanks.gui.components.indicators.NewClanMemberIndicator;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.service.clan.ClanMembersListEvent;
   import controls.base.LabelBase;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.clients.flash.commons.services.datetime.DateFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import utils.TimeFormatter;
   
   public class ClanMemberItem extends ClanUserItem
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public var permissionLabel:ContextMenuPermissionLabel;
      
      private var experienceLabel:LabelBase;
      
      private var lostLabel:LabelBase;
      
      private var destroyedLabel:LabelBase;
      
      private var dlLabel:LabelBase;
      
      private var dateInClanLabel:LabelBase;
      
      private var lastOnlineDate:LabelBase;
      
      public var newIndicator:NewClanMemberIndicator;
      
      public var userId:String;
      
      public var currentUserId:String;
      
      private var permission:ClanPermission;
      
      private var items:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public var data:Object;
      
      public function ClanMemberItem(_arg_1:Object)
      {
         super();
         this.data = _arg_1;
         this.userId = _arg_1.id;
         this.currentUserId = _arg_1.currentUserId;
         userContainer = createUserLabel(this.userId);
         _arg_1.uid = _userLabel.uid;
         addChild(userContainer);
         this.permission = _arg_1.permission;
         this.permissionLabel = new PermissionLabel(this.permission,_arg_1,this.userId,_arg_1.currentUserId);
         this.permissionLabel.updateActions();
         addChild(this.permissionLabel);
         this.experienceLabel = createLabel();
         this.experienceLabel.text = _arg_1.score;
         addChild(this.experienceLabel);
         this.lostLabel = createLabel();
         this.lostLabel.text = _arg_1.kills;
         addChild(this.lostLabel);
         this.destroyedLabel = createLabel();
         this.destroyedLabel.text = _arg_1.deaths;
         addChild(this.destroyedLabel);
         this.dlLabel = createLabel();
         this.dlLabel.text = _arg_1.kd;
         addChild(this.dlLabel);
         this.dateInClanLabel = createLabel();
         this.dateInClanLabel.text = TimeFormatter.format(_arg_1.date);
         addChild(this.dateInClanLabel);
         this.lastOnlineDate = createLabel();
         this.lastOnlineDate.text = DateFormatter.formatDateToLocalized(new Date(_arg_1.lastOnlineDate));
         addChild(this.lastOnlineDate);
         this.items.push(userContainer);
         this.items.push(this.permissionLabel);
         this.items.push(this.experienceLabel);
         this.items.push(this.lostLabel);
         this.items.push(this.destroyedLabel);
         this.items.push(this.dlLabel);
         this.items.push(this.dateInClanLabel);
         this.items.push(this.lastOnlineDate);
         _deleteIndicator = new DeleteIndicator(this.permission == ClanPermission.SUPREME_COMMANDER || this.userId == this.currentUserId,this.userId,this.currentUserId);
         deleteIndicator.visible = false;
         addChild(deleteIndicator);
         this.newIndicator = this.createNewIndicator(_arg_1);
         this.newIndicator.updateNotifications();
         ClanNotificationsManager.addAcceptedIndicatorListener(this.newIndicator);
         addChild(this.newIndicator);
         deleteIndicator.addEventListener(MouseEvent.CLICK,this.onClickDelete,false,0,true);
         this.onResize();
         addEventListener(Event.ADDED_TO_STAGE,this.onAdded,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage,false,0,true);
      }
      
      private static function createLabel() : LabelBase
      {
         var _local_1:LabelBase = new LabelBase();
         _local_1.autoSize = TextFieldAutoSize.LEFT;
         _local_1.align = TextFormatAlign.LEFT;
         _local_1.multiline = true;
         _local_1.wordWrap = true;
         _local_1.color = ColorConstants.GREEN_LABEL;
         return _local_1;
      }
      
      private function onAdded(_arg_1:Event) : void
      {
         ClanActionsManager.addActionsUpdateListener(this.permissionLabel);
         this.permissionLabel.addEventListeners();
         this.newIndicator.updateNotifications();
      }
      
      public function onRemovedFromStage(_arg_1:Event) : void
      {
         ClanActionsManager.removeActionsListener(this.permissionLabel);
         this.permissionLabel.destroy();
      }
      
      private function createNewIndicator(_arg_1:Object) : NewClanMemberIndicator
      {
         var _local_2:NewClanMemberIndicator = new NewClanMemberIndicator(this.userId,_arg_1);
         _local_2.autoSize = TextFieldAutoSize.LEFT;
         _local_2.align = TextFormatAlign.LEFT;
         _local_2.color = ColorConstants.GREEN_LABEL;
         _local_2.text = localeService.getText(TanksLocale.TEXT_FRIENDS_NEW_FRIEND);
         _local_2.mouseEnabled = false;
         _local_2.visible = false;
         return _local_2;
      }
      
      private function onClickDelete(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REMOVE_USER,_userLabel.userId,_userLabel.uid,true,true));
      }
      
      override protected function onResize(_arg_1:Event = null) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.items.length)
         {
            this.resizeItem(this.items[_local_2],_local_2);
            _local_2++;
         }
         _deleteIndicator.x = width - _deleteIndicator.width - 6;
         _deleteIndicator.y = 1;
         this.newIndicator.x = width - this.newIndicator.width - 10;
         ClanPermissionsManager.setScreenPosition(this.permissionLabel);
         ClanPermissionsManager.resize(HeaderClanMemberList.getPositionColumnWidth());
         if(width > 0)
         {
            graphics.clear();
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,width - 1,20);
            graphics.endFill();
         }
      }
      
      private function resizeItem(_arg_1:DisplayObject, _arg_2:int) : void
      {
         _arg_1.x = HeaderClanMemberList.getColumnX(_arg_2);
         _arg_1.y = 1;
         _arg_1.width = HeaderClanMemberList.getColumnWidth(_arg_2);
         if(_arg_2 != 0)
         {
            _arg_1.x -= 5;
         }
      }
   }
}

