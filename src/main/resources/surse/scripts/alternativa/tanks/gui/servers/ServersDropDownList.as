package alternativa.tanks.gui.servers
{
   import controls.dropdownlist.DropDownList;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class ServersDropDownList extends DropDownList
   {
      
      [Inject]
      public static var dispatcherService:IDialogWindowsDispatcherService;
      
      private static const comboButtonClass:Class = ServersDropDownList_comboButtonClass;
      
      private static const comboButtonOverClass:Class = ServersDropDownList_comboButtonOverClass;
      
      public function ServersDropDownList()
      {
         super("name");
         removeDisplayObject(button.stateDOWN);
         removeDisplayObject(button.stateUP);
         removeDisplayObject(button.stateOVER);
         button.stateDOWN = this.create(comboButtonClass,1);
         button.stateUP = this.create(comboButtonClass);
         button.stateOVER = this.create(comboButtonOverClass);
         button.configUI();
         button._label.x += 1;
         button.enable = false;
         button.enable = true;
         setRenderer(ServersListRenderer);
         width = 78;
      }
      
      override protected function open() : void
      {
         super.open();
         dispatcherService.open();
      }
      
      override protected function close() : void
      {
         super.close();
         dispatcherService.close();
      }
      
      public function setBusynessToAll() : void
      {
         var _local_2:Object = null;
         var _local_1:int = 0;
         while(_local_1 < dp.length)
         {
            _local_2 = dp.getItemAt(_local_1);
            _local_2.busyness = 2;
            dp.replaceItemAt(_local_2,_local_1);
            _local_1++;
         }
      }
      
      private function create(_arg_1:Class, _arg_2:int = 0) : ServerListComboState
      {
         var _local_3:ServerListComboState = new ServerListComboState();
         var _local_4:Bitmap = new _arg_1();
         _local_4.y = _arg_2 + 2;
         _local_4.x = -1;
         _local_3.addChild(_local_4);
         return _local_3;
      }
   }
}

