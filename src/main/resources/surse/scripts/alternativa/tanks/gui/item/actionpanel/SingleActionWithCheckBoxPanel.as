package alternativa.tanks.gui.item.actionpanel
{
   import alternativa.osgi.OSGi;
   import controls.checkbox.CheckBoxEvent;
   import controls.checkbox.TankCheckBox;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class SingleActionWithCheckBoxPanel extends SingleActionPanel
   {
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService = ILobbyLayoutService(OSGi.getInstance().getService(ILobbyLayoutService));
      
      private static const CALLBACK_DELAY:int = 1000;
      
      private var checkBox:TankCheckBox;
      
      private var lastValue:Boolean;
      
      private var timeoutCallback:uint;
      
      private var callbackCheckBoxChanged:Function;
      
      public function SingleActionWithCheckBoxPanel(_arg_1:String, _arg_2:Function)
      {
         super(_arg_1,_arg_2);
      }
      
      public function initCheckBox(_arg_1:String, _arg_2:Boolean, _arg_3:Function) : void
      {
         this.callbackCheckBoxChanged = _arg_3;
         this.checkBox = new TankCheckBox();
         this.checkBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.handleChangedValue);
         this.checkBox.label = localeService.getText(_arg_1);
         this.checkBox.checked = _arg_2;
         if(actionButton.visible)
         {
            this.checkBox.y = actionButton.height - this.checkBox.height >> 1;
            this.checkBox.x = actionButton.x + actionButton.width + 15;
         }
         else
         {
            this.checkBox.x = 11;
            this.checkBox.y = 8;
         }
         this.lastValue = _arg_2;
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.handleLayoutSwitch);
      }
      
      private function handleLayoutSwitch(_arg_1:Event) : void
      {
         this.callback();
      }
      
      override public function updateActionElements(_arg_1:DisplayObjectContainer) : void
      {
         super.updateActionElements(_arg_1);
         _arg_1.addChild(this.checkBox);
      }
      
      override public function close() : void
      {
         super.close();
         this.checkBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.handleChangedValue);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.handleLayoutSwitch);
         clearTimeout(this.timeoutCallback);
      }
      
      private function handleChangedValue(_arg_1:CheckBoxEvent) : void
      {
         clearTimeout(this.timeoutCallback);
         this.timeoutCallback = setTimeout(this.callback,CALLBACK_DELAY);
      }
      
      private function callback() : void
      {
         if(this.lastValue != this.checkBox.checked)
         {
            this.lastValue = this.checkBox.checked;
            this.callbackCheckBoxChanged();
         }
      }
      
      public function isChecked() : Boolean
      {
         return this.checkBox.checked;
      }
      
      override public function set enabled(_arg_1:Boolean) : void
      {
         super.enabled = _arg_1;
         this.checkBox.visible = _arg_1;
      }
   }
}

