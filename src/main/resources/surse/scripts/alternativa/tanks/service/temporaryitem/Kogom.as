package alternativa.tanks.service.temporaryitem
{
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Kogom implements ITemporaryItemService
   {
      
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      private var items:Dictionary;
      
      public function Kogom()
      {
         super();
         this.items = new Dictionary();
      }
      
      public function qed(_arg_1:IGameObject) : Number
      {
         var _local_2:Calytyza = this.items[_arg_1];
         if(_local_2 != null)
         {
            return _local_2.dacok;
         }
         return 0;
      }
      
      public function higyzive(_arg_1:IGameObject, _arg_2:int) : void
      {
         var _local_3:Calytyza = new Calytyza(_arg_1,_arg_2);
         this.items[_arg_1] = _local_3;
         _local_3.addEventListener(Event.COMPLETE,this.jeg);
      }
      
      public function gewadejem(_arg_1:IGameObject) : void
      {
         var _local_2:Calytyza = this.items[_arg_1];
         if(_local_2 != null)
         {
            _local_2.removeEventListener(Event.COMPLETE,this.jeg);
            _local_2.destroy();
            delete this.items[_arg_1];
         }
      }
      
      private function jeg(_arg_1:Event) : void
      {
         var _local_2:IGameObject = Calytyza(_arg_1.target).item;
         temporaryItemNotifyService.bemykigyl(_local_2);
         delete this.items[_local_2];
      }
   }
}

