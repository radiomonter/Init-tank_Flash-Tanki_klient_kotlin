package platform.clients.fp10.libraries.alternativapartners.models.socialnetworkparameters
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class SocialNetworkParametersEvents implements SocialNetworkParameters
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<SocialNetworkParameters>;
      
      public function SocialNetworkParametersEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<SocialNetworkParameters>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function hasOwnPaymentSystem() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:SocialNetworkParameters = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasOwnPaymentSystem();
               i += 1;
            }
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
         var i:int = 0;
         var m:SocialNetworkParameters = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasSocialFunction();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

