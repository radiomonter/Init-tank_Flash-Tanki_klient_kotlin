package alternativa.tanks.utils
{
   public class EncryptedIntImpl implements EncryptedInt
   {
      
      private var mask:int;
      
      private var value:int;
      
      public function EncryptedIntImpl(_arg_1:int = 0)
      {
         super();
         this.setInt(_arg_1);
      }
      
      public function setInt(_arg_1:int) : void
      {
         this.mask = Math.random() * 4294967295;
         this.value = _arg_1 ^ this.mask;
      }
      
      public function getInt() : int
      {
         return this.value ^ this.mask;
      }
   }
}

