package alternativa.tanks.model.bonus.showing.info
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BonusInfoEvents implements BonusInfo
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<BonusInfo>;
      
      public function BonusInfoEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<BonusInfo>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getTopText() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:BonusInfo = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTopText();
               i += 1;
            }
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
         var i:int = 0;
         var m:BonusInfo = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getBottomText();
               i += 1;
            }
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
         var i:int = 0;
         var m:BonusInfo = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getImage();
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

