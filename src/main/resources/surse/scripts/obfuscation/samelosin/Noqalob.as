package obfuscation.samelosin
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.IShotModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.shot.ShotModelBase;
   
   public class Noqalob extends ShotModelBase implements IShotModelBase, Gupucuvyl
   {
      
      public function Noqalob()
      {
         super();
         _interfaces.push(IModel,IShotModelBase,Gupucuvyl);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Number, _arg_3:Number, _arg_4:int) : void
      {
         var _local_5:Fabiwo = new Fabiwo(_arg_4);
         _local_5.dyrewuneb.value = _arg_2;
         _local_5.dyheh.value = 2 * 180 * _arg_2 / Math.PI;
         _local_5.vom.value = _arg_3;
         _local_5.votyfyzo.value = 2 * 180 * _arg_3 / Math.PI;
         _arg_1.putParams(Noqalob,_local_5);
      }
      
      public function filelepel(_arg_1:ClientObject) : Fabiwo
      {
         return _arg_1.getParams(Noqalob) as Fabiwo;
      }
   }
}

