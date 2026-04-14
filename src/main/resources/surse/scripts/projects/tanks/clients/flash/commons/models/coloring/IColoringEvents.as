package projects.tanks.clients.flash.commons.models.coloring
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IColoringEvents implements IColoring
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IColoring>;
      
      public function IColoringEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IColoring>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getColoring() : ImageResource
      {
         var result:ImageResource = null;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getColoring();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getAnimatedColoring() : MultiframeImageResource
      {
         var result:MultiframeImageResource = null;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getAnimatedColoring();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isAnimated() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isAnimated();
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

