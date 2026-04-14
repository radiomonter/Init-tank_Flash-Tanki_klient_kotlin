package alternativa.tanks.model.news
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class NewsAdapt implements News
   {
      
      private var object:IGameObject;
      
      private var impl:News;
      
      public function NewsAdapt(_arg_1:IGameObject, _arg_2:News)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getNewsDate() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getNewsDate();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getImageUrl() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImageUrl();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getNewsText() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getNewsText();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

