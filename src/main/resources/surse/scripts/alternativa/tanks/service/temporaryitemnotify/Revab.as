package alternativa.tanks.service.temporaryitemnotify
{
   import platform.client.fp10.core.type.IGameObject;
   
   public class Revab implements ITemporaryItemNotifyService
   {
      
      private var listeners:Vector.<Ceqibavub>;
      
      public function Revab()
      {
         super();
         this.listeners = new Vector.<Ceqibavub>();
      }
      
      public function addListener(_arg_1:Ceqibavub) : void
      {
         if(this.listeners.indexOf(_arg_1) == -1)
         {
            this.listeners.push(_arg_1);
         }
      }
      
      public function removeListener(_arg_1:Ceqibavub) : void
      {
         var _local_2:Number = this.listeners.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.listeners.splice(_local_2,1);
         }
      }
      
      public function bemykigyl(_arg_1:IGameObject) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.listeners.length)
         {
            this.listeners[_local_2].temporaryItemTimeIsUp(_arg_1);
            _local_2++;
         }
      }
   }
}

