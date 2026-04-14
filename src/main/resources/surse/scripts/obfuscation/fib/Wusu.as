package obfuscation.fib
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Wusu implements Zuly, AutoClosable
   {
      
      private var rif:Tank;
      
      public function Wusu(_arg_1:Tank)
      {
         super();
         this.rif = _arg_1;
      }
      
      public function handleReadyToSpawn() : void
      {
         var _local_1:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_1.removeTankFromBattle(this.rif);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.rif = null;
      }
   }
}

