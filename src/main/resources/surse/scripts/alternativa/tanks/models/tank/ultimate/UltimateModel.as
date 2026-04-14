package alternativa.tanks.models.tank.ultimate
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.models.battle.gui.ultimate.UltimateIndicator;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import flash.events.KeyboardEvent;
   import flash.geom.ColorTransform;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class UltimateModel implements IUltimateModel
   {
      
      [Inject]
      public static var battleInfoService:IBattleInfoService = IBattleInfoService(OSGi.getInstance().getService(IBattleInfoService));
      
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private static const FULL_CHARGE:int = 100;
      
      private var effect:UltimateEffectModel;
      
      private var ultimateBlocked:Boolean = false;
      
      private var localTankSpawned:Boolean;
      
      private var chargeInPercent:Number = 0;
      
      private var indicator:UltimateIndicator;
      
      private var localClientObject:ClientObject;
      
      public function UltimateModel()
      {
         super();
      }
      
      public static function parseColorTransform(param1:String) : ColorTransform
      {
         if(param1 == null || param1.length != 6)
         {
            return null;
         }
         var _loc2_:Number = parseInt(param1.substr(0,2),16) / 255;
         var _loc3_:Number = parseInt(param1.substr(2,2),16) / 255;
         var _loc4_:Number = parseInt(param1.substr(4,2),16) / 255;
         return new ColorTransform(_loc2_,_loc3_,_loc4_);
      }
      
      public function initUltimate() : void
      {
         this.effect = new UltimateEffectModel();
         this.initIndicator(0);
      }
      
      private function initIndicator(index:int) : void
      {
         if(this.indicator != null)
         {
            this.indicator.destroy();
         }
         this.indicator = new UltimateIndicator(index);
         this.setCharge(0);
      }
      
      public function updateCharge(_arg_1:int) : void
      {
         if(!battleInfoService.isSpectatorMode())
         {
            this.setCharge(_arg_1);
         }
      }
      
      public function addCharge(_arg_1:Number) : void
      {
         if(this.charged())
         {
            return;
         }
         var _local_2:Number = this.chargeInPercent + _arg_1;
         if(_local_2 > 99)
         {
            _local_2 = 99;
         }
         this.setCharge(_local_2);
      }
      
      private function setCharge(param1:Number) : void
      {
         this.chargeInPercent = param1;
         if(this.indicator != null)
         {
            this.indicator.updateCharge(param1);
         }
      }
      
      public function showUltimateCharged(_arg_1:ClientObject) : void
      {
         this.localClientObject = _arg_1;
         if(!battleInfoService.isSpectatorMode())
         {
            this.setCharge(FULL_CHARGE);
            if(this.canActivate())
            {
               if(this.isInActiveState(_arg_1))
               {
                  this.indicator.onCharged();
                  this.enableUltimate();
               }
            }
         }
      }
      
      private function markInventoryIndicatorDisabled(param1:Boolean) : void
      {
         this.ultimateBlocked = param1;
         if(battleInfoService.isSpectatorMode())
         {
            return;
         }
         if(this.indicator == null)
         {
            return;
         }
         this.indicator.markDisabled(param1);
      }
      
      private function canActivate() : Boolean
      {
         return !this.ultimateBlocked && this.charged() && this.isInActiveState(this.localClientObject);
      }
      
      private function isInActiveState(_arg_1:ClientObject) : Boolean
      {
         return ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1).tank.state == ClientTankState.neqahi;
      }
      
      public function activateUltimate(clientObject:ClientObject, color:String) : void
      {
         this.localClientObject = clientObject;
         this.effect.showUltimateUsed(clientObject,color);
         this.setCharge(0);
      }
      
      public function resetCharge() : void
      {
         this.localTankSpawned = false;
         this.setCharge(0);
      }
      
      private function charged() : Boolean
      {
         return this.chargeInPercent >= FULL_CHARGE;
      }
      
      private function onGameAction(_arg_1:KeyboardEvent) : void
      {
         var action:GameActionEnum = KeysBindingService(OSGi.getInstance().getService(KeysBindingService)).jikamybu(_arg_1.keyCode);
         if(action == GameActionEnum.ULTIMATE)
         {
            if(this.canActivate())
            {
               Network(OSGi.getInstance().getService(INetworker)).send("battle;activateUltimate");
            }
         }
      }
      
      public function onBattleFinish() : void
      {
         this.resetCharge();
         this.markInventoryIndicatorDisabled(true);
      }
      
      public function onLocalTankKilled(tankData:Num) : void
      {
         this.disableUltimate();
         if(this.charged())
         {
         }
      }
      
      public function onTankSpawn(tankData:Num) : void
      {
         this.enableUltimate();
         if(this.charged())
         {
         }
      }
      
      private function enableUltimate() : void
      {
         this.localTankSpawned = true;
         this.markInventoryIndicatorDisabled(false);
         if(display != null && display.stage != null)
         {
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onGameAction);
         }
         if(this.charged() && this.indicator != null)
         {
            this.indicator.onCharged();
         }
      }
      
      private function disableUltimate() : void
      {
         this.localTankSpawned = false;
         this.markInventoryIndicatorDisabled(true);
         if(display != null && display.stage != null)
         {
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onGameAction);
         }
      }
   }
}

