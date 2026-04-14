package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.LogicUnit;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class StageFrameRateController extends BattleRunnerProvider implements LogicUnit
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const dyh:Number = 60;
      
      private static const wotywy:Number = 40;
      
      private static const govygeni:int = 10;
      
      private static const vehidim:int = 30;
      
      private var stage:Stage;
      
      private var syc:TimeStatistics;
      
      private var pukejafig:int;
      
      private var frameCounter:int;
      
      private var deda:Number;
      
      private var ripaviqyz:String;
      
      private var haceziwab:Boolean;
      
      public function StageFrameRateController(_arg_1:Stage, _arg_2:BattleRunner, _arg_3:TimeStatistics)
      {
         super();
         this.stage = _arg_1;
         this.syc = _arg_3;
         this.qebujodu();
         this.wyjupu();
         this.humahajo();
      }
      
      private function wyjupu() : void
      {
         this.deda = this.stage.frameRate;
         this.ripaviqyz = this.stage.quality;
      }
      
      private function humahajo() : void
      {
         this.stage.frameRate = this.pukejafig;
         if(GPUCapabilities.gpuEnabled)
         {
            this.stage.quality = StageQuality.MEDIUM;
         }
         else
         {
            this.stage.quality = StageQuality.LOW;
         }
      }
      
      public function debo() : void
      {
         this.stage.frameRate = this.deda;
         this.stage.quality = this.ripaviqyz;
      }
      
      private function qebujodu() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.pukejafig = dyh;
         }
         else
         {
            this.pukejafig = wotywy;
         }
      }
      
      public function pivugi(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            this.mynolom();
         }
         else
         {
            this.kozylejy();
         }
      }
      
      private function mynolom() : void
      {
         if(!this.haceziwab)
         {
            fahysemas().wop(this);
            this.haceziwab = true;
         }
      }
      
      private function kozylejy() : void
      {
         if(this.haceziwab)
         {
            fahysemas().bapucic(this);
            this.haceziwab = false;
            this.stage.frameRate = this.pukejafig;
         }
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         ++this.frameCounter;
         if(this.frameCounter == vehidim)
         {
            this.frameCounter = 0;
            if(this.jaju())
            {
               this.hifymana();
            }
            else
            {
               this.kogujiz();
            }
         }
      }
      
      private function jaju() : Boolean
      {
         return this.syc.fps < display.stage.frameRate - 1;
      }
      
      private function hifymana() : void
      {
         display.stage.frameRate = this.syc.fps < govygeni ? Number(govygeni) : Number(this.syc.fps);
      }
      
      private function kogujiz() : void
      {
         var _local_1:Number = display.stage.frameRate + 1;
         display.stage.frameRate = _local_1 > this.pukejafig ? Number(this.pukejafig) : Number(_local_1);
      }
   }
}

