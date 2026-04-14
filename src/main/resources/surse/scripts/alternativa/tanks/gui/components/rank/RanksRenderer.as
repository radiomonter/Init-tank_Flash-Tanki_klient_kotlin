package alternativa.tanks.gui.components.rank
{
   import controls.dropdownlist.ComboBoxRenderer;
   import flash.display.Sprite;
   import forms.ranks.SmallRankIcon;
   
   public class RanksRenderer extends ComboBoxRenderer
   {
      
      public function RanksRenderer()
      {
         super();
      }
      
      override protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_2:Sprite = new Sprite();
         var _local_3:SmallRankIcon = new SmallRankIcon();
         _local_3.init(false,_arg_1.rank);
         _local_2.addChild(_local_3);
         return _local_2;
      }
   }
}

