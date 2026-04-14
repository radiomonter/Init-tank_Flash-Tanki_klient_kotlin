package obfuscation.likohot
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.TankControlLockBits;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Luv;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.cawutare.Gotowo;
   import obfuscation.siw.Gyfira;
   
   public class Niqyvu implements Pahu, Gyfira
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var sul:Luv = new Luv();
      
      private var qihipek:Gotowo;
      
      public function Niqyvu()
      {
         super();
      }
      
      public function localTankLoaded() : void
      {
         var _local_1:Boolean = battleService.holyh();
         this.qihipek = new Gotowo(Num.cimise.tank,this.sul,_local_1);
      }
      
      public function tinacys() : void
      {
         battleService.hadapag(true);
         var _local_1:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_1.rusif(Num.cimise.user,TankControlLockBits.PAUSE);
         _local_1.sihobi(Num.cimise.user).covymyf(TankControlLockBits.PAUSE,true);
         Network(OSGi.getInstance().getService(INetworker)).send("battle;enabledPause");
      }
      
      public function cymug() : void
      {
         battleService.hadapag(false);
         var _local_1:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_1.lyli(Num.cimise.user,TankControlLockBits.PAUSE);
         _local_1.sihobi(Num.cimise.user).fygojamo(TankControlLockBits.PAUSE);
         this.dydikigi();
         Network(OSGi.getInstance().getService(INetworker)).send("battle;disablePause");
      }
      
      public function dydikigi() : void
      {
         this.sul.reset(battleService.duzyna());
      }
      
      public function getPauseSupport() : Gotowo
      {
         return this.qihipek;
      }
   }
}

