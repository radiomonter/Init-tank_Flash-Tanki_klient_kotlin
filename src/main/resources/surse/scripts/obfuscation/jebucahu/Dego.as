package obfuscation.jebucahu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkinPartCacheItem;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Dego extends TankSkinPartCacheItem implements DataUnitValidator
   {
      
      private static const suliligez:RegExp = /box.*/i;
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*)/i;
      
      public var jyba:Vector3;
      
      public var jaruzar:Vector.<Vector3>;
      
      public var sod:Vector3;
      
      private var baju:Vector.<Vector3Validator>;
      
      private var demo:Vector.<Jybupow>;
      
      public var meshes:Vector.<Mesh> = new Vector.<Mesh>();
      
      public function Dego(_arg_1:Tanks3DSResource)
      {
         super(_arg_1);
         this.rydu(_arg_1);
         this.jyba = seleqik(_arg_1);
         this.jaruzar = this.qun(_arg_1);
         this.sod = this.nagiqusud(_arg_1);
         this.demo = this.letogylu(_arg_1);
         this.bezonod();
      }
      
      private static function seleqik(_arg_1:Tanks3DSResource) : Vector3
      {
         var _local_2:Object3D = null;
         var _local_3:Vector.<Object3D> = _arg_1.getObjectsByName(/fmnt/i);
         if(_local_3 != null)
         {
            _local_2 = _local_3[0];
            return new Vector3(_local_2.x,_local_2.y,_local_2.z);
         }
         throw new Error();
      }
      
      private function rydu(_arg_1:Tanks3DSResource) : void
      {
         var _local_2:Object3D = null;
         for each(_local_2 in _arg_1.objects)
         {
            if(_local_2 is Mesh && !EXCLUDED.test(_local_2.name))
            {
               this.meshes.push(initMesh(Mesh(_local_2)));
            }
         }
      }
      
      private function letogylu(_arg_1:Tanks3DSResource) : Vector.<Jybupow>
      {
         var _local_2:Object3D = null;
         var _local_3:Mesh = null;
         var _local_4:Vector.<Object3D> = _arg_1.getObjectsByName(suliligez);
         var _local_5:Vector.<Jybupow> = new Vector.<Jybupow>();
         if(_local_4 != null && _local_4.length != 0)
         {
            for each(_local_2 in _local_4)
            {
               _local_5.push(new Jybupow(_local_2));
            }
         }
         else
         {
            for each(_local_3 in this.meshes)
            {
               _local_5.push(new Jybupow(_local_3));
            }
         }
         return _local_5;
      }
      
      private function qun(sydi:Tanks3DSResource) : Vector.<Vector3>
      {
         var labuqocic:Object3D = null;
         var dosynegu:Tanks3DSResource = sydi;
         var jaruzar:Vector.<Vector3> = new Vector.<Vector3>();
         var vasaj:Vector.<Object3D> = dosynegu.getObjectsByName(/muzzle.*/);
         if(vasaj != null)
         {
            vasaj.sort(function(_arg_1:Object3D, _arg_2:Object3D):Number
            {
               if(_arg_1.name <= _arg_2.name)
               {
                  return -1;
               }
               return 1;
            });
            for each(labuqocic in vasaj)
            {
               jaruzar.push(new Vector3(labuqocic.x,labuqocic.y,labuqocic.z));
            }
            return jaruzar;
         }
         throw new Error();
      }
      
      private function nagiqusud(_arg_1:Tanks3DSResource) : Vector3
      {
         var _local_2:Object3D = null;
         var _local_3:Vector.<Object3D> = _arg_1.getObjectsByName(/laser/i);
         if(_local_3 != null)
         {
            _local_2 = _local_3[0];
            return new Vector3(_local_2.x,_local_2.y,_local_2.z);
         }
         return this.jaruzar[0];
      }
      
      private function bezonod() : void
      {
         var _local_1:int = 0;
         this.baju = new Vector.<Vector3Validator>(this.jaruzar.length);
         while(_local_1 < this.jaruzar.length)
         {
            this.baju[_local_1] = new Vector3Validator(this.jaruzar[_local_1]);
            _local_1++;
         }
      }
      
      public function hasIncorrectData() : Boolean
      {
         var _local_1:Vector3Validator = null;
         for each(_local_1 in this.baju)
         {
            if(!_local_1.isValid())
            {
               return true;
            }
         }
         return false;
      }
      
      public function getType() : int
      {
         return DataValidatorType.MEMHACK_MUZZLE_POSITION;
      }
      
      public function bimehewoc() : Vector.<Jybupow>
      {
         return this.demo;
      }
   }
}

