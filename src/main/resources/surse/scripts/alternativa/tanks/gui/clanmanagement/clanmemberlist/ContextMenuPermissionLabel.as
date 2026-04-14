package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.foreignclan.ForeignClanService;
   import alternativa.tanks.models.service.ClanService;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import forms.ColorConstants;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   public class ContextMenuPermissionLabel extends DiscreteSprite implements IClanPositionListener, IClanActionListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var clanMembersData:ClanMembersDataService;
      
      [Inject]
      public static var foreignClanService:ForeignClanService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const HEIGHT:int = 18;
      
      protected var id:String;
      
      protected var contextItem:Boolean;
      
      private var label:LabelBase;
      
      private var _width:Number;
      
      public var currentUserId:String;
      
      public var permission:ClanPermission;
      
      public var data:Object;
      
      public function ContextMenuPermissionLabel(_arg_1:ClanPermission)
      {
         super();
         this.permission = _arg_1;
         this.label = createLabelBase(_arg_1);
         this.addEventListeners();
         addChild(this.label);
         this.contextItem = true;
      }
      
      public static function createPositionLabel(_arg_1:ClanPermission) : ContextMenuPermissionLabel
      {
         return new ContextMenuPermissionLabel(_arg_1);
      }
      
      private static function createLabelBase(_arg_1:ClanPermission) : LabelBase
      {
         var _local_2:LabelBase = new LabelBase();
         _local_2.autoSize = TextFieldAutoSize.LEFT;
         _local_2.color = ColorConstants.GREEN_LABEL;
         _local_2.text = getLocalizedNamePermission(_arg_1);
         return _local_2;
      }
      
      public static function getLocalizedNamePermission(_arg_1:ClanPermission) : String
      {
         switch(_arg_1)
         {
            case ClanPermission.SUPREME_COMMANDER:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_SUPREME_COMMANDER);
            case ClanPermission.COMMANDER:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_COMMANDER);
            case ClanPermission.OFFICER:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_OFFICER);
            case ClanPermission.SERGEANT:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_SERGEANT);
            case ClanPermission.VETERAN:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_VETERAN);
            case ClanPermission.PRIVATE:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_PRIVATE);
            case ClanPermission.NOVICE:
               return localeService.getText(TanksLocale.TEXT_CLAN_POSITION_NOVICE);
            default:
               return "EMPTY";
         }
      }
      
      public function addEventListeners() : void
      {
         this.label.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
         this.label.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
      }
      
      private function onMouseOver(_arg_1:MouseEvent = null) : void
      {
         if(this.contextItem)
         {
            Mouse.cursor = MouseCursor.BUTTON;
            this.label.color = ColorConstants.WHITE;
         }
         else if(this.isEditPermission())
         {
            Mouse.cursor = MouseCursor.BUTTON;
         }
      }
      
      private function isEditPermission() : Boolean
      {
         return this.permission != ClanPermission.SUPREME_COMMANDER && this.currentUserId != this.id && clanUserInfoService.hasAction(ClanAction.PERMISSION_DISTRIBUTION) && !clanService.isBlocked && this.permission.value > clanMembersData.getPermission(this.currentUserId).value && !foreignClanService.isShowForeignClan();
      }
      
      private function onMouseOut(_arg_1:MouseEvent = null) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
         if(this.contextItem)
         {
            this.label.color = ColorConstants.GREEN_LABEL;
         }
      }
      
      public function dataChanged(_arg_1:UserData) : void
      {
         this.label.text = getLocalizedNamePermission(_arg_1.permission);
         this.data.permission = _arg_1.permission;
         this.width = this._width;
      }
      
      public function updateActions() : void
      {
         if(foreignClanService.isShowForeignClan())
         {
            return;
         }
         this.permission = clanMembersData.getPermission(this.userId);
         if(clanUserInfoService.hasAction(ClanAction.PERMISSION_DISTRIBUTION) && !clanService.isBlocked && this.permission.value > clanMembersData.getPermission(this.currentUserId).value)
         {
            if(this.permission != ClanPermission.SUPREME_COMMANDER && this.currentUserId != this.id)
            {
               addEventListener(MouseEvent.CLICK,this.onPositionClick,false,0,true);
            }
         }
         else if(hasEventListener(MouseEvent.CLICK))
         {
            removeEventListener(MouseEvent.CLICK,this.onPositionClick);
         }
      }
      
      public function get userId() : String
      {
         return this.id;
      }
      
      private function onPositionClick(_arg_1:MouseEvent) : void
      {
         ClanPermissionsManager.show(this.userId,this.currentUserId,this);
      }
      
      public function destroy() : void
      {
         this.label.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.label.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.label.x = _arg_1 - this.label.width >> 1;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
   }
}

