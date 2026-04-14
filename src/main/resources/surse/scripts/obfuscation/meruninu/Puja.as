package obfuscation.meruninu
{
   import alternativa.tanks.service.settings.SettingEnum;
   import controls.checkbox.TankCheckBox;
   
   public class Puja extends TankCheckBox implements Qiv
   {
      
      private var quqyra:SettingEnum;
      
      public function Puja(_arg_1:SettingEnum, _arg_2:String)
      {
         super();
         this.quqyra = _arg_1;
         this.label = _arg_2;
      }
      
      public function fyryl() : Object
      {
         return checked;
      }
      
      public function pegutu() : SettingEnum
      {
         return this.quqyra;
      }
   }
}

