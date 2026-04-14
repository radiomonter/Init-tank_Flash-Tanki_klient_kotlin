package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.model.ShowChat;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Tyd;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import controls.chat.BattleChatInput;
   import controls.chat.ChatInputType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import obfuscation.bude.BattleTeam;
   import obfuscation.joni.ShortUserInfo;
   import obfuscation.joraky.Pywy;
   import obfuscation.vat.Lafo;
   import obfuscation.vat.Tidip;
   import obfuscation.vat.Visipykif;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   
   public class Suku extends Sprite implements ShowChat
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var norata:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var fullscreenService:FullscreenService;
      
      [Inject]
      public static var lijukysuw:TargetingInputManager;
      
      private const jemipupor:String = "/block";
      
      private const bupybu:String = "/unblock";
      
      private const FULL_SCREEN:String = "fullScreen";
      
      private const roq:String = "fullScreenInteractiveAccepted";
      
      private var nesunip:Object;
      
      private var comofo:Qijinif;
      
      private var rutyf:Boolean;
      
      private var inputControl:BattleChatInput;
      
      private var input:TextField;
      
      private var output:Wohokoryk;
      
      private var nicagaqa:Boolean;
      
      private var _locked:Boolean;
      
      private var japove:Boolean;
      
      private var basyq:BattleTeam;
      
      private var tiwiduhe:IGameObject;
      
      public function Suku()
      {
         super();
         this.init();
      }
      
      public function set zamehoveb(_arg_1:Boolean) : void
      {
         if(this.rutyf != _arg_1)
         {
            this.rutyf = _arg_1;
            if(!this.nicagaqa)
            {
               this.output.visible = this.rutyf;
            }
         }
      }
      
      public function set locked(_arg_1:Boolean) : void
      {
         this._locked = _arg_1;
      }
      
      public function get hoqimolir() : Boolean
      {
         return this.nicagaqa;
      }
      
      public function qejep(_arg_1:String, _arg_2:BattleTeam, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean) : void
      {
         var _local_6:String = null;
         if(!_arg_5)
         {
            _local_6 = _arg_1;
            if(blockUserService.isBlocked(_local_6))
            {
               return;
            }
         }
         this.output.addLine(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         this.onResize();
      }
      
      public function fikaqu(_arg_1:String) : void
      {
         this.output.fikaqu(_arg_1);
         this.onResize();
      }
      
      public function clear() : void
      {
         this.output.clear();
      }
      
      public function tohiri() : void
      {
         var _local_1:ShortUserInfo = null;
         if(!(this.nicagaqa || this._locked))
         {
            this.output.visible = true;
            this.comofo.visible = this.comofo.getText().length > 0;
            if(!battleInfoService.spectator)
            {
               _local_1 = Pywy(OSGi.getInstance().getService(Pywy)).getShortUserInfo(userPropertiesService.userId);
               this.basyq = _local_1.teamType;
            }
            this.zilytuse();
            this.nicagaqa = true;
            this.input.text = "";
            this.inputControl.visible = true;
            display.stage.focus = this.input;
            this.onResize();
            norata.lock(Tyd.CHAT);
            battleEventDispatcher.dispatchEvent(new Movyf(Movyf.OPEN));
            this.radep();
            lijukysuw.lyregejiv();
         }
      }
      
      public function zyna(_arg_1:IGameObject) : void
      {
         this.tiwiduhe = _arg_1;
         this.japove = true;
      }
      
      private function radep() : void
      {
         if(battleInfoService.isSpectatorMode())
         {
            if(this.japove)
            {
               this.inputControl.setInputType(ChatInputType.YELLOW);
               this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_SPECTATORS));
            }
            else
            {
               this.inputControl.setInputType(ChatInputType.STANDART);
               this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_ALL));
            }
            return;
         }
         if(this.japove && this.basyq != BattleTeam.NONE)
         {
            if(this.basyq == BattleTeam.BLUE)
            {
               this.inputControl.setInputType(ChatInputType.BLUE);
            }
            else
            {
               this.inputControl.setInputType(ChatInputType.RED);
            }
            this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_TEAM));
         }
         else
         {
            this.inputControl.setInputType(ChatInputType.STANDART);
            this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_ALL));
         }
      }
      
      private function veq() : void
      {
         this.japove = !this.japove;
         this.radep();
      }
      
      public function nijav() : void
      {
         if(this.nicagaqa)
         {
            this.output.visible = this.rutyf;
            this.comofo.visible = false;
            this.comofo.setText("");
            if(this.inputControl.visible)
            {
               this.removeEventListeners();
               this.nicagaqa = false;
               this.inputControl.visible = false;
               this.baruz();
               this.output.puqifu();
               this.onResize();
            }
            norata.unlock(Tyd.CHAT);
            battleEventDispatcher.dispatchEvent(new Movyf(Movyf.CLOSE));
            lijukysuw.volof();
         }
      }
      
      private function init() : void
      {
         this.inputControl = new BattleChatInput();
         this.inputControl.tabEnabled = false;
         this.inputControl.tabChildren = false;
         this.inputControl.x = 10;
         addChild(this.inputControl);
         this.input = this.inputControl.textField;
         this.input.maxChars = 299;
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.onInputKeyUp);
         this.input.addEventListener(FocusEvent.FOCUS_IN,this.fafo);
         this.output = new Wohokoryk();
         this.output.visible = this.rutyf;
         this.output.tabEnabled = false;
         this.output.tabChildren = false;
         this.output.x = 10;
         addChild(this.output);
         this.comofo = new Qijinif();
         this.comofo.x = 10;
         this.comofo.visible = false;
         addChild(this.comofo);
         this.bery();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function bery() : void
      {
         this.nesunip = {};
         this.nesunip[this.jemipupor] = new Visipykif(this.output);
         this.nesunip[this.bupybu] = new Tidip(this.output);
      }
      
      public function jysawuky(_arg_1:String) : void
      {
         this.comofo.setText(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function setShowChat(_arg_1:Boolean) : void
      {
         this.zamehoveb = _arg_1;
      }
      
      private function zilytuse() : void
      {
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.roqepuj);
         if(fullscreenService.isAvailable())
         {
            display.stage.addEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.addEventListener(this.roq,this.onFullscreen);
         }
      }
      
      private function removeEventListeners() : void
      {
         this.input.removeEventListener(FocusEvent.FOCUS_OUT,this.roqepuj);
         if(fullscreenService.isAvailable())
         {
            display.stage.removeEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.removeEventListener(this.roq,this.onFullscreen);
         }
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         this.inputControl.visible = false;
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         var _local_2:Number = NaN;
         if(this.nicagaqa)
         {
            this.output.luteteqy();
         }
         var _local_3:int = int(0.25 * display.stage.stageWidth);
         var _local_4:int = kyb.vuwudedi();
         if(_local_4 != 0 && this.inputControl.x + _local_3 + 10 > _local_4)
         {
            _local_3 = _local_4 - this.inputControl.x - 10;
         }
         this.inputControl.width = _local_3;
         this.inputControl.y = display.stage.stageHeight - this.inputControl.height - 130;
         _local_2 = this.inputControl.y - this.output.height - 10;
         if(_local_2 < 50)
         {
            while(_local_2 < 50)
            {
               _local_2 += this.output.height;
               this.output.rac();
               _local_2 -= this.output.height;
            }
         }
         this.output.y = _local_2;
         this.comofo.telusedy(0.25 * display.stage.stageWidth);
         this.comofo.y = _local_2 - 120;
         if(this.nicagaqa)
         {
            this.radep();
         }
      }
      
      private function onInputKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(this.inputControl.visible)
         {
            if(_arg_1.keyCode == Keyboard.ENTER)
            {
               if(this.input.text != "")
               {
                  if(!this.pypuvi(this.input.text) && hasEventListener(Req.SEND_MESSAGE))
                  {
                     dispatchEvent(new Req(Req.SEND_MESSAGE,this.input.text,this.japove));
                  }
                  this.input.text = "";
               }
               _arg_1.keyCode = 0;
               this.nijav();
            }
            if(AlertUtils.isCancelKey(_arg_1.keyCode))
            {
               _arg_1.keyCode = 0;
               this.nijav();
            }
            if(_arg_1.keyCode == Keyboard.TAB)
            {
               this.veq();
            }
         }
      }
      
      private function pypuvi(_arg_1:String) : Boolean
      {
         if(_arg_1.charAt(0) != "/")
         {
            return false;
         }
         var _local_2:Array = _arg_1.split(/\s+/);
         if(_local_2.length == 0)
         {
            return false;
         }
         var _local_3:String = _local_2.shift();
         var _local_4:Lafo = this.nesunip[_local_3];
         if(_local_4 == null)
         {
            return false;
         }
         _local_4.pypuvi(_local_2);
         return true;
      }
      
      private function fafo(_arg_1:FocusEvent) : void
      {
         if(!this.nicagaqa)
         {
            this.baruz();
         }
      }
      
      private function roqepuj(_arg_1:FocusEvent) : void
      {
         if(Boolean(stage && this.input) && Boolean(this.inputControl) && this.inputControl.visible)
         {
            stage.focus = this.input;
         }
         else
         {
            this.nijav();
         }
      }
      
      private function onFullscreen(_arg_1:Event) : void
      {
         if(this.nicagaqa)
         {
            stage.focus = this.input;
         }
      }
      
      private function baruz() : void
      {
         if(display.stage.focus == this.input)
         {
            display.stage.focus = null;
         }
      }
   }
}

