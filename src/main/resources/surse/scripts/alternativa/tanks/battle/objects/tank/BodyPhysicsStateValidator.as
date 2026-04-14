package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class BodyPhysicsStateValidator
   {
      
      private const hash:EncryptedNumber = new EncryptedNumberImpl();
      
      private const qejahe:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const gajapug:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const dypapit:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const halakybar:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const loned:Vector3 = new Vector3();
      
      private const bujaheb:Quaternion = new Quaternion();
      
      private var body:Body;
      
      private var eventDispatcher:BattleEventDispatcher;
      
      public function BodyPhysicsStateValidator(_arg_1:Body, _arg_2:BattleEventDispatcher)
      {
         super();
         this.body = _arg_1;
         this.eventDispatcher = _arg_2;
         this.refresh();
      }
      
      public function refresh() : void
      {
         var _local_1:BodyState = this.body.state;
         var _local_2:Vector3 = _local_1.position;
         var _local_3:Quaternion = _local_1.orientation;
         var _local_4:Number = this.qejahe.getNumber();
         var _local_5:Number = this.gajapug.getNumber();
         var _local_6:Number = this.dypapit.getNumber();
         this.hash.setNumber(_local_4 * _local_2.x + _local_5 * _local_2.y + _local_6 * _local_2.z + _local_4 * _local_3.x + _local_5 * _local_3.y + _local_6 * _local_3.z + this.halakybar.getNumber() * _local_3.w);
         this.loned.copy(_local_2);
         this.bujaheb.copy(_local_3);
      }
      
      public function validate() : void
      {
         var _local_1:BodyState = this.body.state;
         var _local_2:Vector3 = _local_1.position;
         var _local_3:Quaternion = _local_1.orientation;
         var _local_4:Number = this.qejahe.getNumber();
         var _local_5:Number = this.gajapug.getNumber();
         var _local_6:Number = this.dypapit.getNumber();
         var _local_7:Number = _local_4 * _local_2.x + _local_5 * _local_2.y + _local_6 * _local_2.z + _local_4 * _local_3.x + _local_5 * _local_3.y + _local_6 * _local_3.z + this.halakybar.getNumber() * _local_3.w;
         if(_local_7 != this.hash.getNumber())
         {
            this.eventDispatcher.dispatchEvent(new DataValidationErrorEvent(DataValidatorType.TANK_POSITION));
         }
      }
   }
}

