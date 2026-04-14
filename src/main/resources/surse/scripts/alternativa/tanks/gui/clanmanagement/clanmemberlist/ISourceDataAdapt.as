package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ISourceDataAdapt implements ISourceData
   {
      
      private var object:IGameObject;
      
      private var impl:ISourceData;
      
      public function ISourceDataAdapt(_arg_1:IGameObject, _arg_2:ISourceData)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function addByUid(name:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.addByUid(name);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function checkUid(name:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.checkUid(name);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function setSearchInput(view:ISearchInput) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.setSearchInput(view);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function accept(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.accept(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

