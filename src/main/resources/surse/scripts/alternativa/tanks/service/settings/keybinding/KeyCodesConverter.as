package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class KeyCodesConverter
   {
      
      private static var fyjyfido:Dictionary;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function KeyCodesConverter()
      {
         super();
         this.vilo();
      }
      
      public function wysajog(_arg_1:uint) : String
      {
         var _local_2:String = fyjyfido[_arg_1];
         return _local_2 == null ? "" : _local_2;
      }
      
      private function vilo() : void
      {
         fyjyfido = new Dictionary();
         fyjyfido[Keyboard.NUMBER_0] = "0";
         fyjyfido[Keyboard.NUMBER_1] = "1";
         fyjyfido[Keyboard.NUMBER_2] = "2";
         fyjyfido[Keyboard.NUMBER_3] = "3";
         fyjyfido[Keyboard.NUMBER_4] = "4";
         fyjyfido[Keyboard.NUMBER_5] = "5";
         fyjyfido[Keyboard.NUMBER_6] = "6";
         fyjyfido[Keyboard.NUMBER_7] = "7";
         fyjyfido[Keyboard.NUMBER_8] = "8";
         fyjyfido[Keyboard.NUMBER_9] = "9";
         fyjyfido[Keyboard.MINUS] = "-";
         fyjyfido[Keyboard.EQUAL] = "=";
         fyjyfido[Keyboard.Q] = "Q";
         fyjyfido[Keyboard.W] = "W";
         fyjyfido[Keyboard.E] = "E";
         fyjyfido[Keyboard.R] = "R";
         fyjyfido[Keyboard.T] = "T";
         fyjyfido[Keyboard.Y] = "Y";
         fyjyfido[Keyboard.U] = "U";
         fyjyfido[Keyboard.I] = "I";
         fyjyfido[Keyboard.O] = "O";
         fyjyfido[Keyboard.P] = "P";
         fyjyfido[Keyboard.A] = "A";
         fyjyfido[Keyboard.S] = "S";
         fyjyfido[Keyboard.D] = "D";
         fyjyfido[Keyboard.F] = "F";
         fyjyfido[Keyboard.G] = "G";
         fyjyfido[Keyboard.H] = "H";
         fyjyfido[Keyboard.J] = "J";
         fyjyfido[Keyboard.K] = "K";
         fyjyfido[Keyboard.L] = "L";
         fyjyfido[Keyboard.Z] = "Z";
         fyjyfido[Keyboard.X] = "X";
         fyjyfido[Keyboard.C] = "C";
         fyjyfido[Keyboard.V] = "V";
         fyjyfido[Keyboard.B] = "B";
         fyjyfido[Keyboard.N] = "N";
         fyjyfido[Keyboard.M] = "M";
         fyjyfido[Keyboard.LEFT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_LEFT);
         fyjyfido[Keyboard.UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_UP);
         fyjyfido[Keyboard.RIGHT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_RIGHT);
         fyjyfido[Keyboard.DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_DOWN);
         fyjyfido[Keyboard.NUMPAD_0] = "NumPad 0";
         fyjyfido[Keyboard.NUMPAD_1] = "NumPad 1";
         fyjyfido[Keyboard.NUMPAD_2] = "NumPad 2";
         fyjyfido[Keyboard.NUMPAD_3] = "NumPad 3";
         fyjyfido[Keyboard.NUMPAD_4] = "NumPad 4";
         fyjyfido[Keyboard.NUMPAD_5] = "NumPad 5";
         fyjyfido[Keyboard.NUMPAD_6] = "NumPad 6";
         fyjyfido[Keyboard.NUMPAD_7] = "NumPad 7";
         fyjyfido[Keyboard.NUMPAD_8] = "NumPad 8";
         fyjyfido[Keyboard.NUMPAD_9] = "NumPad 9";
         fyjyfido[Keyboard.NUMPAD_ADD] = "NumPad +";
         fyjyfido[Keyboard.NUMPAD_SUBTRACT] = "NumPad -";
         fyjyfido[Keyboard.NUMPAD_DECIMAL] = "NumPad .";
         fyjyfido[Keyboard.NUMPAD_DIVIDE] = "NumPad /";
         fyjyfido[Keyboard.NUMPAD_ENTER] = "NumPad Enter";
         fyjyfido[Keyboard.LEFTBRACKET] = "[";
         fyjyfido[Keyboard.RIGHTBRACKET] = "]";
         fyjyfido[Keyboard.BACKSLASH] = "\\";
         fyjyfido[Keyboard.SEMICOLON] = ";";
         fyjyfido[Keyboard.QUOTE] = "\'";
         fyjyfido[Keyboard.COMMA] = ",";
         fyjyfido[Keyboard.PERIOD] = ".";
         fyjyfido[Keyboard.SLASH] = "/";
         fyjyfido[Keyboard.PAGE_DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_DN);
         fyjyfido[Keyboard.PAGE_UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_UP);
         fyjyfido[Keyboard.SPACE] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_SPACE);
         fyjyfido[Keyboard.SHIFT] = "Shift";
      }
   }
}

