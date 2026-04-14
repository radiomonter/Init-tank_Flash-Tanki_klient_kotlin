package alternativa.tanks.gui.notinclan.clanslist
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.DeleteIndicator;
   import alternativa.tanks.gui.notinclan.dialogs.ClanDialog;
   import alternativa.tanks.models.clan.info.ClanInfoDelayed;
   import alternativa.tanks.models.clan.info.IClanInfoModel;
   import alternativa.tanks.models.user.ClanUserService;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.commons.services.datetime.DateFormatter;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.clan.ClanUserInfoService;
   
   public class ClanInfoLabel extends DiscreteSprite
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var clanUserInfoService:ClanUserInfoService;
      
      private var nameLabel:LabelBase;
      
      private var tagLabel:LabelBase;
      
      private var clanCreatorLabel:UserLabel;
      
      private var usersCountLabel:LabelBase;
      
      private var creationDateLabel:LabelBase;
      
      protected var cancelIndicator:DeleteIndicator;
      
      public var clanId:String;
      
      private var _width:Number = 0;
      
      public function ClanInfoLabel(_arg_1:String)
      {
         super();
         this.clanId = _arg_1;
         var _local_2:IGameObject = clanUserService.getObjectById(_arg_1);
         if(_local_2 != null)
         {
            this.onModelInfoLoaded();
         }
         else
         {
            ClanInfoDelayed.getInstance().addEventListener(ClanInfoDelayed.EVENT_PREFIX + _arg_1.toString(),this.onModelInfoLoaded);
         }
      }
      
      protected function onModelInfoLoaded(_arg_1:Event = null) : void
      {
         var _local_3:IClanInfoModel = null;
         ClanInfoDelayed.getInstance().removeEventListener(ClanInfoDelayed.EVENT_PREFIX + this.clanId.toString(),this.onModelInfoLoaded);
         var _local_2:IGameObject = clanUserService.getObjectById(this.clanId);
         _local_3 = _local_2.adapt(IClanInfoModel) as IClanInfoModel;
         this.nameLabel = this.createLabel();
         this.nameLabel.text = _local_3.getClanName();
         addChild(this.nameLabel);
         this.tagLabel = this.createLabel();
         this.tagLabel.text = _local_3.getClanTag();
         addChild(this.tagLabel);
         this.clanCreatorLabel = new UserLabel(_local_3.getCreatorId());
         addChild(this.clanCreatorLabel);
         this.usersCountLabel = this.createLabel();
         this.usersCountLabel.text = _local_3.getUsersCount().toString();
         addChild(this.usersCountLabel);
         this.creationDateLabel = this.createLabel();
         this.creationDateLabel.text = DateFormatter.formatDateToLocalized(new Date(_local_3.getCreateTime()));
         addChild(this.creationDateLabel);
         this.cancelIndicator = new DeleteIndicator();
         addChild(this.cancelIndicator);
         this.cancelIndicator.visible = false;
         this.cancelIndicator.addEventListener(MouseEvent.CLICK,this.onCancelClick,false,0,true);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this.onRollOut();
      }
      
      private function createLabel() : LabelBase
      {
         var _local_1:LabelBase = new LabelBase();
         _local_1.align = TextFormatAlign.LEFT;
         _local_1.autoSize = TextFieldAutoSize.LEFT;
         _local_1.color = ColorConstants.GREEN_LABEL;
         return _local_1;
      }
      
      public function onRollOut(_arg_1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            ClansListRenderer(parent).onRollOut();
            this.hideIndicators();
         }
      }
      
      public function onRollOver(_arg_1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            ClansListRenderer(parent).onRollOver();
            this.showIndicators();
         }
      }
      
      public function showIndicators() : void
      {
         this.cancelIndicator.visible = true;
      }
      
      public function hideIndicators() : void
      {
         this.cancelIndicator.visible = false;
      }
      
      public function resize() : void
      {
         if(this.nameLabel == null)
         {
            return;
         }
         var _local_1:Vector.<Number> = ClansListHeader.tabs;
         var _local_2:Number = this.width - 2 * ClanDialog.MARGIN;
         this.nameLabel.x = 0;
         this.nameLabel.width = _local_2 * _local_1[0];
         this.tagLabel.x = this.nameLabel.x + _local_2 * _local_1[0] + 5;
         this.tagLabel.width = _local_2 * _local_1[1];
         this.clanCreatorLabel.x = this.tagLabel.x + _local_2 * _local_1[1] + 5;
         this.usersCountLabel.x = this.clanCreatorLabel.x + _local_2 * _local_1[2] + 5;
         this.usersCountLabel.width = _local_2 * _local_1[3];
         this.creationDateLabel.x = this.usersCountLabel.x + _local_2 * _local_1[3] + 3;
         this.creationDateLabel.width = _local_2 * _local_1[4];
         this.setIndicatorPosition();
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,_local_2,20);
         graphics.endFill();
      }
      
      private function setIndicatorPosition() : void
      {
         if(this.cancelIndicator != null)
         {
            this.cancelIndicator.x = this.width - this.cancelIndicator.width - 8;
            this.cancelIndicator.y = 1;
         }
      }
      
      protected function onCancelClick(_arg_1:MouseEvent) : void
      {
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.resize();
      }
   }
}

