package alternativa.tanks.gui.friends.battleinvite
{
   import controls.base.LabelBase;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import projects.tanks.clients.flash.commons.services.notification.Notification;
   
   public class ResponseBattleInviteNotification extends Notification
   {
      
      private var _messageLabel:LabelBase;
      
      private var _userLabel:UserLabel;
      
      public function ResponseBattleInviteNotification(_arg_1:String, _arg_2:String)
      {
         super(_arg_1,_arg_2);
      }
      
      override protected function init() : void
      {
         super.init();
         this._userLabel = new UserLabel(userId);
         addChild(this._userLabel);
         this._messageLabel = new LabelBase();
         this._messageLabel.mouseEnabled = false;
         addChild(this._messageLabel);
         this._messageLabel.color = ColorConstants.GREEN_LABEL;
         this._messageLabel.text = message;
      }
      
      override protected function resize() : void
      {
         this._userLabel.x = GAP + 7;
         this._userLabel.y = GAP + 5;
         this._messageLabel.x = GAP + 9;
         this._messageLabel.y = this._userLabel.y + this._userLabel.height - 1;
         _innerHeight = this._messageLabel.y + this._messageLabel.height - 3;
         var _local_1:int = this._messageLabel.x + this._messageLabel.width + GAP * 2;
         if(_local_1 > _width)
         {
            _width = _local_1;
         }
         _height = _innerHeight + GAP * 2 + 1;
         super.resize();
      }
   }
}

