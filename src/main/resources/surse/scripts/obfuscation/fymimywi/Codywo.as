package obfuscation.fymimywi
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.gui.statistics.messages.KillMessageOutputLine;
   import flash.display.Sprite;
   import flash.events.Event;
   import obfuscation.joni.ShortUserInfo;
   import projects.tanks.client.battlefield.types.DamageType;
   
   public class Codywo extends Sprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      private var output:Nofir = new Nofir();
      
      public function Codywo()
      {
         super();
         addChild(this.output);
         this.output.tabEnabled = false;
         this.output.tabChildren = false;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onStageResize);
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onStageResize);
      }
      
      public function onStageResize(_arg_1:Event) : void
      {
         this.naboc();
      }
      
      private function naboc() : void
      {
         this.output.x = display.stage.stageWidth;
         this.output.y = 50;
      }
      
      public function addMessage(_arg_1:ShortUserInfo, _arg_2:String, _arg_3:ShortUserInfo = null) : void
      {
         this.output.addLine(new Quhohi(_arg_1,_arg_2,_arg_3));
         this.naboc();
      }
      
      public function addKillMessage(param1:ShortUserInfo, param2:ShortUserInfo, param3:DamageType) : void
      {
         this.output.addLine(new KillMessageOutputLine(param1,param2,param3));
         this.naboc();
      }
   }
}

