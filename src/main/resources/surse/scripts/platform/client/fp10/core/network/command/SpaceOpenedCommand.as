package platform.client.fp10.core.network.command
{
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   
   public class SpaceOpenedCommand implements IConnectionInitCommand
   {
      
      public var spaceId:Long;
      
      public var hash:ByteArray;
      
      public function SpaceOpenedCommand(_arg_1:Long, _arg_2:ByteArray)
      {
         super();
         this.hash = _arg_2;
         this.spaceId = _arg_1;
      }
   }
}

