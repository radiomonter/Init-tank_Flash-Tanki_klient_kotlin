package alternativa.tanks.gui.settings
{
   import alternativa.osgi.service.locale.ILocaleService;
   import base.DiscreteSprite;
   import controls.containers.HorizontalStackPanel;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import obfuscation.meruninu.Cohyn;
   import obfuscation.meruninu.Dabas;
   import obfuscation.qimi.Jin;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Pibu extends DiscreteSprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var kylecyly:Dictionary = new Dictionary();
      
      private var ripezu:Vector.<Dabas> = new Vector.<Dabas>();
      
      private var syv:Juteqisyt;
      
      private var vinosuv:HorizontalStackPanel = new HorizontalStackPanel();
      
      public function Pibu()
      {
         super();
         this.vinosuv.bujet(Jin.MARGIN);
         addChild(this.vinosuv);
      }
      
      public function toke(_arg_1:Juteqisyt) : void
      {
         switch(_arg_1)
         {
            case Juteqisyt.GAME:
               this.vinosuv.addItem(this.kisidojaq(Juteqisyt.GAME,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GAME),Cohyn.gyz));
               return;
            case Juteqisyt.GRAPHIC:
               this.vinosuv.addItem(this.kisidojaq(Juteqisyt.GRAPHIC,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GRAPHICS),Cohyn.dyqulur));
               return;
            case Juteqisyt.ACCOUNT:
               this.vinosuv.addItem(this.kisidojaq(Juteqisyt.ACCOUNT,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_ACCOUNT),Cohyn.juvywoz));
               return;
            case Juteqisyt.CONTROL:
               this.vinosuv.addItem(this.kisidojaq(Juteqisyt.CONTROL,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_CONTROLS),Cohyn.piqihedap));
         }
      }
      
      private function kisidojaq(_arg_1:Juteqisyt, _arg_2:String, _arg_3:Class) : Dabas
      {
         var _local_4:Dabas = null;
         _local_4 = new Dabas(_arg_1,_arg_2,_arg_3);
         this.kylecyly[_arg_1] = _local_4;
         _local_4.width = SettingsWindow.BUTTON_WIDTH;
         this.ripezu.push(_local_4);
         _local_4.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         return _local_4;
      }
      
      private function onButtonClick(_arg_1:MouseEvent) : void
      {
         var _local_2:Juteqisyt = _arg_1.currentTarget.getCategory();
         if(this.syv != _local_2)
         {
            this.fiqohebuq(_local_2);
         }
      }
      
      public function fiqohebuq(_arg_1:Juteqisyt) : void
      {
         if(Boolean(this.syv))
         {
            this.kylecyly[this.syv].enabled = true;
         }
         this.kylecyly[_arg_1].enabled = false;
         this.syv = _arg_1;
         dispatchEvent(new SelectTabEvent(_arg_1));
      }
      
      override public function get height() : Number
      {
         return this.ripezu[0].height;
      }
      
      override public function get width() : Number
      {
         return this.vinosuv.width;
      }
      
      public function destroy() : void
      {
         var _local_1:Dabas = null;
         for each(_local_1 in this.ripezu)
         {
            _local_1.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         }
      }
   }
}

