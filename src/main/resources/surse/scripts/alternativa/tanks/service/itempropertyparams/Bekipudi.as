package alternativa.tanks.service.itempropertyparams
{
   import alternativa.tanks.gui.ItemPropertyIcon;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class Bekipudi
   {
      
      private var peludezy:int;
      
      private var _bitmapData:BitmapData;
      
      private var _name:String;
      
      private var properties:Vector.<ItemProperty>;
      
      private var celejyfyq:Sycykeqi;
      
      private var _icon:ItemPropertyIcon;
      
      private var seroludy:Number;
      
      public function Bekipudi(_arg_1:int, _arg_2:BitmapData, _arg_3:String, _arg_4:Vector.<ItemProperty>, _arg_5:Sycykeqi, _arg_6:Number)
      {
         super();
         this.peludezy = _arg_1;
         this._bitmapData = _arg_2;
         this._name = _arg_3;
         this.properties = _arg_4;
         this.celejyfyq = _arg_5;
         this.seroludy = _arg_6;
         this._icon = new ItemPropertyIcon(_arg_2);
      }
      
      public function get byqohes() : int
      {
         return this.peludezy;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get icon() : ItemPropertyIcon
      {
         return this._icon;
      }
      
      public function qafyboqy() : Bitmap
      {
         return new Bitmap(this.bitmapData);
      }
      
      public function getProperties() : Vector.<ItemProperty>
      {
         return this.properties;
      }
      
      public function joku() : Sycykeqi
      {
         return this.celejyfyq;
      }
      
      public function bapycibu() : Number
      {
         return this.seroludy;
      }
   }
}

