package projects.tanks.client.battlefield.models.bonus.battle
{
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Nasyvozuq
   {
      
      private var zacyliw:IGameObject;
      
      private var _bonusId:String;
      
      private var wib:int;
      
      private var jif:Vector3d;
      
      public function Nasyvozuq(_arg_1:IGameObject = null, _arg_2:String = null, _arg_3:int = 0, _arg_4:Vector3d = null)
      {
         super();
         this.zacyliw = _arg_1;
         this._bonusId = _arg_2;
         this.wib = _arg_3;
         this.jif = _arg_4;
      }
      
      public function get nezywasew() : IGameObject
      {
         return this.zacyliw;
      }
      
      public function set nezywasew(_arg_1:IGameObject) : void
      {
         this.zacyliw = _arg_1;
      }
      
      public function get bonusId() : String
      {
         return this._bonusId;
      }
      
      public function set bonusId(_arg_1:String) : void
      {
         this._bonusId = _arg_1;
      }
      
      public function get wymot() : int
      {
         return this.wib;
      }
      
      public function set wymot(_arg_1:int) : void
      {
         this.wib = _arg_1;
      }
      
      public function get miwadyrof() : Vector3d
      {
         return this.jif;
      }
      
      public function set miwadyrof(_arg_1:Vector3d) : void
      {
         this.jif = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusSpawnData [";
         _local_1 += "battleBonusObject = " + this.nezywasew + " ";
         _local_1 += "bonusId = " + this.bonusId + " ";
         _local_1 += "lifeTime = " + this.wymot + " ";
         _local_1 += "spawnPosition = " + this.miwadyrof + " ";
         return _local_1 + "]";
      }
   }
}

