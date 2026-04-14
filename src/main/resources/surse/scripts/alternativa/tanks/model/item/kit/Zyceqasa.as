package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.kit.KitGiftItem;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public class Zyceqasa implements GarageKit
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<GarageKit>;
      
      public function Zyceqasa(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<GarageKit>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         var i:int = 0;
         var m:GarageKit = null;
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
      
      public function getPrice() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPrice();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPriceWithoutDiscount();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function cik() : int
      {
         var pify:int = 0;
         var hutace:int = 0;
         var nyfusi:GarageKit = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.cik();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function cikanokot() : int
      {
         var pify:int = 0;
         var hutace:int = 0;
         var nyfusi:GarageKit = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.cikanokot();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function getItems() : Vector.<KitItem>
      {
         var result:Vector.<KitItem> = null;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getItems();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function canBuy() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.canBuy();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getGiftItems() : Vector.<KitGiftItem>
      {
         var result:Vector.<KitGiftItem> = null;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getGiftItems();
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

