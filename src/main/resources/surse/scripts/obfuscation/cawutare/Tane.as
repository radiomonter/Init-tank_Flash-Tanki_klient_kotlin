package obfuscation.cawutare
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Tane implements AutoClosable, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var fyz:Tank;
      
      private var dejysa:Baba;
      
      public function Tane(_arg_1:Tank)
      {
         super();
         this.fyz = _arg_1;
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.jikina(Vegepos,this.vut);
         this.dejysa.jikina(Vovakopy,this.byzac);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         var _local_2:TankModel = null;
         if(_arg_1.tank == this.fyz)
         {
            _local_2 = TankModel(OSGi.getInstance().getService(ITankModel));
            _local_2.nowe();
         }
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         var _local_2:TankModel = null;
         if(_arg_1.tank == this.fyz)
         {
            _local_2 = TankModel(OSGi.getInstance().getService(ITankModel));
            _local_2.kero();
         }
      }
      
      private function vut(_arg_1:Vegepos) : void
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_2.lysi(_arg_1.kum);
      }
      
      private function byzac(_arg_1:Object) : void
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_2.kero();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.dejysa.ciqon();
         this.dejysa = null;
         this.fyz = null;
      }
   }
}

