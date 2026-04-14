package obfuscation.lin
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.models.tank.ITankModel;
   
   public class Sarocely implements BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var user:ClientObject;
      
      private var rankIndex:int;
      
      public function Sarocely(_arg_1:ClientObject, _arg_2:int)
      {
         super();
         this.user = _arg_1;
         this.rankIndex = _arg_2;
         battleEventDispatcher.pugu(Senyveky,this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Zyhogy = null;
         var _local_3:Senyveky = Senyveky(_arg_1);
         var _local_4:ITankModel = ITankModel(OSGi.getInstance().getService(ITankModel));
         if(_local_3.tank == _local_4.getTankData(this.user).tank)
         {
            _local_2 = Zyhogy(OSGi.getInstance().getService(Zyhogy));
            _local_2.lud(_local_3.tank,this.rankIndex);
            this.close();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.user = null;
         battleEventDispatcher.kujo(Senyveky,this);
      }
   }
}

