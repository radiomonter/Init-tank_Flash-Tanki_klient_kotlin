package alternativa.tanks.models.battle.battlefield
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.SkyBox;
   import obfuscation.kisagehy.Joqece;
   
   public class BattleSkyBox extends SkyBox
   {
      
      private static const zahedezar:int = 200000;
      
      public function BattleSkyBox(_arg_1:Joqece)
      {
         var _local_2:TextureMaterial = new TextureMaterial(_arg_1.left.data);
         var _local_3:TextureMaterial = new TextureMaterial(_arg_1.right.data);
         var _local_4:TextureMaterial = new TextureMaterial(_arg_1.front.data);
         var _local_5:TextureMaterial = new TextureMaterial(_arg_1.back.data);
         var _local_6:TextureMaterial = new TextureMaterial(_arg_1.top.data);
         var _local_7:TextureMaterial = new TextureMaterial(_arg_1.bottom.data);
         super(zahedezar,_local_2,_local_3,_local_5,_local_4,_local_7,_local_6,0);
      }
   }
}

