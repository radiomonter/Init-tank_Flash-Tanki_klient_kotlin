package alternativa.tanks.bonuses
{
   import flash.utils.Dictionary;
   
   public class BonusCache
   {
      
      private static const parachuteCache:ObjectCache = new ObjectCache();
      
      private static const cordsCache:ObjectCache = new ObjectCache();
      
      private static var boxCaches:Dictionary = new Dictionary();
      
      public function BonusCache()
      {
         super();
      }
      
      public static function isParachuteCacheEmpty() : Boolean
      {
         return parachuteCache.isEmpty();
      }
      
      public static function getParachute() : Parachute
      {
         return Parachute(parachuteCache.Jul());
      }
      
      public static function putParachute(_arg_1:Parachute) : void
      {
         parachuteCache.put(_arg_1);
      }
      
      public static function isCordsCacheEmpty() : Boolean
      {
         return cordsCache.isEmpty();
      }
      
      public static function getCords() : Cords
      {
         return Cords(cordsCache.Jul());
      }
      
      public static function putCords(_arg_1:Cords) : void
      {
         cordsCache.put(_arg_1);
      }
      
      public static function isBonusMeshCacheEmpty(_arg_1:String) : Boolean
      {
         return getBonusMeshCache(_arg_1).isEmpty();
      }
      
      public static function getBonusMesh(_arg_1:String) : BonusMesh
      {
         return BonusMesh(getBonusMeshCache(_arg_1).Jul());
      }
      
      public static function putBonusMesh(_arg_1:BonusMesh) : void
      {
         getBonusMeshCache(_arg_1.getObjectId()).put(_arg_1);
      }
      
      public static function clear() : void
      {
         parachuteCache.clear();
         cordsCache.clear();
         clearBoxCaches();
      }
      
      private static function getBonusMeshCache(_arg_1:String) : ObjectCache
      {
         var _local_2:ObjectCache = boxCaches[_arg_1];
         if(_local_2 == null)
         {
            _local_2 = new ObjectCache();
            boxCaches[_arg_1] = _local_2;
         }
         return _local_2;
      }
      
      private static function clearBoxCaches() : void
      {
         var _local_2:ObjectCache = null;
         var _local_1:* = undefined;
         for(_local_1 in boxCaches)
         {
            _local_2 = boxCaches[_local_1];
            _local_2.clear();
            delete boxCaches[_local_1];
         }
      }
   }
}

