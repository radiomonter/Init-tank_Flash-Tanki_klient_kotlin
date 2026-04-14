package alternativa.tanks.service.settings
{
   import flash.events.IEventDispatcher;
   
   public interface ISettingsService extends IEventDispatcher
   {
      
      function get showDropZones() : Boolean;
      
      function set showDropZones(param1:Boolean) : void;
      
      function get showSkyBox() : Boolean;
      
      function get showFPS() : Boolean;
      
      function get showChat() : Boolean;
      
      function get useNewLoader() : Boolean;
      
      function get mipMapping() : Boolean;
      
      function get inverseBackDriving() : Boolean;
      
      function get bgSound() : Boolean;
      
      function get muteSound() : Boolean;
      
      function set muteSound(param1:Boolean) : void;
      
      function get alternateCamera() : Boolean;
      
      function get adaptiveFPS() : Boolean;
      
      function get shadows() : Boolean;
      
      function get wobyza() : Boolean;
      
      function get dust() : Boolean;
      
      function get ssao() : Boolean;
      
      function get fog() : Boolean;
      
      function get dynamicLighting() : Boolean;
      
      function get antialiasing() : Boolean;
      
      function get dynamicShadows() : Boolean;
      
      function get graphicsAutoQuality() : Boolean;
      
      function get bazorodum() : Number;
      
      function set bazorodum(param1:Number) : void;
      
      function nimupyj() : void;
      
      function get mouseControl() : Boolean;
      
      function getEmail() : String;
      
      function nuka(param1:String, param2:Boolean) : void;
      
      function naged() : Boolean;
      
      function rovi() : Boolean;
      
      function cegediv() : Boolean;
      
      function comyde(param1:Boolean) : void;
      
      function get mouseSensitivity() : int;
      
      function get mouseYInverse() : Boolean;
      
      function get mouseYInverseShaftAim() : Boolean;
      
      function get rahununo() : Boolean;
      
      function set rahununo(param1:Boolean) : void;
      
      function get showDamage() : Boolean;
      
      function cybyzyjeh(param1:SettingEnum, param2:Object) : void;
   }
}

