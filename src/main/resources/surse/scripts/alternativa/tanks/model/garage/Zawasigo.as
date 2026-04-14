package alternativa.tanks.model.garage
{
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Zawasigo implements Voku
   {
      
      private var object:IGameObject;
      
      private var impl:Voku;
      
      public function Zawasigo(_arg_1:IGameObject, _arg_2:Voku)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function showConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:int = -1) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showConfirmAlert(param1,param2,param3,param4,param5,param6);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

