package alternativa.tanks.gui.friends
{
   public class FriendsWindowState
   {
      
      public static const ACCEPTED:FriendsWindowState = new FriendsWindowState(0);
      
      public static const OUTGOING:FriendsWindowState = new FriendsWindowState(1);
      
      public static const INCOMING:FriendsWindowState = new FriendsWindowState(2);
      
      private var _value:int;
      
      public function FriendsWindowState(_arg_1:int)
      {
         super();
         this._value = _arg_1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
   }
}

