package controls.dropdownlist
{
   import controls.base.TankInputBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class AccountsList extends DropDownList
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      public static const ROW_HEIGHT:int = 20;
      
      private var dropButton:DropDownButton = new DropDownButton();
      
      private var inputControl:TankInputBase;
      
      public function AccountsList(_arg_1:TankInputBase)
      {
         super();
         this.inputControl = _arg_1;
         this.inputControl.addEventListener(Event.ADDED,this.onAdded);
      }
      
      private function onAdded(_arg_1:Event) : void
      {
         this.inputControl.removeEventListener(Event.ADDED,this.onAdded);
         this.listBg.x = this.inputControl.x;
         this.listBg.y = this.inputControl.y + 28;
         this.inputControl.parent.addChildAt(this.listBg,this.inputControl.parent.getChildIndex(this.inputControl));
      }
      
      override protected function init() : void
      {
         super.init();
         list.y = 30;
         list.height = 100;
         list.rowHeight = ROW_HEIGHT;
         this.listBg.height = 110;
         removeChild(button);
         addChild(this.dropButton);
         this.dropButton.y = -1;
         this.dropButton.addEventListener(MouseEvent.CLICK,onButtonClick);
         setRenderer(AccountsRenderer);
         addEventListener(DeleteEvent.REMOVED,this.onAccountRemove);
      }
      
      public function onAccountRemove(_arg_1:DeleteEvent) : void
      {
         list.removeItem(_arg_1.data);
         close();
         selectedItem = null;
         height = Math.min(this.length,4) * ROW_HEIGHT + 13;
         var _local_2:Object = _arg_1.data.data;
         var _local_3:SharedObject = storageService.getAccountsStorage();
         delete _local_3.data[_local_2.userName];
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override protected function get listBg() : DPLBackground
      {
         if(!_listBg)
         {
            _listBg = new AccountsBackground();
         }
         return _listBg;
      }
      
      override public function addItem(_arg_1:Object) : void
      {
         super.addItem(_arg_1);
         height = Math.min(this.length,4) * ROW_HEIGHT + 10;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this.dropButton.x = _arg_1 - 30;
         super.width = _arg_1;
      }
      
      override protected function draw() : void
      {
         super.draw();
         list.setSize(this.listBg.width,this.listBg.height - 7);
         list.invalidate();
      }
      
      public function get length() : Number
      {
         return dp.length;
      }
      
      public function initialize() : void
      {
         var _local_3:String = null;
         var _local_4:SharedObject = null;
         var _local_1:SharedObject = null;
         var _local_2:int = 0;
         clear();
         _local_1 = storageService.getAccountsStorage();
         for(_local_3 in _local_1.data)
         {
            if(Boolean(_local_1.data[_local_3].userHash))
            {
               this.addItem({
                  "gameName":_local_3,
                  "rang":0,
                  "id":_local_2++,
                  "data":_local_1.data[_local_3]
               });
            }
         }
         visible = _local_2 > 0;
         _local_4 = storageService.getStorage();
         if(Boolean(_local_4.data.userName))
         {
            selectItemByField("gameName",_local_4.data.userName);
         }
         else
         {
            selectItemByField("id",0);
         }
      }
   }
}

