package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.LocaleServiceLangValues;
   
   public class KeysBindingServiceImpl extends EventDispatcher implements KeysBindingService
   {
      
      public static const zan:int = 3;
      
      public static const BINDING_KEY_NOT_DEFINED:uint = 0;
      
      private var storageService:IStorageService;
      
      private var josuga:Dictionary = new Dictionary();
      
      private var vami:Dictionary = new Dictionary();
      
      private var defaultKeyLeft:uint;
      
      private var defaultBindings:Dictionary = new Dictionary();
      
      private var pyba:KeyCodesConverter;
      
      public function KeysBindingServiceImpl()
      {
         super();
         var _local_1:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.storageService = IStorageService(OSGi.getInstance().getService(IStorageService));
         this.defaultKeyLeft = _local_1.language == LocaleServiceLangValues.rimu ? uint(Keyboard.Y) : uint(Keyboard.Z);
         this.nulopah();
         this.jemaniro();
      }
      
      private static function ronaqak(_arg_1:uint) : Boolean
      {
         return _arg_1 == BINDING_KEY_NOT_DEFINED;
      }
      
      private static function kukeqi() : Vector.<uint>
      {
         return new Vector.<uint>(zan,true);
      }
      
      private function mitewiryv() : KeyCodesConverter
      {
         if(!this.pyba)
         {
            this.pyba = new KeyCodesConverter();
         }
         return this.pyba;
      }
      
      public function dowep(_arg_1:uint) : Boolean
      {
         return this.josuga[_arg_1] == null;
      }
      
      public function rof(_arg_1:GameActionEnum, _arg_2:uint, _arg_3:int) : Boolean
      {
         var _local_4:GameActionEnum = null;
         var _local_5:Vector.<uint> = null;
         var _local_6:int = 0;
         if(_arg_3 >= zan)
         {
            return false;
         }
         if(!this.dowep(_arg_2))
         {
            _local_4 = this.josuga[_arg_2];
            _local_5 = this.vami[_local_4];
            _local_6 = _local_5.indexOf(_arg_2);
            delete this.josuga[_arg_2];
            _local_5[_local_6] = BINDING_KEY_NOT_DEFINED;
            this.tat(_local_4,_local_5);
            dispatchEvent(new KeyBindingChangeEvent(KeyBindingChangeEvent.qici + _local_4.name,_local_4));
         }
         var _local_7:uint = this.ketucuk(_arg_1,_arg_3);
         if(!ronaqak(_local_7) && _local_7 != _arg_2)
         {
            delete this.josuga[_local_7];
         }
         this.josuga[_arg_2] = _arg_1;
         this.vami[_arg_1][_arg_3] = _arg_2;
         this.tat(_arg_1,this.vami[_arg_1]);
         return true;
      }
      
      private function tat(_arg_1:GameActionEnum, _arg_2:Vector.<uint> = null) : void
      {
         if(!_arg_2)
         {
            _arg_2 = kukeqi();
         }
         var _local_3:SharedObject = this.storageService.getStorage();
         _local_3.data[_arg_1.name] = _arg_2;
         _local_3.flush();
      }
      
      public function ketucuk(_arg_1:GameActionEnum, _arg_2:uint) : uint
      {
         if(_arg_2 >= zan)
         {
            return BINDING_KEY_NOT_DEFINED;
         }
         var _local_3:Vector.<uint> = this.vami[_arg_1];
         if(Boolean(_local_3))
         {
            return _local_3[_arg_2];
         }
         return BINDING_KEY_NOT_DEFINED;
      }
      
      public function pyrydere(_arg_1:GameActionEnum) : Vector.<uint>
      {
         return this.vami[_arg_1];
      }
      
      public function jikamybu(_arg_1:uint) : GameActionEnum
      {
         return this.josuga[_arg_1];
      }
      
      private function nulopah() : void
      {
         this.defaultBindings[GameActionEnum.ROTATE_TURRET_LEFT] = Vector.<uint>([this.defaultKeyLeft,Keyboard.COMMA,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.ROTATE_TURRET_RIGHT] = Vector.<uint>([Keyboard.X,Keyboard.PERIOD,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.CENTER_TURRET] = Vector.<uint>([Keyboard.C,Keyboard.SLASH,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.CHASSIS_LEFT_MOVEMENT] = Vector.<uint>([Keyboard.LEFT,Keyboard.A,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.CHASSIS_RIGHT_MOVEMENT] = Vector.<uint>([Keyboard.RIGHT,Keyboard.D,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.CHASSIS_FORWARD_MOVEMENT] = Vector.<uint>([Keyboard.UP,Keyboard.W,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.CHASSIS_BACKWARD_MOVEMENT] = Vector.<uint>([Keyboard.DOWN,Keyboard.S,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.FOLLOW_CAMERA_UP] = Vector.<uint>([Keyboard.PAGE_UP,Keyboard.LEFTBRACKET,Keyboard.Q]);
         this.defaultBindings[GameActionEnum.FOLLOW_CAMERA_DOWN] = Vector.<uint>([Keyboard.PAGE_DOWN,Keyboard.RIGHTBRACKET,Keyboard.E]);
         this.defaultBindings[GameActionEnum.DROP_FLAG] = Vector.<uint>([Keyboard.F,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.BATTLE_PAUSE] = Vector.<uint>([Keyboard.P,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,Keyboard.EQUAL,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.O,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.FULL_SCREEN] = Vector.<uint>([Keyboard.O,Keyboard.F11,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.NUMPAD_SUBTRACT,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.SUICIDE] = Vector.<uint>([Keyboard.DELETE,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.SHOW_TANK_PARAMETERS] = Vector.<uint>([Keyboard.V,Keyboard.R,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.USE_FIRS_AID] = Vector.<uint>([Keyboard.NUMBER_1,Keyboard.NUMPAD_1,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.USE_DOUBLE_ARMOR] = Vector.<uint>([Keyboard.NUMBER_2,Keyboard.NUMPAD_2,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.USE_DOUBLE_DAMAGE] = Vector.<uint>([Keyboard.NUMBER_3,Keyboard.NUMPAD_3,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.USE_NITRO] = Vector.<uint>([Keyboard.NUMBER_4,Keyboard.NUMPAD_4,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.USE_MINE] = Vector.<uint>([Keyboard.NUMBER_5,Keyboard.NUMPAD_5,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.DROP_GOLD_BOX] = Vector.<uint>([Keyboard.NUMBER_6,Keyboard.NUMPAD_6,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.SHOT] = Vector.<uint>([Keyboard.SPACE,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.ULTIMATE] = Vector.<uint>([Keyboard.SHIFT,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
         this.defaultBindings[GameActionEnum.OPEN_GARAGE] = Vector.<uint>([Keyboard.G,BINDING_KEY_NOT_DEFINED,BINDING_KEY_NOT_DEFINED]);
      }
      
      private function femywo(_arg_1:GameActionEnum, _arg_2:Vector.<uint>) : void
      {
         var _local_3:int = 0;
         if(!_arg_2)
         {
            _arg_2 = this.defaultBindings[_arg_1];
            if(!_arg_2)
            {
               _arg_2 = kukeqi();
            }
         }
         this.vami[_arg_1] = _arg_2;
         while(_local_3 < zan)
         {
            this.rof(_arg_1,_arg_2[_local_3],_local_3);
            _local_3++;
         }
      }
      
      public function rekomatow() : void
      {
         var _local_1:GameActionEnum = null;
         this.vami = new Dictionary();
         this.josuga = new Dictionary();
         for each(_local_1 in GameActionEnum.values)
         {
            this.femywo(_local_1,this.defaultBindings[_local_1].concat());
         }
      }
      
      private function jemaniro() : void
      {
         var _local_1:GameActionEnum = null;
         var _local_2:SharedObject = this.storageService.getStorage();
         for each(_local_1 in GameActionEnum.values)
         {
            this.femywo(_local_1,_local_2.data[_local_1.name]);
         }
      }
      
      public function zicovuqo(_arg_1:uint) : String
      {
         return this.mitewiryv().wysajog(_arg_1);
      }
   }
}

