package obfuscation.fib
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Ditor;
   import alternativa.tanks.battle.events.Qamy;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   
   public class Mygopete implements Zuly, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var fyz:Tank;
      
      private var dejysa:Baba;
      
      private var zagi:Boolean;
      
      private var gyba:Boolean;
      
      public function Mygopete(_arg_1:Tank)
      {
         super();
         this.fyz = _arg_1;
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Qamy,this.hicabumek);
         this.dejysa.jikina(Ditor,this.jago);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      private function hicabumek(_arg_1:Object) : void
      {
         this.zagi = true;
      }
      
      private function jago(_arg_1:Object) : void
      {
         this.zagi = false;
         if(this.gyba)
         {
            this.ciroquhi();
         }
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         if(_arg_1.tank == this.fyz)
         {
            this.gyba = false;
         }
      }
      
      public function handleReadyToSpawn() : void
      {
         var _local_1:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_1.removeTankFromBattle(Num.cimise.tank);
         if(this.zagi)
         {
            this.gyba = true;
         }
         else
         {
            this.ciroquhi();
         }
      }
      
      private function ciroquhi() : void
      {
         this.gyba = false;
         Network(OSGi.getInstance().getService(INetworker)).send("battle;readyToSpawn");
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.fyz = null;
         this.dejysa.ciqon();
         this.dejysa = null;
      }
   }
}

