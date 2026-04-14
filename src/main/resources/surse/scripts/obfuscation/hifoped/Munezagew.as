package obfuscation.hifoped
{
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Munezagew implements Nywehohal
   {
      
      private var object:IGameObject;
      
      private var impl:Nywehohal;
      
      public function Munezagew(_arg_1:IGameObject, _arg_2:Nywehohal)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function cenary() : Vector.<IGameObject>
      {
         var pify:Vector.<IGameObject> = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.cenary();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
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
      
      public function misapyju() : String
      {
         var pify:String = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.misapyju();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function tafumu() : int
      {
         var pify:int = 0;
         try
         {
            Model.object = this.object;
            pify = this.impl.tafumu();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function getMaxRank() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getMaxRank();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getMinRank() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getMinRank();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getThemeName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getThemeName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function rujer() : Bycyjoze
      {
         var pify:Bycyjoze = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.rujer();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function der() : Vector.<Suvozimi>
      {
         var pify:Vector.<Suvozimi> = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.der();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function isEnabled() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isEnabled();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasMatchmakingMark() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.hasMatchmakingMark());
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPreviewResource() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getPreviewResource();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

