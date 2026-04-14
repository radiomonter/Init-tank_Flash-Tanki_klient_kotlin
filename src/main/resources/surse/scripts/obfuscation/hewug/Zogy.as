package obfuscation.hewug
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import forms.ColorConstants;
   import obfuscation.jyku.Myfy;
   import obfuscation.jyku.Novawilaj;
   import obfuscation.vet.Ruro;
   
   public class Zogy
   {
      
      public function Zogy()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function vicujapyl(_arg_1:Vector.<Myfy>) : void
      {
         var _local_2:Myfy = null;
         var _local_3:Tank = null;
         var _local_4:Vector3 = null;
         var _local_5:Object3D = null;
         for each(_local_2 in _arg_1)
         {
            if(_local_2.target != null)
            {
               _local_3 = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(BattleController.activeTanks[_local_2.target]).tank;
               _local_4 = BattleUtils.vemoleg;
               if(_local_3.wines)
               {
                  _local_4.copy(_local_3.sokitaqe);
                  BattleUtils.localToGlobal(_local_3.qiniwu(),_local_4);
               }
               else
               {
                  _local_5 = _local_3.bij().rocipaga();
                  _local_4.reset(_local_5.x,_local_5.y,_local_5.z);
               }
               Ruro.start(_local_4,this.raj(_local_2),_local_2.qyfuq);
            }
         }
      }
      
      private function raj(_arg_1:Myfy) : uint
      {
         switch(_arg_1.qaluju)
         {
            case Novawilaj.FATAL:
               return ColorConstants.USER_TITLE_RED;
            case Novawilaj.CRITICAL:
               return ColorConstants.USER_TITLE_YELLOW;
            case Novawilaj.HEAL:
               return ColorConstants.GREEN_TEXT;
            default:
               return ColorConstants.WHITE;
         }
      }
   }
}

