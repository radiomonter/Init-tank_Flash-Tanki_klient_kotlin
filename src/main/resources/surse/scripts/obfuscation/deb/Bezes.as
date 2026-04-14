package obfuscation.deb
{
   import controls.FixedHeightRectangleSkin;
   import controls.buttons.H50ButtonSkin;
   
   public class Bezes extends H50ButtonSkin
   {
      
      private static const leftUpClass:Class = Loty;
      
      private static const middleUpClass:Class = Kojec;
      
      private static const rightUpClass:Class = Risujoton;
      
      private static const leftOverClass:Class = Ziqilyjen;
      
      private static const middleOverClass:Class = Jyvu;
      
      private static const rightOverClass:Class = Juteguqe;
      
      private static const leftDownClass:Class = Qebuquko;
      
      private static const middleDownClass:Class = Lukak;
      
      private static const rightDownClass:Class = Tajuz;
      
      public static const velodej:Bezes = new Bezes();
      
      public function Bezes()
      {
         super(this.createStateSkin(leftUpClass,middleUpClass,rightUpClass),this.createStateSkin(leftOverClass,middleOverClass,rightOverClass),this.createStateSkin(leftDownClass,middleDownClass,rightDownClass));
      }
      
      private function createStateSkin(_arg_1:Class, _arg_2:Class, _arg_3:Class) : FixedHeightRectangleSkin
      {
         return new FixedHeightRectangleSkin(_arg_1,_arg_2,_arg_3);
      }
   }
}

