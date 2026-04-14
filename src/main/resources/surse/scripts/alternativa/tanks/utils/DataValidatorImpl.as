package alternativa.tanks.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   
   public class DataValidatorImpl implements DataValidator
   {
      
      private static const zero:EncryptedInt = new EncryptedIntImpl();
      
      private static const one:EncryptedInt = new EncryptedIntImpl(1);
      
      private static const numChecksPerTick:EncryptedInt = new EncryptedIntImpl(5);
      
      private const currentIndex:EncryptedInt = new EncryptedIntImpl();
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var validators:Vector.<DataUnitValidator> = new Vector.<DataUnitValidator>();
      
      public function DataValidatorImpl(_arg_1:OSGi)
      {
         super();
         this.battleEventDispatcher = BattleEventDispatcher(_arg_1.getService(BattleEventDispatcher));
      }
      
      public function addValidator(_arg_1:DataUnitValidator) : void
      {
         if(this.validators.indexOf(_arg_1) < zero.getInt())
         {
            this.validators.push(_arg_1);
         }
      }
      
      public function removeValidator(_arg_1:DataUnitValidator) : void
      {
         var _local_2:int = this.validators.indexOf(_arg_1);
         if(_local_2 >= zero.getInt())
         {
            this.validators.splice(_local_2,one.getInt());
         }
      }
      
      public function removeAllValidators() : void
      {
         this.validators.length = zero.getInt();
      }
      
      public function tick() : void
      {
         var _local_1:int = 0;
         var _local_2:DataUnitValidator = null;
         if(this.validators.length > zero.getInt())
         {
            _local_1 = zero.getInt();
            while(_local_1 < numChecksPerTick.getInt())
            {
               _local_2 = this.getNextValidator();
               if(_local_2.hasIncorrectData())
               {
                  this.battleEventDispatcher.dispatchEvent(new DataValidationErrorEvent(_local_2.getType()));
                  return;
               }
               _local_1++;
            }
         }
      }
      
      private function getNextValidator() : DataUnitValidator
      {
         return this.validators[this.getNextIndex()];
      }
      
      private function getNextIndex() : int
      {
         var _local_1:int = this.currentIndex.getInt();
         if(++_local_1 >= this.validators.length)
         {
            _local_1 = zero.getInt();
         }
         this.currentIndex.setInt(_local_1);
         return _local_1;
      }
   }
}

