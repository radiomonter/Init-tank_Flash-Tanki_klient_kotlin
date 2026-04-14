package platform.loading.errors
{
   import alternativa.types.Long;
   
   public class ModelNotFoundError extends Error
   {
      
      public function ModelNotFoundError(_arg_1:Long, _arg_2:Long, _arg_3:Long)
      {
         super();
         message = "Model not found. Space id: " + _arg_1 + ". Object id: " + _arg_2 + ". Model id: " + _arg_3;
      }
   }
}

