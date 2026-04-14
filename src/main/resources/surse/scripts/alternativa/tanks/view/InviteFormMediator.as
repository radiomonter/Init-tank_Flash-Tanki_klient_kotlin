package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.Degagi;
   import alternativa.tanks.controller.events.InviteCheckResultEvent;
   import alternativa.tanks.view.events.InviteFormOkButtonEvent;
   import alternativa.tanks.view.forms.Nacufus;
   import org.robotlegs.mvcs.Mediator;
   
   public class InviteFormMediator extends Mediator
   {
      
      [Inject]
      public var view:Nacufus;
      
      public function InviteFormMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(InviteFormOkButtonEvent.OK_BUTTON_CLICKED,this.buj,InviteFormOkButtonEvent);
         addContextListener(InviteCheckResultEvent.INVITE_CODE_DOES_NOT_EXIST,this.qigefiwo,InviteCheckResultEvent);
      }
      
      private function qigefiwo(_arg_1:InviteCheckResultEvent) : void
      {
         this.view.showInviteError();
      }
      
      private function buj(_arg_1:InviteFormOkButtonEvent) : void
      {
         dispatch(new Degagi(this.view.code));
      }
   }
}

