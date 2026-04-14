package alternativa.tanks.utils
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class EncryptedCollisionBoxData
   {
      
      private const halfSizeX:EncryptedNumber = new EncryptedNumberImpl();
      
      private const halfSizeY:EncryptedNumber = new EncryptedNumberImpl();
      
      private const halfSizeZ:EncryptedNumber = new EncryptedNumberImpl();
      
      private var hs:Vector3;
      
      public function EncryptedCollisionBoxData(_arg_1:CollisionBox)
      {
         super();
         this.hs = _arg_1.hs;
         this.halfSizeX.setNumber(_arg_1.hs.x);
         this.halfSizeY.setNumber(_arg_1.hs.y);
         this.halfSizeZ.setNumber(_arg_1.hs.z);
      }
      
      public function isInvalid() : Boolean
      {
         return this.hs.x != this.halfSizeX.getNumber() || this.hs.y != this.halfSizeY.getNumber() || this.hs.z != this.halfSizeZ.getNumber();
      }
   }
}

