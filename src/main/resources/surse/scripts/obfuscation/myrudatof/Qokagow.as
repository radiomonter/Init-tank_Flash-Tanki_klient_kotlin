package obfuscation.myrudatof
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Qokagow implements Nafoh
   {
      
      private var object:IGameObject;
      
      private var impl:Nafoh;
      
      public function Qokagow(_arg_1:IGameObject, _arg_2:Nafoh)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function preparePresent(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.preparePresent(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function confirmPresentPurchase(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.confirmPresentPurchase(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

