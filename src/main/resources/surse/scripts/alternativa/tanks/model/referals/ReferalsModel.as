package alternativa.tanks.model.referals
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ReferalWindow;
   import alternativa.tanks.gui.ReferalWindowEvent;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.panel.IPanelView;
   import flash.events.Event;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import forms.MainPanel;
   import forms.events.MainButtonBarEvents;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import projects.tanks.client.panel.model.referrals.IReferrerPanelModelBase;
   import projects.tanks.client.panel.model.referrals.ReferrerPanelModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   [ModelInfo]
   public class ReferalsModel extends ReferrerPanelModelBase implements IReferrerPanelModelBase, ObjectLoadPostListener, INetworkListener
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var referralWindow:ReferalWindow;
      
      public function ReferalsModel()
      {
         super();
      }
      
      private static function getInvalidEmails(_arg_1:Vector.<String>) : Vector.<String>
      {
         var _local_5:Object = null;
         var _local_4:int = 0;
         var _local_2:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _local_3:Vector.<String> = new Vector.<String>();
         while(_local_4 < _arg_1.length)
         {
            _local_5 = _local_2.exec(_arg_1[_local_4]);
            if(_local_5 == null)
            {
               _local_3.push(_arg_1[_local_4]);
            }
            _local_4++;
         }
         return _local_3;
      }
      
      public function inviteSentSuccessfully() : void
      {
         panelView.showAlert(localeService.getText(TextConst.INVITATION_HAS_BEEN_SENT_ALERT_TEXT));
         this.referralWindow.clearRecipientInputField();
      }
      
      public function openReferrerPanel(_arg_1:Array, _arg_2:String, _arg_3:String, _arg_4:String) : void
      {
         if(this.referralWindow != null)
         {
            return;
         }
         this.referralWindow = new ReferalWindow(userPropertiesService.userName,_arg_3,_arg_2,_arg_4);
         this.referralWindow.addEventListener(ReferalWindowEvent.SEND_MAIL,this.sendInvitation);
         this.referralWindow.addEventListener(Event.CANCEL,this.closeReferrerPanel);
         this.referralWindow.addReferals(_arg_1);
         panelView.unlock();
      }
      
      public function onData(data:Command) : void
      {
         var parser:* = undefined;
         var item:* = undefined;
         var obj:Object = null;
         var pars:* = undefined;
         var it:* = undefined;
         var ref:Array = null;
         var referrals:Array = new Array();
         if(data.type == Type.LOBBY)
         {
            if(data.args[0] == "show_referral_panel")
            {
               parser = JSON.parse(data.args[1]);
               for each(item in parser.referrals)
               {
                  obj = {};
                  obj.income = item.income;
                  obj.rank = item.rank;
                  obj.callsign = item.callsign;
                  referrals.push(obj);
               }
               this.openReferrerPanel(referrals,"https://playflashtanki.com?invite=TEST","osdfsdp0j","Пати полным ходом у Децла дома");
            }
            else if(data.args[0] == "inviteSentSuccessfully")
            {
               this.inviteSentSuccessfully();
            }
            else if(data.args[0] == "addReferrals")
            {
               pars = JSON.parse(data.args[1]);
               ref = new Array();
               for each(it in pars.referrals)
               {
                  obj = {};
                  obj.income = it.income;
                  obj.rank = it.rank;
                  obj.callsign = it.callsign;
                  ref.push(obj);
               }
               this.referralWindow.addReferals(ref);
            }
         }
      }
      
      private function closeReferrerPanel(_arg_1:Event) : void
      {
         this.referralWindow.removeEventListener(ReferalWindowEvent.SEND_MAIL,this.sendInvitation);
         this.referralWindow.removeEventListener(Event.CANCEL,this.closeReferrerPanel);
         this.referralWindow = null;
      }
      
      private function sendInvitation(_arg_1:ReferalWindowEvent) : void
      {
         var _local_2:Vector.<String> = Vector.<String>(_arg_1.adresses.split(","));
         var _local_3:Vector.<String> = getInvalidEmails(_local_2);
         if(_local_3.length > 0)
         {
            if(_local_3.length == 1)
            {
               panelView.showAlert(localeService.getText(TextConst.REFERAL_WINDOW_ADDRESS_NOT_VALID_ALERT_TEXT,_local_3[0]));
            }
            else
            {
               panelView.showAlert(localeService.getText(TextConst.REFERAL_WINDOW_ADDRESSES_NOT_VALID_ALERT_TEXT,_local_3.join(", ")));
            }
         }
         else
         {
            this.sendInvitationMessage(_local_2,Boolean(this.referralWindow.nameInput.textField.text.length) ? this.referralWindow.nameInput.textField.text : userPropertiesService.userName);
         }
      }
      
      public function sendInvitationMessage(_arg_1:Vector.<String>, _arg_2:String) : void
      {
         server.sendInviteEmail(_arg_1,_arg_2);
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:MainPanel = panelView.getPanel();
         _local_1.buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(_arg_1:MainButtonBarEvents) : void
      {
         if(_arg_1.typeButton == MainButtonBarEvents.REFERAL)
         {
            if(this.referralWindow == null)
            {
               server.showReferrerPanel();
            }
            else
            {
               panelView.unlock();
            }
         }
      }
      
      public function sendInviteEmailError(_arg_1:String) : void
      {
         panelView.showAlert(_arg_1);
      }
   }
}

