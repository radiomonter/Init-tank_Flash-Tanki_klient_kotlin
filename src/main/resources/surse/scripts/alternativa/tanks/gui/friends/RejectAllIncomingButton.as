package alternativa.tanks.gui.friends
{
   public class RejectAllIncomingButton extends FriendWindowButton implements IRejectAllIncomingButtonEnabled
   {
      
      public function RejectAllIncomingButton()
      {
         super();
      }
      
      public function setEnable(_arg_1:Boolean) : void
      {
         super.enable = _arg_1;
      }
   }
}

