package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ISourceDataEvents implements ISourceData
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function ISourceDataEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function addByUid(name:String) : void
      {
         var i:int = 0;
         var m:ISourceData = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ISourceData(this.impl[i]);
               m.addByUid(name);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function checkUid(name:String) : void
      {
         var i:int = 0;
         var m:ISourceData = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ISourceData(this.impl[i]);
               m.checkUid(name);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function setSearchInput(view:ISearchInput) : void
      {
         var i:int = 0;
         var m:ISourceData = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ISourceData(this.impl[i]);
               m.setSearchInput(view);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function accept(userId:String) : void
      {
         var i:int = 0;
         var m:ISourceData = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ISourceData(this.impl[i]);
               m.accept(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

