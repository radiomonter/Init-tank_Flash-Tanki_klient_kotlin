package projects.tanks.client.tanksservices.model.notifier.rank
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   
   public class RankNotifierData extends AbstractNotifier
   {
      
      private var _rank:int;
      
      public function RankNotifierData(_arg_1:int = 0)
      {
         super();
         this._rank = _arg_1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(_arg_1:int) : void
      {
         this._rank = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "RankNotifierData [";
         _local_1 += "rank = " + this.rank + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

