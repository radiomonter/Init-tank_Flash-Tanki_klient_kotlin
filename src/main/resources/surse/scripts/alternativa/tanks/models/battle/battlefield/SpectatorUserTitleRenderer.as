package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.battle.UserTitleRenderer;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class SpectatorUserTitleRenderer implements UserTitleRenderer, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var kybewu:SpectatorService;
      
      private const tov:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function SpectatorUserTitleRenderer()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.dejysa.ciqon();
         clearDictionary(this.tov);
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         this.tov[_arg_1.tank] = true;
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         delete this.tov[_arg_1.tank];
      }
      
      public function zadajav() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.tov)
         {
            this.laro(_local_1);
         }
      }
      
      private function laro(_arg_1:Tank) : void
      {
         if(_arg_1.tankData.health > 0 && kybewu.jocytaruj())
         {
            _arg_1.weka();
         }
         else
         {
            _arg_1.wep();
         }
      }
   }
}

