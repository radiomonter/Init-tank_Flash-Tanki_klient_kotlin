package alternativa.tanks.models.battle.jgr
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.models.battle.gui.markers.PointIndicatorStateProvider;
   import alternativa.tanks.models.tank.ITankModel;
   import obfuscation.joraky.Kyfaciki;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.rofa.Sound3D;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battlefield.models.battle.jgr.IJuggernautModelBase;
   import projects.tanks.client.battlefield.models.battle.jgr.JuggernautCC;
   import projects.tanks.client.battlefield.models.battle.jgr.JuggernautModelBase;
   
   public class JuggernautModel extends JuggernautModelBase implements IJuggernautModelBase, Juggernaut, ObjectLoadListener, ObjectUnloadListener, ObjectLoadPostListener, PointIndicatorStateProvider
   {
      
      [Inject]
      public static var battleService:BattleService = BattleService(OSGi.getInstance().getService(BattleService));
      
      private static const MARKER_Z_OFFSET:Number = 350;
      
      private var guiModel:Tupebeput = null;
      
      private var bossSpawnedSound:Sound3D;
      
      private var bossDiedSound:Sound3D;
      
      private var currentBossId:String = null;
      
      public function JuggernautModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function bossChanged(_arg_1:String) : void
      {
         var _local_4:String = null;
         this.currentBossId = _arg_1;
         var _local_3:String = this.currentBossId;
         if(_local_3 != null)
         {
            _local_4 = _local_3 + " — новый Джаггернаут!";
            this.guiModel.tagew(MessageColor.gajefo,_local_4);
         }
         this.bossSpawnedSound.play(0,0);
      }
      
      public function bossKilled() : void
      {
         var _local_3:String = null;
         var _local_1:uint = MessageColor.YELLOW;
         var _local_2:String = this.currentBossId;
         if(_local_2 != null)
         {
            _local_3 = "Джаггернаут " + _local_2 + " уничтожен";
            this.guiModel.tagew(_local_1,_local_3);
         }
         this.bossDiedSound.play(0,0);
      }
      
      public function bossId() : String
      {
         return this.currentBossId;
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:JuggernautCC = getInitParam();
         this.guiModel = Kyfaciki(OSGi.getInstance().getService(Tupebeput));
         this.bossSpawnedSound = Sound3D.create(_local_1.bossSpawnedSound.sound);
         this.bossDiedSound = Sound3D.create(_local_1.bossKilledSound.sound);
         this.currentBossId = "TitanoMachina";
      }
      
      public function getIndicatorPosition() : Vector3
      {
         var _local_1:ClientObject = null;
         if(this.currentBossId != null)
         {
            _local_1 = BattleController.activeTanks[this.currentBossId];
            if(_local_1 != null)
            {
               return ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_local_1).tank.bilofydur;
            }
         }
         return Vector3.ZERO;
      }
      
      public function isIndicatorActive(_arg_1:Vector3 = null) : Boolean
      {
         return true;
      }
      
      public function zOffset() : Number
      {
         return MARKER_Z_OFFSET;
      }
   }
}

