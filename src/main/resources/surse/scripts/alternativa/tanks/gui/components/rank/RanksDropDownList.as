package alternativa.tanks.gui.components.rank
{
   import controls.Rank;
   import controls.dropdownlist.DropDownList;
   import flash.events.Event;
   import forms.Styles;
   import forms.ranks.SmallRankIcon;
   
   public class RanksDropDownList extends DropDownList
   {
      
      private static const RANK:String = "rank";
      
      private var rankIcon:SmallRankIcon = new SmallRankIcon();
      
      public function RanksDropDownList(_arg_1:int)
      {
         super();
         var _local_2:int = _arg_1;
         while(_local_2 <= Rank.ranks.length)
         {
            addItem({
               "gameName":"",
               "rank":_local_2,
               "rang":0
            });
            _local_2++;
         }
         this.rankIcon.x = 9;
         this.rankIcon.y = 8;
         this.rankIcon.mouseEnabled = false;
         addChild(this.rankIcon);
         width = 61;
         addEventListener(Event.CHANGE,this.onChange,false,0,true);
      }
      
      override public function selectItemByField(_arg_1:String, _arg_2:Object) : void
      {
         var _local_3:int = findItemIndexByField(_arg_1,_arg_2);
         if(_local_3 != -1)
         {
            _selectedItem = dp.getItemAt(_local_3);
            _value = _selectedItem[RANK];
            this.rankIcon.init(false,int(_value));
            getList().selectedIndex = _local_3;
            getList().scrollToSelected();
         }
      }
      
      private function onChange(_arg_1:Event) : void
      {
         this.selectItemByField(RANK,selectedItem[RANK]);
      }
      
      override public function setRenderer(_arg_1:Class) : void
      {
         getList().setStyle(Styles.CELL_RENDERER,RanksRenderer);
      }
   }
}

