package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowFormEvent;
   import org.robotlegs.mvcs.Command;
   
   public class Honakuqiw extends Command
   {
      
      public function Honakuqiw()
      {
         super();
      }
      
      override public function execute() : void
      {
         dispatch(new ShowFormEvent(ShowFormEvent.SHOW_INVITE_FORM));
      }
   }
}

