package platform.clients.fp10.libraries.alternativapartners.type
{
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IParametersListenerAdapt implements IParametersListener
   {
      
      private var object:IGameObject;
      
      private var impl:IParametersListener;
      
      public function IParametersListenerAdapt(_arg_1:IGameObject, _arg_2:IParametersListener)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function onSetParameters(param1:LoginParameters) : void
      {
         var parameters:LoginParameters = param1;
         try
         {
            Model.object = this.object;
            this.impl.onSetParameters(parameters);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onFailSetParameters() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.onFailSetParameters();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

