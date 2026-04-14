package obfuscation.lokaza
{
   import obfuscation.ciqinamob.Bycyjoze;
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Pawaj
   {
      
      private var _enabled:Boolean;
      
      private var deconyg:String;
      
      private var _mapName:String;
      
      private var _maxPeople:int;
      
      private var _preview:ImageResource;
      
      private var gifos:Nukoki;
      
      private var tewuw:Vector.<Suvozimi>;
      
      private var dyno:Bycyjoze;
      
      private var _matchmakingMark:Boolean;
      
      public function Pawaj(_arg_1:Boolean = false, _arg_2:String = null, _arg_3:String = null, _arg_4:int = 0, _arg_5:ImageResource = null, _arg_6:Nukoki = null, _arg_7:Vector.<Suvozimi> = null, _arg_8:Bycyjoze = null, _arg_9:Boolean = false)
      {
         super();
         this._enabled = _arg_1;
         this.deconyg = _arg_2;
         this._mapName = _arg_3;
         this._maxPeople = _arg_4;
         this._preview = _arg_5;
         this.gifos = _arg_6;
         this.tewuw = _arg_7;
         this.dyno = _arg_8;
         this._matchmakingMark = _arg_9;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         this._enabled = _arg_1;
      }
      
      public function get mapId() : String
      {
         return this.deconyg;
      }
      
      public function set mapId(_arg_1:String) : void
      {
         this.deconyg = _arg_1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(_arg_1:String) : void
      {
         this._mapName = _arg_1;
      }
      
      public function get maxPeople() : int
      {
         return this._maxPeople;
      }
      
      public function set maxPeople(_arg_1:int) : void
      {
         this._maxPeople = _arg_1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(_arg_1:ImageResource) : void
      {
         this._preview = _arg_1;
      }
      
      public function get qikybiti() : Nukoki
      {
         return this.gifos;
      }
      
      public function set qikybiti(_arg_1:Nukoki) : void
      {
         this.gifos = _arg_1;
      }
      
      public function get supportedModes() : Vector.<Suvozimi>
      {
         return this.tewuw;
      }
      
      public function set supportedModes(_arg_1:Vector.<Suvozimi>) : void
      {
         this.tewuw = _arg_1;
      }
      
      public function get theme() : Bycyjoze
      {
         return this.dyno;
      }
      
      public function set theme(_arg_1:Bycyjoze) : void
      {
         this.dyno = _arg_1;
      }
      
      public function get matchmakingMark() : Boolean
      {
         return this._matchmakingMark;
      }
      
      public function set matchmakingMark(param1:Boolean) : void
      {
         this._matchmakingMark = param1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "MapInfoCC [";
         _local_1 += "enabled = " + this.enabled + " ";
         _local_1 += "mapId = " + this.mapId + " ";
         _local_1 += "mapName = " + this.mapName + " ";
         _local_1 += "maxPeople = " + this.maxPeople + " ";
         _local_1 += "preview = " + this.preview + " ";
         _local_1 += "rankLimit = " + this.qikybiti + " ";
         _local_1 += "supportedModes = " + this.supportedModes + " ";
         _local_1 += "theme = " + this.theme + " ";
         _local_1 += "matchmakingMark = " + this.matchmakingMark + " ";
         return _local_1 + "]";
      }
   }
}

