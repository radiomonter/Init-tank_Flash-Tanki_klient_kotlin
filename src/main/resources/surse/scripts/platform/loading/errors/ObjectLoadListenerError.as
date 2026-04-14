package platform.loading.errors
{
   import alternativa.types.Long;
   
   public class ObjectLoadListenerError extends Error
   {
      
      public function ObjectLoadListenerError(_arg_1:Long, _arg_2:Long, _arg_3:Error)
      {
         super();
         message = "Object loading event processing error. Space id: " + _arg_1 + ".Object id: " + _arg_2 + ". Error: " + _arg_3.getStackTrace();
      }
   }
}

