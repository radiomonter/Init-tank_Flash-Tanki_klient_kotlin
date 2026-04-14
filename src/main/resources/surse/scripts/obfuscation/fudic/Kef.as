package obfuscation.fudic
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import com.alternativaplatform.projects.tanks.client.warfare.models.colortransform.ColorTransformModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.colortransform.IColorTransformModelBase;
   
   public class Kef extends ColorTransformModelBase implements IColorTransformModelBase, Zeniry
   {
      
      public function Kef()
      {
         super();
         _interfaces.push(IModel,Zeniry);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Array) : void
      {
         var _local_5:int = 0;
         var _local_3:uint = _arg_2.length;
         var _local_4:Vector.<Hyfo> = new Vector.<Hyfo>(_local_3);
         while(_local_5 < _local_3)
         {
            _arg_1.putParams(Kef,_local_4);
            _local_5++;
         }
      }
      
      public function hely(_arg_1:ClientObject) : Vector.<Hyfo>
      {
         return Vector.<Hyfo>(_arg_1.getParams(Kef));
      }
   }
}

