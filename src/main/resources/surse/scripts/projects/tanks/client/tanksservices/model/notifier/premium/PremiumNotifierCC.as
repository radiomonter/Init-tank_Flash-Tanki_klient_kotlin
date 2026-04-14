package projects.tanks.client.tanksservices.model.notifier.premium
{
   public class PremiumNotifierCC
   {
      
      private var _lifeTimeInSeconds:int;
      
      public function PremiumNotifierCC(_arg_1:int = 0)
      {
         super();
         this._lifeTimeInSeconds = _arg_1;
      }
      
      public function get lifeTimeInSeconds() : int
      {
         return this._lifeTimeInSeconds;
      }
      
      public function set lifeTimeInSeconds(_arg_1:int) : void
      {
         this._lifeTimeInSeconds = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "PremiumNotifierCC [";
         _local_1 += "lifeTimeInSeconds = " + this.lifeTimeInSeconds + " ";
         return _local_1 + "]";
      }
   }
}

