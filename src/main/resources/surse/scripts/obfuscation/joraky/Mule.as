package obfuscation.joraky
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import obfuscation.cetij.Feso;
   import obfuscation.cetij.Meqisyn;
   import obfuscation.cetij.Pisodyhi;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Mule implements AutoClosable, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var jij:IGameObject;
      
      private var qevi:String;
      
      private var bedobuby:String;
      
      private var poseqoqed:String;
      
      public function Mule()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.qevi = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_SUICIDED);
         this.bedobuby = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_KILLED);
         this.poseqoqed = localeService.getText(TanksLocale.TEXT_REARM_BATTLE_EVENT);
         battleEventDispatcher.pugu(Meqisyn,this);
         battleEventDispatcher.pugu(Feso,this);
         battleEventDispatcher.pugu(Pisodyhi,this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Meqisyn = null;
         var _local_3:Feso = null;
         var _local_4:Pisodyhi = null;
         var _local_5:Tupebeput = Tupebeput(OSGi.getInstance().getService(Tupebeput));
         if(_arg_1 is Meqisyn)
         {
            _local_2 = Meqisyn(_arg_1);
            if(_local_2.syzoteno != _local_2.syd)
            {
               _local_5.addKillMessage(_local_2.syzoteno,_local_2.syd,_local_2.damageType);
            }
            else
            {
               _local_5.logUserAction(_local_2.syd,this.qevi,null);
            }
         }
         else if(_arg_1 is Feso)
         {
            _local_3 = Feso(_arg_1);
            _local_5.logUserAction(_local_3.cuzipin.id,this.qevi,null);
         }
         else if(_arg_1 is Pisodyhi)
         {
            _local_4 = Pisodyhi(_arg_1);
            _local_5.kemovypy(_local_4.userId,this.poseqoqed);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.jij = null;
         battleEventDispatcher.kujo(Meqisyn,this);
         battleEventDispatcher.kujo(Feso,this);
         battleEventDispatcher.kujo(Pisodyhi,this);
      }
   }
}

