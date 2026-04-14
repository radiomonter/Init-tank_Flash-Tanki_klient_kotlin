package alternativa.tanks.service.settings
{
   import flash.events.EventDispatcher;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class SettingsService extends EventDispatcher implements ISettingsService
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private static const zitamyq:Number = 0.7;
      
      private static const jim:int = 8;
      
      private var email:String;
      
      private var emailConfirmed:Boolean;
      
      private var dosuza:Boolean = false;
      
      public function SettingsService()
      {
         super();
      }
      
      private static function lurizoly(_arg_1:Boolean, _arg_2:Number) : void
      {
         SoundMixer.soundTransform = new SoundTransform(!_arg_1 ? Number(_arg_2) : Number(0));
      }
      
      public function get showDropZones() : Boolean
      {
         return this.getBoolean(SettingEnum.myw,true);
      }
      
      public function set showDropZones(_arg_1:Boolean) : void
      {
         this.cybyzyjeh(SettingEnum.myw,_arg_1);
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.getBoolean(SettingEnum.lume,true);
      }
      
      public function get showFPS() : Boolean
      {
         return this.getBoolean(SettingEnum.sujutyb,true);
      }
      
      public function get showChat() : Boolean
      {
         return this.getBoolean(SettingEnum.wygo,true);
      }
      
      public function get useNewLoader() : Boolean
      {
         return this.getBoolean(SettingEnum.USE_NEW_LOADER,false);
      }
      
      public function get mipMapping() : Boolean
      {
         return this.getBoolean(SettingEnum.ziqufyred,true);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.getBoolean(SettingEnum.cyj,false);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.getBoolean(SettingEnum.batenyqo,false);
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this.getBoolean(SettingEnum.lydovez,false);
      }
      
      public function get bgSound() : Boolean
      {
         return this.getBoolean(SettingEnum.zywiqudih,true);
      }
      
      public function get muteSound() : Boolean
      {
         return this.getBoolean(SettingEnum.wetyq,false);
      }
      
      public function set muteSound(_arg_1:Boolean) : void
      {
         SettingsService.lurizoly(_arg_1,this.bazorodum);
         this.cybyzyjeh(SettingEnum.wetyq,_arg_1);
      }
      
      public function get shadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.qosasor,true);
      }
      
      public function get wobyza() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.jyvut,false);
      }
      
      public function get dust() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.jyvut,false) && this.getBoolean(SettingEnum.metyci,false);
      }
      
      public function get ssao() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.SSAO,false);
      }
      
      public function get fog() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.FOG,true);
      }
      
      public function get dynamicShadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.dugydip,false);
      }
      
      public function get dynamicLighting() : Boolean
      {
         var _local_1:Boolean = this.dynamicShadows || this.ssao || this.wobyza;
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.jifedag,_local_1);
      }
      
      public function get antialiasing() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.haqinecy,false);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         if(this.fyso(SettingEnum.rec))
         {
            return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(SettingEnum.rec,false);
         }
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function fyso(_arg_1:SettingEnum) : Boolean
      {
         return storageService.getStorage().data[_arg_1.name] != null;
      }
      
      public function get bazorodum() : Number
      {
         return this.getNumber(SettingEnum.qojer,zitamyq);
      }
      
      public function set bazorodum(_arg_1:Number) : void
      {
         lurizoly(this.muteSound,_arg_1);
         this.cybyzyjeh(SettingEnum.qojer,_arg_1);
      }
      
      public function nimupyj() : void
      {
         lurizoly(this.muteSound,this.bazorodum);
      }
      
      private function getBoolean(_arg_1:SettingEnum, _arg_2:Boolean) : Boolean
      {
         var _local_3:* = storageService.getStorage().data[_arg_1.name];
         return _local_3 == null ? Boolean(_arg_2) : Boolean(_local_3);
      }
      
      private function storeBoolean(_arg_1:SettingEnum, _arg_2:Boolean) : void
      {
         storageService.getStorage().data[_arg_1.name] = _arg_2;
      }
      
      private function getNumber(_arg_1:SettingEnum, _arg_2:Number = 0) : Number
      {
         var _local_3:Number = Number(storageService.getStorage().data[_arg_1.name]);
         return !isNaN(_local_3) ? Number(_local_3) : Number(_arg_2);
      }
      
      private function tefugunubu(_arg_1:SettingEnum, _arg_2:Number) : void
      {
         storageService.getStorage().data[_arg_1.name] = _arg_2;
      }
      
      public function nuka(_arg_1:String, _arg_2:Boolean) : void
      {
         this.email = _arg_1;
         this.emailConfirmed = _arg_2;
      }
      
      public function naged() : Boolean
      {
         return this.email != null && this.email != "";
      }
      
      public function rovi() : Boolean
      {
         return !this.cegediv();
      }
      
      public function getEmail() : String
      {
         return this.email != null ? this.email : "";
      }
      
      public function cegediv() : Boolean
      {
         return this.emailConfirmed;
      }
      
      public function comyde(_arg_1:Boolean) : void
      {
         this.emailConfirmed = _arg_1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.getBoolean(SettingEnum.kumytasok,true);
      }
      
      public function get mouseSensitivity() : int
      {
         return this.getNumber(SettingEnum.kaniniqy,jim);
      }
      
      public function get mouseYInverse() : Boolean
      {
         return this.getBoolean(SettingEnum.zejum,false);
      }
      
      public function get mouseYInverseShaftAim() : Boolean
      {
         return this.getBoolean(SettingEnum.bynerede,false);
      }
      
      public function get rahununo() : Boolean
      {
         return this.dosuza;
      }
      
      public function set rahununo(_arg_1:Boolean) : void
      {
         this.dosuza = _arg_1;
      }
      
      public function get showDamage() : Boolean
      {
         return this.getBoolean(SettingEnum.SHOW_DAMAGE,true);
      }
      
      public function cybyzyjeh(_arg_1:SettingEnum, _arg_2:Object) : void
      {
         var _local_3:SharedObject = storageService.getStorage();
         _local_3.data[_arg_1.name] = _arg_2;
         _local_3.flush();
         dispatchEvent(new SettingsServiceEvent(SettingsServiceEvent.SETTINGS_CHANGED,_arg_1));
      }
   }
}

