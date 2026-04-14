package obfuscation.gomavik
{
   import alternativa.tanks.gui.settings.Nyviz;
   
   public class ReceivePersonalMessagesSettingEvent extends Nyviz
   {
      
      public static var zido:String = "ReceivePersonalMessagesSettingEvent";
      
      private var value:Boolean;
      
      public function ReceivePersonalMessagesSettingEvent(_arg_1:String, _arg_2:Boolean)
      {
         super(_arg_1);
         this.value = _arg_2;
      }
      
      public function getValue() : Boolean
      {
         return this.value;
      }
   }
}

