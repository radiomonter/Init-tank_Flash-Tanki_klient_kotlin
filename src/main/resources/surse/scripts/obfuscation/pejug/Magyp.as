package obfuscation.pejug
{
   import alternativa.types.Long;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.Nokomojob;
   
   public class Magyp
   {
      
      private var vusy:Boolean;
      
      private var _description:String;
      
      private var hitaq:int;
      
      private var _image:ImageResource;
      
      private var bezesura:Vector.<Nokomojob>;
      
      private var _progress:int;
      
      private var sago:Long;
      
      private var dygapumo:int;
      
      public function Magyp(_arg_1:Boolean = false, _arg_2:String = null, _arg_3:int = 0, _arg_4:ImageResource = null, _arg_5:Vector.<Nokomojob> = null, _arg_6:int = 0, _arg_7:Long = null, _arg_8:int = 0)
      {
         super();
         this.vusy = _arg_1;
         this._description = _arg_2;
         this.hitaq = _arg_3;
         this._image = _arg_4;
         this.bezesura = _arg_5;
         this._progress = _arg_6;
         this.sago = _arg_7;
         this.dygapumo = _arg_8;
      }
      
      public function get canSkipForFree() : Boolean
      {
         return this.vusy;
      }
      
      public function set canSkipForFree(_arg_1:Boolean) : void
      {
         this.vusy = _arg_1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(_arg_1:String) : void
      {
         this._description = _arg_1;
      }
      
      public function get finishCriteria() : int
      {
         return this.hitaq;
      }
      
      public function set finishCriteria(_arg_1:int) : void
      {
         this.hitaq = _arg_1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(_arg_1:ImageResource) : void
      {
         this._image = _arg_1;
      }
      
      public function get prizes() : Vector.<Nokomojob>
      {
         return this.bezesura;
      }
      
      public function set prizes(_arg_1:Vector.<Nokomojob>) : void
      {
         this.bezesura = _arg_1;
      }
      
      public function get progress() : int
      {
         return this._progress;
      }
      
      public function set progress(_arg_1:int) : void
      {
         this._progress = _arg_1;
      }
      
      public function get questId() : Long
      {
         return this.sago;
      }
      
      public function set questId(_arg_1:Long) : void
      {
         this.sago = _arg_1;
      }
      
      public function get skipCost() : int
      {
         return this.dygapumo;
      }
      
      public function set skipCost(_arg_1:int) : void
      {
         this.dygapumo = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DailyQuestInfo [";
         _local_1 += "canSkipForFree = " + this.canSkipForFree + " ";
         _local_1 += "description = " + this.description + " ";
         _local_1 += "finishCriteria = " + this.finishCriteria + " ";
         _local_1 += "image = " + this.image + " ";
         _local_1 += "prizes = " + this.prizes + " ";
         _local_1 += "progress = " + this.progress + " ";
         _local_1 += "questId = " + this.questId + " ";
         _local_1 += "skipCost = " + this.skipCost + " ";
         return _local_1 + "]";
      }
   }
}

