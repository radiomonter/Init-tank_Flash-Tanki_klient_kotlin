package alternativa.tanks.models.battle.jgr.killstreak
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import obfuscation.joraky.Kyfaciki;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.rofa.Sound3D;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.IKillStreakModelBase;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.KillStreakItem;
   import projects.tanks.client.battlefield.models.battle.jgr.killstreak.KillStreakModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class KillStreakModel extends KillStreakModelBase implements IKillStreakModelBase, ObjectLoadListener
   {
      
      [Inject]
      public static var battleInfoService:BattleInfoService = BattleInfoService(OSGi.getInstance().getService(IBattleInfoService));
      
      private static const KILLSTREAK_VOLUME:Number = 0.9;
      
      private var killStreaks:Vector.<KillStreakClientItem> = new Vector.<KillStreakClientItem>();
      
      public function KillStreakModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_2:KillStreakItem = null;
         var _local_3:Sound3D = null;
         var _local_1:int = 0;
         this.killStreaks.length = getInitParam().items.length;
         while(_local_1 < getInitParam().items.length)
         {
            _local_2 = getInitParam().items[_local_1];
            _local_3 = Sound3D.create(_local_2.sound.sound);
            _local_3.volume = KILLSTREAK_VOLUME;
            this.killStreaks[_local_1] = new KillStreakClientItem(_local_2.messageToBoss,_local_2.messageToVictims,_local_3);
            _local_1++;
         }
      }
      
      public function killStreakAchived(_arg_1:int, _arg_2:String) : void
      {
         var _local_4:String = null;
         var _local_6:Sound3D = null;
         var _local_2:KillStreakClientItem = this.killStreaks[_arg_1];
         _local_4 = _local_2.messageToVictims;
         var _local_5:String = _arg_2;
         if(_local_5 != null)
         {
            _local_4 = _local_4.replace("%1",_local_5);
         }
         this.getGuiModel().tagew(MessageColor.bivyzafo,_local_4);
         if(_local_2.sound != null)
         {
            _local_6 = null;
            if(_local_6 != null)
            {
               _local_6.stop();
            }
            _local_2.sound.play(0,0);
         }
      }
      
      private function getGuiModel() : Tupebeput
      {
         return Kyfaciki(OSGi.getInstance().getService(Tupebeput));
      }
   }
}

