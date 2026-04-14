package alternativa.tanks.service.temporaryitem
{
   import platform.client.fp10.core.type.IGameObject;
   
   public interface ITemporaryItemService
   {
      
      function qed(param1:IGameObject) : Number;
      
      function higyzive(param1:IGameObject, param2:int) : void;
      
      function gewadejem(param1:IGameObject) : void;
   }
}

