package alternativa.tanks.model.garage
{
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Qaqenifa implements Voku
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Voku>;
      
      public function Qaqenifa(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Voku>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function showConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:int = -1) : void
      {
         var i:int = 0;
         var m:Voku = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showConfirmAlert(param1,param2,param3,param4,param5,param6);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

