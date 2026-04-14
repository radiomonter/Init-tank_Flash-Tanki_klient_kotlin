package alternativa.tanks.models.tank.spawn
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.utils.MathUtils;
   
   public class Nava implements LogicUnit, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      private var sinegafuw:int;
      
      private var tank:Tank;
      
      private var dejysa:Baba;
      
      public function Nava(_arg_1:int, _arg_2:Tank)
      {
         super();
         this.sinegafuw = _arg_1;
         this.tank = _arg_2;
         this.pec(battleEventDispatcher);
      }
      
      private function pec(_arg_1:BattleEventDispatcher) : void
      {
         this.dejysa = new Baba(_arg_1,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.jikina(Vovakopy,this.ruqovire);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.tank.bij().setAlpha(MathUtils.clamp((this.sinegafuw - _arg_1) / 500,0,1));
         if(_arg_1 > this.sinegafuw)
         {
            this.stop();
            TankModel(OSGi.getInstance().getService(ITankModel)).removeTankFromBattle(this.tank);
            TankModel(OSGi.getInstance().getService(ITankModel)).readyToSpawn(this.tank);
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         if(_arg_1.tank == this.tank)
         {
            this.stop();
         }
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         if(_arg_1.tank == this.tank)
         {
            this.stop();
         }
      }
      
      private function ruqovire(_arg_1:Vovakopy) : void
      {
         this.stop();
      }
      
      private function stop() : void
      {
         battleService.getBattleRunner().bapucic(this);
         this.dejysa.ciqon();
      }
   }
}

