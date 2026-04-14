package obfuscation.cawutare
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.TankControlLockBits;
   import alternativa.tanks.models.tank.Hytaqe;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import flash.events.Event;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Vicytiwil implements AutoClosable
   {
      
      [Inject]
      public static var display:IDisplay;
      
      private var gurym:ClientObject;
      
      public function Vicytiwil(_arg_1:ClientObject)
      {
         super();
         this.gurym = _arg_1;
         display.stage.addEventListener(Event.ACTIVATE,this.wafojewy);
         display.stage.addEventListener(Event.DEACTIVATE,this.gaduno);
      }
      
      private function wafojewy(_arg_1:Event) : void
      {
         var _local_2:Hytaqe = this.sihobi();
         _local_2.fygojamo(TankControlLockBits.CLIENT);
      }
      
      private function gaduno(_arg_1:Event) : void
      {
         var _local_2:Hytaqe = this.sihobi();
         _local_2.covymyf(TankControlLockBits.CLIENT,true);
      }
      
      private function sihobi() : Hytaqe
      {
         var _local_1:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         return _local_1.sihobi(this.gurym);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.gurym = null;
         display.stage.removeEventListener(Event.ACTIVATE,this.wafojewy);
         display.stage.removeEventListener(Event.DEACTIVATE,this.gaduno);
      }
   }
}

