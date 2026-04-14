package alternativa.model.description
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IDescriptionAdapt implements IDescription
   {
      
      private var object:IGameObject;
      
      private var impl:IDescription;
      
      public function IDescriptionAdapt(_arg_1:IGameObject, _arg_2:IDescription)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getDescription() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getDescription();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

