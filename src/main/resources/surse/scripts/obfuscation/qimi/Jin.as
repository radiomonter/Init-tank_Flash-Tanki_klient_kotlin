package obfuscation.qimi
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingEnum;
   import base.DiscreteSprite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import obfuscation.meruninu.Puja;
   import obfuscation.meruninu.Qiv;
   
   public class Jin extends DiscreteSprite
   {
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const MARGIN:int = 8;
      
      public static const nisi:int = 10;
      
      public static const noz:int = 3;
      
      protected var vavuho:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function Jin()
      {
         super();
      }
      
      public function show() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      protected function createCheckBox(_arg_1:SettingEnum, _arg_2:String, _arg_3:Boolean, _arg_4:int = 0, _arg_5:int = 0) : Puja
      {
         var _local_6:Puja = new Puja(_arg_1,_arg_2);
         _local_6.checked = _arg_3;
         _local_6.addEventListener(MouseEvent.CLICK,this.fotu);
         _local_6.x = _arg_4;
         _local_6.y = _arg_5;
         this.vavuho.push(_local_6);
         _local_6.label = _arg_2;
         return _local_6;
      }
      
      protected function fotu(_arg_1:MouseEvent) : void
      {
         var _local_2:Qiv = null;
         if(_arg_1.currentTarget is Qiv)
         {
            _local_2 = Qiv(_arg_1.currentTarget);
            settingsService.cybyzyjeh(_local_2.pegutu(),_local_2.fyryl());
         }
      }
      
      public function destroy() : void
      {
         var _local_1:DisplayObject = null;
         for each(_local_1 in this.vavuho)
         {
            _local_1.removeEventListener(MouseEvent.CLICK,this.fotu);
         }
      }
   }
}

