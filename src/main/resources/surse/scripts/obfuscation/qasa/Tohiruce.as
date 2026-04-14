package obfuscation.qasa
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Qeluzajy;
   import alternativa.tanks.models.battle.battlefield.BattleModel;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import obfuscation.bude.BattleTeam;
   import obfuscation.fatik.Tevozyta;
   import obfuscation.fatik.Zer;
   import obfuscation.fizeg.Camysukat;
   import obfuscation.fizeg.Zalizanef;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   
   public class Tohiruce extends Camysukat implements Zalizanef, ObjectLoadPostListener, ObjectUnloadListener, BattleEventListener, BattleModel
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var qedohat:Vector.<TeamDMTargetEvaluator>;
      
      public function Tohiruce()
      {
         super();
      }
      
      public function hapyqyv() : BattleType
      {
         return BattleType.TDM;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.qedohat = new Vector.<TeamDMTargetEvaluator>();
         var _local_1:Nubiwywyg = new Nubiwywyg();
         battleService.lipa(_local_1);
         this.qedohat.push(_local_1);
         var _local_2:Mowupime = new Mowupime();
         battleService.nygeq(_local_2);
         this.qedohat.push(_local_2);
         var _local_3:Hysuwes = new Hysuwes();
         battleService.cocuk(_local_3);
         this.qedohat.push(_local_3);
         var _local_4:Tevozyta = new Tevozyta();
         battleService.sipase(_local_4);
         this.qedohat.push(_local_4);
         battleEventDispatcher.pugu(Qeluzajy,this);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.qedohat = null;
         battleService.lipa(null);
         battleService.nygeq(null);
         battleService.cocuk(null);
         battleService.sipase(null);
         battleEventDispatcher.kujo(Qeluzajy,this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:TeamDMTargetEvaluator = null;
         var _local_3:BattleTeam = Qeluzajy(_arg_1).tank.teamType;
         for each(_local_2 in this.qedohat)
         {
            _local_2.bobaku(_local_3);
         }
      }
      
      public function gemokir() : Zer
      {
         var _local_1:Tevozyta = new Tevozyta();
         this.qedohat.push(_local_1);
         return _local_1;
      }
   }
}

