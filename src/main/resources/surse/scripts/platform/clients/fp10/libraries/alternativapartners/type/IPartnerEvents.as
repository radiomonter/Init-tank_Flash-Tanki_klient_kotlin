package platform.clients.fp10.libraries.alternativapartners.type
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IPartnerEvents implements IPartner
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IPartner>;
      
      public function IPartnerEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IPartner>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getLoginParameters(param1:IParametersListener) : void
      {
         var i:int = 0;
         var m:IPartner = null;
         var listener:IParametersListener = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.getLoginParameters(listener);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function hasPaymentAction() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasPaymentAction();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function paymentAction() : void
      {
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.paymentAction();
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getFailRedirectUrl() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getFailRedirectUrl();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isExternalLoginAllowed() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isExternalLoginAllowed();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasRatings() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasRatings();
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

