package projects.tanks.client.tanksservices.model.notifier.uid
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   
   public class UidNotifierData extends AbstractNotifier
   {
      
      private var _uid:String;
      
      public function UidNotifierData(_arg_1:String = null)
      {
         super();
         this._uid = _arg_1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "UidNotifierData [";
         _local_1 += "uid = " + this.uid + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

