package obfuscation.hifoped
{
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Duhewaqiz implements Nywehohal
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Nywehohal>;
      
      public function Duhewaqiz(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Nywehohal>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function cenary() : Vector.<IGameObject>
      {
         var pify:Vector.<IGameObject> = null;
         var hutace:int = 0;
         var nyfusi:Nywehohal = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.cenary();
               hutace += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getName();
               i += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Nywehohal = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.misapyju();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Nywehohal = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.tafumu();
               hutace += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMaxRank();
               i += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMinRank();
               i += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getThemeName();
               i += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Nywehohal = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.rujer();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Nywehohal = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.der();
               hutace += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isEnabled();
               i += 1;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = Nywehohal(this.impl[i]);
               result = Boolean(m.hasMatchmakingMark());
               i++;
            }
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
         var i:int = 0;
         var m:Nywehohal = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPreviewResource();
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

