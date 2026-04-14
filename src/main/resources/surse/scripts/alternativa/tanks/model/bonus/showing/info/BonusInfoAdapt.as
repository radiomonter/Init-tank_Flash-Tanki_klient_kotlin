package alternativa.tanks.model.bonus.showing.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BonusInfoAdapt implements BonusInfo
   {
      
      private var object:IGameObject;
      
      private var impl:BonusInfo;
      
      public function BonusInfoAdapt(_arg_1:IGameObject, _arg_2:BonusInfo)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getTopText() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getTopText();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getBottomText() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getBottomText();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImage();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

