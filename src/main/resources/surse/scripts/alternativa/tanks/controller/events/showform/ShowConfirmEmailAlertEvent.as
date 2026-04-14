package alternativa.tanks.controller.events.showform
{
   import flash.events.Event;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   
   public class ShowConfirmEmailAlertEvent extends Event
   {
      
      public static const SHOW:String = "ShowConfirmEmailAlertEvent.SHOW";
      
      public var status:ConfirmEmailStatus;
      
      public function ShowConfirmEmailAlertEvent(_arg_1:ConfirmEmailStatus)
      {
         super(SHOW);
         this.status = _arg_1;
      }
      
      override public function clone() : Event
      {
         return new ShowConfirmEmailAlertEvent(this.status);
      }
   }
}

