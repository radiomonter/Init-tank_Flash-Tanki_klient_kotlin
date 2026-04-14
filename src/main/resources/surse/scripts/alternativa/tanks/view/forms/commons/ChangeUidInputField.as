package alternativa.tanks.view.forms.commons
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controller.events.CheckCallsignEvent;
   import alternativa.tanks.view.bubbles.Bubble;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.freeuids.FreeUidsForm;
   import alternativa.tanks.view.forms.freeuids.FreeUidsFormEvent;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import base.DiscreteSprite;
   import controls.base.TankInputBase;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.events.LoginFormEvent;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   
   public class ChangeUidInputField extends DiscreteSprite
   {
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var display:IDisplay;
      
      private var _callsignInput:TankInputBase;
      
      private var _checkCallsignTimer:Timer;
      
      private var _freeUidsForm:FreeUidsForm;
      
      private var _callsignValidated:Boolean;
      
      private var _callSignCheckIcon:ValidationIcon;
      
      private var _nameIsNotUniqueBubble:Bubble;
      
      private var _nameIsIncorrectBubble:Bubble;
      
      private var _symbolIsNotAllowedBubble:Bubble;
      
      private var _isFreeUidsFormAlreadyShowed:Boolean;
      
      private var _inputFieldWidth:int;
      
      public function ChangeUidInputField()
      {
         super();
         this.init();
      }
      
      public function init() : void
      {
         this._callsignInput = new TankInputBase();
         this._callsignInput.maxChars = RegistrationCommonElementsSection.MAX_CHARS_CALLSIGN;
         this._callsignInput.validValue = true;
         addChild(this._callsignInput);
         this._callSignCheckIcon = new ValidationIcon();
         addChild(this._callSignCheckIcon);
         this._freeUidsForm = new FreeUidsForm();
         addChild(this._freeUidsForm);
         this._nameIsNotUniqueBubble = EntranceBubbleFactory.nameIsNotUniqueBubble();
         this._nameIsIncorrectBubble = EntranceBubbleFactory.nameIsIncorrectBubble();
         this._symbolIsNotAllowedBubble = EntranceBubbleFactory.symbolIsNotAllowedBubble();
         this._checkCallsignTimer = new Timer(500,1);
         display.stage.focus = this._callsignInput.textField;
         this.addEventListeners();
         this.alignElements();
      }
      
      private function addEventListeners() : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this._callsignInput.textField.addEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
         this._callsignInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._checkCallsignTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         this.removeEventListeners();
      }
      
      private function removeEventListeners() : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this._callsignInput.textField.removeEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
         this._callsignInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._checkCallsignTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
      }
      
      private function alignElements() : void
      {
         this._callsignInput.width = this._inputFieldWidth;
         this._callSignCheckIcon.x = this._callsignInput.x + this._inputFieldWidth - 25;
         this._callSignCheckIcon.y = this._callsignInput.y + 7;
         this._freeUidsForm.x = this._callsignInput.x;
         this._freeUidsForm.y = this._callsignInput.y + this._callsignInput.height;
         this._freeUidsForm.width = this._inputFieldWidth;
      }
      
      private function onCallsignFocusIn(_arg_1:FocusEvent) : void
      {
         if(this._isFreeUidsFormAlreadyShowed)
         {
            this._nameIsNotUniqueBubble.visible = false;
            this._freeUidsForm.show();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function onCallsignChanged(_arg_1:LoginFormEvent = null) : void
      {
         this._callsignValidated = true;
         this._callsignInput.validValue = true;
         this._nameIsIncorrectBubble.hide();
         this._nameIsNotUniqueBubble.hide();
         this._symbolIsNotAllowedBubble.hide();
         this._callSignCheckIcon.turnOff();
         this._isFreeUidsFormAlreadyShowed = false;
         this.hideFreeUidsForm();
         this._checkCallsignTimer.reset();
         this._checkCallsignTimer.start();
         var _local_2:String = this._callsignInput.value;
         if(!validateService.isValidIdentificationStringForRegistration(_local_2))
         {
            this._callsignInput.value = _local_2.replace(ValidateService.NOT_ALLOWED_PATTERN_FOR_REGISTRATION,"");
            this.alertAboutSymbolIsNotAllowed();
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onFreeUidsFormSelectedItem(_arg_1:FreeUidsFormEvent) : void
      {
         this.callsign = _arg_1.uid;
         this.hideFreeUidsForm();
      }
      
      private function onFreeUidsFormFocusOut(_arg_1:FreeUidsFormEvent) : void
      {
         this.hideFreeUidsForm();
      }
      
      private function hideFreeUidsForm() : void
      {
         this._freeUidsForm.hide();
         this._nameIsNotUniqueBubble.visible = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function alertAboutSymbolIsNotAllowed() : void
      {
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._symbolIsNotAllowedBubble);
      }
      
      private function onCallsignCheckTimerComplete(_arg_1:TimerEvent = null) : void
      {
         if(validateService.isUidValid(this._callsignInput.value))
         {
            this._callSignCheckIcon.startProgress();
            dispatchEvent(new CheckCallsignEvent(this.callsign));
         }
         else
         {
            this._callsignInput.validValue = true;
            this._symbolIsNotAllowedBubble.hide();
            this._callSignCheckIcon.turnOff();
            if(this._callsignInput.value.length != 0)
            {
               this.alertAboutIncorrectUid();
            }
         }
      }
      
      public function alertAboutFreeUid() : void
      {
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = true;
         this._callsignValidated = true;
         this._callSignCheckIcon.markAsValid();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function alertAboutBusyUid(_arg_1:Vector.<String>) : void
      {
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._nameIsNotUniqueBubble);
         this._nameIsNotUniqueBubble.visible = true;
         if(_arg_1.length != 0)
         {
            this._isFreeUidsFormAlreadyShowed = true;
            this._nameIsNotUniqueBubble.visible = false;
            this._freeUidsForm.create(_arg_1);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function alertAboutIncorrectUid() : void
      {
         this._callsignValidated = false;
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._nameIsIncorrectBubble);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get callsign() : String
      {
         return this._callsignInput.textField.text;
      }
      
      public function set callsign(_arg_1:String) : void
      {
         this._callsignInput.value = _arg_1;
         display.stage.focus = this._callsignInput.textField;
         if(_arg_1.length != 0)
         {
            this.onCallsignChanged();
            this._callsignInput.textField.setSelection(_arg_1.length,_arg_1.length);
         }
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._inputFieldWidth = int(_arg_1);
         this.alignElements();
      }
      
      override public function get width() : Number
      {
         return this._inputFieldWidth;
      }
      
      override public function get height() : Number
      {
         return this._callsignInput.height;
      }
      
      public function isUidValid() : Boolean
      {
         return this._callsignValidated;
      }
      
      public function setLabelText(_arg_1:String) : void
      {
         this._callsignInput.label = _arg_1;
      }
      
      public function isOpenFreeUidsForm() : Boolean
      {
         return this._freeUidsForm.visible;
      }
   }
}

