package alternativa.tanks.gui.components.flag
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import controls.dropdownlist.DropDownList;
   import fl.events.ListEvent;
   import flash.events.Event;
   import forms.Styles;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class FlagsDropDownList extends DropDownList
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clanCreateService:ClanCreateService;
      
      private static const COUNTRY:String = "country";
      
      public var flag:Flag;
      
      public function FlagsDropDownList()
      {
         var _local_1:int = 0;
         this.flag = new Flag();
         super();
         while(_local_1 < clanCreateService.flags.length)
         {
            addItem({
               "country":clanCreateService.flags[_local_1],
               "gameName":""
            });
            _local_1++;
         }
         this.selectItemByField(COUNTRY,clanCreateService.defaultFlag);
         width = 70;
         this.flag.mouseEnabled = false;
         addChild(this.flag);
         this.flag.x = 8;
         this.flag.y = 30 - this.flag.height >> 1;
         addEventListener(Event.CHANGE,this.onChange,false,0,true);
         height = (Math.min(clanCreateService.flags.length,6) + 1) * rowHeight + 14;
      }
      
      override public function setRenderer(_arg_1:Class) : void
      {
         getList().setStyle(Styles.CELL_RENDERER,FlagsRenderer);
      }
      
      override public function selectItemByField(_arg_1:String, _arg_2:Object) : void
      {
         var _local_3:int = 0;
         _local_3 = findItemIndexByField(_arg_1,_arg_2);
         if(_local_3 != -1)
         {
            _selectedItem = dp.getItemAt(_local_3);
            _value = _selectedItem[COUNTRY];
            this.flag.setFlag(ClanFlag(_value));
            getList().selectedIndex = _local_3;
            getList().scrollToSelected();
         }
      }
      
      private function onChange(_arg_1:Event) : void
      {
         this.selectItemByField(COUNTRY,selectedItem[COUNTRY]);
      }
      
      override protected function onItemClick(_arg_1:ListEvent) : void
      {
         var _local_2:Object = _arg_1.item;
         _selectedIndex = _arg_1.index;
         _selectedItem = _local_2;
         close();
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

