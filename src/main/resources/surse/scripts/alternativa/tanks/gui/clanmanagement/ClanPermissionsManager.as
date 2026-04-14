package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ContextMenuPermissionLabel;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.IClanActionListener;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.IClanPositionListener;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.members.HeaderClanMemberList;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import alternativa.tanks.models.clan.permission.IClanPermissionsModel;
   import alternativa.tanks.models.service.ClanService;
   import base.DiscreteSprite;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   import projects.tanks.client.clans.clan.permissions.ClanPermission;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.KeyUpListenerPriority;
   
   public class ClanPermissionsManager extends DiscreteSprite implements IClanPositionListener, IClanActionListener
   {
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var clanMembersDataService:ClanMembersDataService;
      
      private static var menu:ClanPermissionsManager;
      
      public static var permissionsModel:IClanPermissionsModel;
      
      private static var currentId:String;
      
      private static var positionUpdateListeners:Vector.<IClanPositionListener> = new Vector.<IClanPositionListener>();
      
      private static const MARGIN:int = 6;
      
      private var window:TankWindow;
      
      private var windowInner:TankWindowInner;
      
      private var id:String;
      
      private var numPositions:int = 0;
      
      public function ClanPermissionsManager(_arg_1:String, _arg_2:String)
      {
         super();
         this.id = _arg_1;
         currentId = _arg_2;
         this.window = new TankWindow();
         addChild(this.window);
         this.windowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.windowInner.x = MARGIN;
         this.windowInner.y = MARGIN;
         this.window.addChild(this.windowInner);
         this.createPermissions(clanMembersDataService.getPermission(_arg_2));
         addPositionUpdateListener(this);
         ClanActionsManager.addActionsUpdateListener(this);
         addEventListener(MouseEvent.ROLL_OUT,this.mouseOut);
         display.stage.addEventListener(MouseEvent.CLICK,this.onContextMenuClick);
         display.stage.addEventListener(Event.DEACTIVATE,this.onContextMenuDeactivate);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,KeyUpListenerPriority.CONTEXT_MENU);
      }
      
      public static function resize(_arg_1:int) : void
      {
         if(menu != null)
         {
            menu.resize(_arg_1);
         }
      }
      
      public static function setScreenPosition(_arg_1:ContextMenuPermissionLabel) : void
      {
         var _local_2:Point = null;
         if(menu != null && menu.id == _arg_1.userId)
         {
            _local_2 = _arg_1.localToGlobal(new Point(0,0));
            menu.setScreenPosition(_local_2);
         }
      }
      
      public static function addPositionUpdateListener(_arg_1:IClanPositionListener) : void
      {
         positionUpdateListeners.push(_arg_1);
      }
      
      public static function removePositionListener(_arg_1:IClanPositionListener) : void
      {
         var _local_2:int = positionUpdateListeners.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            positionUpdateListeners.splice(_local_2,1);
         }
      }
      
      public static function removePositionListeners() : void
      {
         positionUpdateListeners = new Vector.<IClanPositionListener>();
      }
      
      public static function updatePositions(_arg_1:UserData) : void
      {
         var _local_2:IClanPositionListener = null;
         for each(_local_2 in positionUpdateListeners)
         {
            if(_local_2.userId == _arg_1.userId)
            {
               _local_2.dataChanged(_arg_1);
            }
         }
         ClanActionsManager.updateActions();
      }
      
      public static function show(_arg_1:String, _arg_2:String, _arg_3:ContextMenuPermissionLabel) : void
      {
         if(menu != null)
         {
            remove();
         }
         menu = new ClanPermissionsManager(_arg_1,_arg_2);
         menu.setScreenPosition(_arg_3.localToGlobal(new Point(0,0)));
         menu.resize(HeaderClanMemberList.getPositionColumnWidth());
         display.stage.addChild(menu);
      }
      
      private static function remove() : void
      {
         menu.parent.removeChild(menu);
         menu.removeListeners();
         menu = null;
      }
      
      private static function permissionByValue(_arg_1:int) : ClanPermission
      {
         var _local_2:ClanPermission = null;
         for each(_local_2 in ClanPermission.values)
         {
            if(_local_2.value == _arg_1)
            {
               return _local_2;
            }
         }
         return null;
      }
      
      public static function removeListeners() : void
      {
         positionUpdateListeners = new Vector.<IClanPositionListener>();
      }
      
      private function onContextMenuClick(_arg_1:MouseEvent) : void
      {
         if(_arg_1.target.parent != null && _arg_1.target.parent as ContextMenuPermissionLabel == null)
         {
            remove();
         }
      }
      
      private function onContextMenuDeactivate(_arg_1:Event) : void
      {
         remove();
      }
      
      private function mouseOut(_arg_1:MouseEvent) : void
      {
         remove();
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            remove();
         }
      }
      
      public function dataChanged(_arg_1:UserData) : void
      {
         remove();
      }
      
      public function updateActions() : void
      {
         remove();
      }
      
      private function createPermissions(_arg_1:ClanPermission) : void
      {
         var _local_4:ContextMenuPermissionLabel = null;
         var _local_2:int = 0;
         var _local_3:int = _arg_1.value + 1;
         while(_local_3 < ClanPermission.values.length - 1)
         {
            _local_4 = ContextMenuPermissionLabel.createPositionLabel(permissionByValue(_local_3));
            _local_4.y = _local_2;
            _local_4.addEventListener(MouseEvent.CLICK,this.onPickPosition,false,0,true);
            this.windowInner.addChild(_local_4);
            _local_2 += ContextMenuPermissionLabel.HEIGHT;
            ++this.numPositions;
            _local_3++;
         }
      }
      
      private function onPickPosition(_arg_1:MouseEvent) : void
      {
         var _local_2:ContextMenuPermissionLabel = null;
         if(clanUserInfoService.hasAction(ClanAction.PERMISSION_DISTRIBUTION) && _arg_1.target.parent != null && _arg_1.target.parent as ContextMenuPermissionLabel != null)
         {
            _local_2 = _arg_1.target.parent as ContextMenuPermissionLabel;
            permissionsModel.setPosition(menu.id,_local_2.permission);
            remove();
         }
      }
      
      public function setScreenPosition(_arg_1:Point) : void
      {
         menu.x = _arg_1.x - MARGIN;
         menu.y = _arg_1.y - MARGIN;
         if(menu.y > display.stage.height - 60 - menu.height)
         {
            menu.y = display.stage.height - 60 - menu.height;
         }
      }
      
      public function resize(_arg_1:int) : void
      {
         var _local_3:ContextMenuPermissionLabel = null;
         var _local_2:int = 0;
         this.windowInner.width = _arg_1;
         this.windowInner.height = ContextMenuPermissionLabel.HEIGHT * this.numPositions;
         while(_local_2 < this.windowInner.numChildren)
         {
            if(this.windowInner.getChildAt(_local_2) is ContextMenuPermissionLabel)
            {
               _local_3 = ContextMenuPermissionLabel(this.windowInner.getChildAt(_local_2));
               _local_3.width = this.windowInner.width;
            }
            _local_2++;
         }
         this.window.width = _arg_1 + 2 * MARGIN;
         this.window.height = 2 * MARGIN + this.windowInner.height;
      }
      
      public function removeListeners() : void
      {
         removePositionListener(this);
         ClanActionsManager.removeActionsListener(this);
         removeEventListener(MouseEvent.ROLL_OUT,this.mouseOut);
         display.stage.removeEventListener(MouseEvent.CLICK,this.onContextMenuClick);
         display.stage.removeEventListener(Event.DEACTIVATE,this.onContextMenuDeactivate);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      public function get userId() : String
      {
         return this.id;
      }
   }
}

