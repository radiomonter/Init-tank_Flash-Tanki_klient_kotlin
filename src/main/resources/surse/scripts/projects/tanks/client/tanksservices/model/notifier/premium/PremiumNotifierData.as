package projects.tanks.client.tanksservices.model.notifier.premium
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   
   public class PremiumNotifierData extends AbstractNotifier
   {
      
      private var _premiumTimeLeftInSeconds:int;
      
      public function PremiumNotifierData(_arg_1:int = 0)
      {
         super();
         this._premiumTimeLeftInSeconds = _arg_1;
      }
      
      public function get premiumTimeLeftInSeconds() : int
      {
         return this._premiumTimeLeftInSeconds;
      }
      
      public function set premiumTimeLeftInSeconds(_arg_1:int) : void
      {
         this._premiumTimeLeftInSeconds = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "PremiumNotifierData [";
         _local_1 += "premiumTimeLeftInSeconds = " + this.premiumTimeLeftInSeconds + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

