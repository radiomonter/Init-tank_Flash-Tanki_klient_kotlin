package alternativa.physics.contactislands
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.QuickUnionFind;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class IslandsGenerator
   {
      
      public const contactIslands:Vector.<ContactIsland> = new Vector.<ContactIsland>();
      
      private const contactIslandsByRootId:Dictionary = new Dictionary();
      
      private const uf:QuickUnionFind = new QuickUnionFind();
      
      private var physicsScene:PhysicsScene;
      
      public function IslandsGenerator(_arg_1:PhysicsScene)
      {
         super();
         this.physicsScene = _arg_1;
      }
      
      public function generate(_arg_1:Vector.<BodyContact>, _arg_2:int) : void
      {
         this.createUnions(_arg_1,_arg_2);
         this.createIslands(_arg_1);
      }
      
      private function createUnions(_arg_1:Vector.<BodyContact>, _arg_2:int) : void
      {
         var _local_3:BodyContact = null;
         var _local_5:int = 0;
         this.uf.init(_arg_2);
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(_local_3.body1.movable && _local_3.body2.movable)
            {
               this.uf.union(_local_3.body1.id,_local_3.body2.id);
            }
            _local_5++;
         }
      }
      
      private function createIslands(_arg_1:Vector.<BodyContact>) : void
      {
         var _local_2:BodyContact = null;
         var _local_3:int = 0;
         var _local_4:ContactIsland = null;
         var _local_6:int = 0;
         var _local_8:int = 0;
         var _local_5:int = int(_arg_1.length);
         while(_local_6 < _local_5)
         {
            _local_2 = _arg_1[_local_6];
            if(_local_2.body1.movable)
            {
               _local_3 = this.uf.root(_local_2.body1.id);
            }
            else
            {
               _local_3 = this.uf.root(_local_2.body2.id);
            }
            _local_4 = this.contactIslandsByRootId[_local_3];
            if(_local_4 == null)
            {
               _local_4 = ContactIsland.create();
               this.contactIslands[this.contactIslands.length] = _local_4;
               this.contactIslandsByRootId[_local_3] = _local_4;
            }
            _local_4.bodyContacts[_local_4.bodyContacts.length] = _local_2;
            _local_6++;
         }
         var _local_7:int = int(this.contactIslands.length);
         while(_local_8 < _local_7)
         {
            _local_4 = this.contactIslands[_local_8];
            _local_4.init(this.physicsScene);
            _local_8++;
         }
         clearDictionary(this.contactIslandsByRootId);
      }
      
      public function clear() : void
      {
         var _local_1:ContactIsland = null;
         var _local_3:int = 0;
         var _local_2:int = int(this.contactIslands.length);
         while(_local_3 < _local_2)
         {
            _local_1 = this.contactIslands[_local_3];
            _local_1.dispose();
            _local_3++;
         }
         this.contactIslands.length = 0;
      }
   }
}

