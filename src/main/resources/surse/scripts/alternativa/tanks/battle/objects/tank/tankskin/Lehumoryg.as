package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Kowagoq;
   import alternativa.tanks.battle.objects.tank.Riku;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Lehumoryg extends TankSkinPartCacheItem implements DataUnitValidator
   {
      
      public var gobifa:Vector3;
      
      private var hinahek:EncryptedNumber;
      
      private var pyz:EncryptedNumber;
      
      private var dacetokyd:EncryptedNumber;
      
      public var mesh:Mesh;
      
      public function Lehumoryg(_arg_1:Tanks3DSResource)
      {
         super(_arg_1);
         var _local_2:Vector.<Object3D> = _arg_1.getObjectsByName(/mount/i);
         if(_local_2 == null)
         {
            throw new Riku();
         }
         var _local_3:Object3D = _local_2[0];
         this.gobifa = new Vector3(_local_3.x,_local_3.y,_local_3.z);
         this.hinahek = new EncryptedNumberImpl(_local_3.x);
         this.pyz = new EncryptedNumberImpl(_local_3.y);
         this.dacetokyd = new EncryptedNumberImpl(_local_3.z);
         this.mesh = initMesh(this.kezelivew(_arg_1));
      }
      
      public function hasIncorrectData() : Boolean
      {
         return this.gobifa.x != this.hinahek.getNumber() || this.gobifa.y != this.pyz.getNumber() || this.gobifa.z != this.dacetokyd.getNumber();
      }
      
      public function getType() : int
      {
         return DataValidatorType.MEMHACK_TURRET_MOUNT_POINT;
      }
      
      private function kezelivew(_arg_1:Tanks3DSResource) : Mesh
      {
         var _local_2:Vector.<Object3D> = _arg_1.getObjectsByName(/hull/i);
         if(_local_2 == null)
         {
            throw new Kowagoq();
         }
         return Mesh(_local_2[0]);
      }
      
      public function how() : Number
      {
         return this.hinahek.getNumber();
      }
      
      public function fydypopic() : Number
      {
         return this.pyz.getNumber();
      }
      
      public function latah() : Number
      {
         return this.dacetokyd.getNumber();
      }
   }
}

