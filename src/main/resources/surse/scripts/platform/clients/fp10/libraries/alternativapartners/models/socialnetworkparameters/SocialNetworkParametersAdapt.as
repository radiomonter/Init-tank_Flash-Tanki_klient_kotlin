package platform.clients.fp10.libraries.alternativapartners.models.socialnetworkparameters
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class SocialNetworkParametersAdapt implements SocialNetworkParameters
   {
      
      private var object:IGameObject;
      
      private var impl:SocialNetworkParameters;
      
      public function SocialNetworkParametersAdapt(_arg_1:IGameObject, _arg_2:SocialNetworkParameters)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function hasOwnPaymentSystem() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.hasOwnPaymentSystem();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasSocialFunction() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.hasSocialFunction();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

