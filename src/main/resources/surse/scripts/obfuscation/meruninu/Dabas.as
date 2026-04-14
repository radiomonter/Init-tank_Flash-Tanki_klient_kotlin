package obfuscation.meruninu
{
   import alternativa.tanks.gui.settings.Juteqisyt;
   import controls.buttons.IconButton;
   
   public class Dabas extends IconButton
   {
      
      private var category:Juteqisyt;
      
      public function Dabas(_arg_1:Juteqisyt, _arg_2:String, _arg_3:Class)
      {
         super(_arg_2,_arg_3);
         this.category = _arg_1;
      }
      
      public function getCategory() : Juteqisyt
      {
         return this.category;
      }
   }
}

