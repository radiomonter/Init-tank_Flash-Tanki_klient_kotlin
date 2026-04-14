package alternativa.tanks.gui.servers
{
   import assets.combo.ComboListOverState;
   
   public class ServersListOverStyle extends ComboListOverState
   {
      
      private static const MIN_WIDTH:int = 61;
      
      public function ServersListOverStyle()
      {
         super();
      }
      
      override public function set y(_arg_1:Number) : void
      {
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = Math.max(_arg_1,MIN_WIDTH);
         draw();
      }
   }
}

