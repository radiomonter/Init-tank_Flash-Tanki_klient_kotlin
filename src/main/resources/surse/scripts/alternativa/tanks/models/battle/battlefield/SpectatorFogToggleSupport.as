package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class SpectatorFogToggleSupport
   {
      
      [Inject]
      public static var qakygyju:IDisplay;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const nozohor:uint = Keyboard.F8;
      
      public function SpectatorFogToggleSupport()
      {
         super();
         qakygyju.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == nozohor && !bafat.miwyraze())
         {
            battleService.getBattleScene3D().tecihefew();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         qakygyju.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
   }
}

