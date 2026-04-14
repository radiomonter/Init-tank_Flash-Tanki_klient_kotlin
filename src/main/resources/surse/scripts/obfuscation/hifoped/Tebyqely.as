package obfuscation.hifoped
{
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.lokaza.Kijorypad;
   import obfuscation.lokaza.Rugawyw;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Tebyqely extends Rugawyw implements Kijorypad, Nywehohal, IObjectLoadListener
   {
      
      private var maps:Vector.<IGameObject> = new Vector.<IGameObject>();
      
      public function Tebyqely()
      {
         super();
      }
      
      public function cenary() : Vector.<IGameObject>
      {
         return this.maps;
      }
      
      public function getName() : String
      {
         return getInitParam().mapName;
      }
      
      public function misapyju() : String
      {
         return getInitParam().mapId;
      }
      
      public function tafumu() : int
      {
         return getInitParam().maxPeople;
      }
      
      public function getMaxRank() : int
      {
         return getInitParam().qikybiti.max;
      }
      
      public function getMinRank() : int
      {
         return getInitParam().qikybiti.min;
      }
      
      public function getThemeName() : String
      {
         return getInitParam().theme.toString();
      }
      
      public function rujer() : Bycyjoze
      {
         return getInitParam().theme;
      }
      
      public function der() : Vector.<Suvozimi>
      {
         return getInitParam().supportedModes;
      }
      
      public function isEnabled() : Boolean
      {
         return getInitParam().enabled;
      }
      
      public function getPreviewResource() : ImageResource
      {
         return getInitParam().preview;
      }
      
      public function objectLoaded() : void
      {
         this.maps.push(object);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:int = this.maps.lastIndexOf(object);
         if(_local_1 != -1)
         {
            this.maps.splice(_local_1,1);
         }
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function hasMatchmakingMark() : Boolean
      {
         return getInitParam().matchmakingMark;
      }
   }
}

