package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.media.Sound;
   
   public class BattleData
   {
      
      public var pyjume:Sound;
      
      public var ambientSound:Sound;
      
      public var vonadeny:Sound;
      
      private var bafebyvyz:EncryptedInt = new EncryptedIntImpl();
      
      public function BattleData()
      {
         super();
      }
      
      public function synuwuf(_arg_1:int) : void
      {
         this.bafebyvyz.setInt(_arg_1);
      }
      
      public function duzyna() : int
      {
         return this.bafebyvyz.getInt();
      }
   }
}

