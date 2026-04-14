package alternativa.tanks.models.battle.gui.chat
{
   import flash.events.Event;
   
   public class Req extends Event
   {
      
      public static const SEND_MESSAGE:String = "sendMessage";
      
      private var _message:String;
      
      private var japove:Boolean;
      
      public function Req(_arg_1:String, _arg_2:String, _arg_3:Boolean)
      {
         super(_arg_1);
         this._message = _arg_2;
         this.japove = _arg_3;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get huvipunuk() : Boolean
      {
         return this.japove;
      }
      
      [Obfuscation(rename="false")]
      override public function clone() : Event
      {
         return new Req(type,this._message,this.japove);
      }
      
      [Obfuscation(rename="false")]
      override public function toString() : String
      {
         return "[BattleChatEvent type=" + type + ", message=" + this._message + ", teamOnly=" + this.japove + "]";
      }
   }
}

