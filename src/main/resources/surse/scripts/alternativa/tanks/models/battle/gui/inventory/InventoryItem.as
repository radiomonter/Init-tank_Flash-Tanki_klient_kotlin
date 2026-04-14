package alternativa.tanks.models.battle.gui.inventory
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   
   public class InventoryItem
   {
      
      private var id:int;
      
      private var _count:EncryptedInt;
      
      private var clientObject:ClientObject;
      
      private var icon:InventoryIcons;
      
      private var kidurere:int;
      
      private var muzujad:int = -1;
      
      private var hucaji:int;
      
      public function InventoryItem(_arg_1:ClientObject, _arg_2:int, _arg_3:int, _arg_4:int)
      {
         super();
         this.clientObject = _arg_1;
         this.id = _arg_2;
         this.icon = new InventoryIcons(_arg_2);
         this._count = new EncryptedIntImpl(_arg_3);
         this.hucaji = _arg_4;
         this.kidurere = _arg_4;
      }
      
      public function getClientObject() : ClientObject
      {
         return this.clientObject;
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getIcon() : InventoryIcons
      {
         return this.icon;
      }
      
      public function kyduwy() : int
      {
         return this.hucaji;
      }
      
      public function myzehal(_arg_1:int) : Number
      {
         if(this.muzujad == -1)
         {
            return 1;
         }
         var _local_2:Number = (_arg_1 - this.muzujad) / this.hucaji;
         if(_local_2 > 1)
         {
            _local_2 = 1;
            this.rucez();
         }
         return _local_2;
      }
      
      public function rucez() : void
      {
         this.muzujad = -1;
      }
      
      public function bukicab(_arg_1:int) : void
      {
         this.hucaji = _arg_1;
         this.muzujad = getTimer();
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count.setInt(_arg_1);
      }
      
      public function get count() : int
      {
         return this._count.getInt();
      }
      
      public function setasen() : Boolean
      {
         return this.muzujad < 0 && this._count.getInt() > 0;
      }
   }
}

