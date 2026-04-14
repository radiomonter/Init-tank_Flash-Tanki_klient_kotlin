package platform.clients.fp10.libraries.alternativapartners.type
{
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IParametersListenerEvents implements IParametersListener
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IParametersListener>;
      
      public function IParametersListenerEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IParametersListener>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function onSetParameters(param1:LoginParameters) : void
      {
         var i:int = 0;
         var m:IParametersListener = null;
         var parameters:LoginParameters = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onSetParameters(parameters);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onFailSetParameters() : void
      {
         var i:int = 0;
         var m:IParametersListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onFailSetParameters();
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

