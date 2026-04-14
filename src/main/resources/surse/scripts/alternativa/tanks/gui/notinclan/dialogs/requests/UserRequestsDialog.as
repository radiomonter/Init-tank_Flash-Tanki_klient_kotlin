package alternativa.tanks.gui.notinclan.dialogs.requests
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.notinclan.clanslist.ClanListType;
   import alternativa.tanks.gui.notinclan.clanslist.ClansList;
   import alternativa.tanks.gui.notinclan.clanslist.ClansListEvent;
   import alternativa.tanks.models.user.ClanUserService;
   import base.DiscreteSprite;
   import controls.windowinner.WindowInner;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   
   public class UserRequestsDialog extends DiscreteSprite
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const MARGIN:Number = 11;
      
      public static const FRAME:Number = 9;
      
      public var closeButtonWidth:int = 0;
      
      protected var clansList:ClansList;
      
      protected var listBackground:WindowInner;
      
      protected var heightSearchUnit:int = 30;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function UserRequestsDialog()
      {
         super();
         this.listBackground = new WindowInner(0,0,WindowInner.GREEN);
         addChild(this.listBackground);
         this.clansList = new ClansList();
         addChild(this.clansList);
         this.onResize();
      }
      
      protected function onResize(_arg_1:Event = null) : void
      {
         this.listBackground.x = FRAME;
         this.listBackground.y = 0;
         this.listBackground.width = this.width - 2 * FRAME;
         this.listBackground.height = this.height - this.heightSearchUnit - MARGIN - FRAME;
         this.clansList.x = this.listBackground.x + 3;
         this.clansList.y = 3;
         this.clansList.resize(this.listBackground.width - 6,this.listBackground.height - 4);
      }
      
      protected function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(AlertUtils.isConfirmationKey(_arg_1.keyCode))
         {
            _arg_1.stopImmediatePropagation();
            this.confirmationKeyPressed();
         }
      }
      
      protected function confirmationKeyPressed() : void
      {
      }
      
      protected function onCancelRequest(_arg_1:ClansListEvent) : void
      {
         this.clansList.removeClan(_arg_1.clanId);
      }
      
      protected function onAddRequest(_arg_1:ClansListEvent) : void
      {
         var _local_2:String = null;
         if(_arg_1.type.lastIndexOf(ClansListEvent.INCOMING) >= 0)
         {
            _local_2 = ClanListType.INCOMING;
         }
         if(_arg_1.type.lastIndexOf(ClansListEvent.OUTGOING) >= 0)
         {
            _local_2 = ClanListType.OUTGOING;
         }
         this.clansList.addClan(_arg_1.clanId,_local_2);
      }
      
      protected function onActionClick(_arg_1:MouseEvent) : void
      {
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
      
      public function destroy() : void
      {
         this.removeEvents();
      }
      
      protected function removeEvents() : void
      {
      }
   }
}

