package projects.tanks.client.garage.models.item.upgradeable.types
{
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   
   public class GaragePropertyData
   {
      
      private var _costParams:LinearParams;
      
      private var _importance:Number;
      
      private var _level:int;
      
      private var _maxLevel:int;
      
      private var _properties:Vector.<PropertyData>;
      
      private var _property:ItemGarageProperty;
      
      private var _speedUpDiscount:int;
      
      private var _timeDiscount:int;
      
      private var _timeParams:LinearParams;
      
      private var _upgradeDiscount:int;
      
      public function GaragePropertyData(_arg_1:LinearParams = null, _arg_2:Number = 0, _arg_3:int = 0, _arg_4:int = 0, _arg_5:Vector.<PropertyData> = null, _arg_6:ItemGarageProperty = null, _arg_7:int = 0, _arg_8:int = 0, _arg_9:LinearParams = null, _arg_10:int = 0)
      {
         super();
         this._costParams = _arg_1;
         this._importance = _arg_2;
         this._level = _arg_3;
         this._maxLevel = _arg_4;
         this._properties = _arg_5;
         this._property = _arg_6;
         this._speedUpDiscount = _arg_7;
         this._timeDiscount = _arg_8;
         this._timeParams = _arg_9;
         this._upgradeDiscount = _arg_10;
      }
      
      public function get costParams() : LinearParams
      {
         return this._costParams;
      }
      
      public function set costParams(_arg_1:LinearParams) : void
      {
         this._costParams = _arg_1;
      }
      
      public function get importance() : Number
      {
         return this._importance;
      }
      
      public function set importance(_arg_1:Number) : void
      {
         this._importance = _arg_1;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(_arg_1:int) : void
      {
         this._level = _arg_1;
      }
      
      public function get maxLevel() : int
      {
         return this._maxLevel;
      }
      
      public function set maxLevel(_arg_1:int) : void
      {
         this._maxLevel = _arg_1;
      }
      
      public function get properties() : Vector.<PropertyData>
      {
         return this._properties;
      }
      
      public function set properties(_arg_1:Vector.<PropertyData>) : void
      {
         this._properties = _arg_1;
      }
      
      public function get property() : ItemGarageProperty
      {
         return this._property;
      }
      
      public function set property(_arg_1:ItemGarageProperty) : void
      {
         this._property = _arg_1;
      }
      
      public function get speedUpDiscount() : int
      {
         return this._speedUpDiscount;
      }
      
      public function set speedUpDiscount(_arg_1:int) : void
      {
         this._speedUpDiscount = _arg_1;
      }
      
      public function get timeDiscount() : int
      {
         return this._timeDiscount;
      }
      
      public function set timeDiscount(_arg_1:int) : void
      {
         this._timeDiscount = _arg_1;
      }
      
      public function get timeParams() : LinearParams
      {
         return this._timeParams;
      }
      
      public function set timeParams(_arg_1:LinearParams) : void
      {
         this._timeParams = _arg_1;
      }
      
      public function get upgradeDiscount() : int
      {
         return this._upgradeDiscount;
      }
      
      public function set upgradeDiscount(_arg_1:int) : void
      {
         this._upgradeDiscount = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "GaragePropertyData [";
         _local_1 += "costParams = " + this.costParams + " ";
         _local_1 += "importance = " + this.importance + " ";
         _local_1 += "level = " + this.level + " ";
         _local_1 += "maxLevel = " + this.maxLevel + " ";
         _local_1 += "properties = " + this.properties + " ";
         _local_1 += "property = " + this.property + " ";
         _local_1 += "speedUpDiscount = " + this.speedUpDiscount + " ";
         _local_1 += "timeDiscount = " + this.timeDiscount + " ";
         _local_1 += "timeParams = " + this.timeParams + " ";
         _local_1 += "upgradeDiscount = " + this.upgradeDiscount + " ";
         return _local_1 + "]";
      }
   }
}

