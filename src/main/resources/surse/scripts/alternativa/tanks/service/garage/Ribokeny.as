package alternativa.tanks.service.garage
{
   import alternativa.tanks.gui.GarageWindow;
   
   public class Ribokeny implements GarageService
   {
      
      private var view:GarageWindow;
      
      public function Ribokeny()
      {
         super();
      }
      
      public function tolycavu() : GarageWindow
      {
         return this.view;
      }
      
      public function fizyt(_arg_1:GarageWindow) : void
      {
         this.view = _arg_1;
      }
      
      public function tisybek() : void
      {
         this.view = null;
      }
   }
}

