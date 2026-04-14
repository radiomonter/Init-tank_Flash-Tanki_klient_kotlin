package projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class UidCheckServiceEvents implements UidCheckService
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<UidCheckService>;
      
      public function UidCheckServiceEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<UidCheckService>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getMaxLength() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:UidCheckService = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMaxLength();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function exist(param1:String, param2:Function) : void
      {
         var i:int = 0;
         var m:UidCheckService = null;
         var uid:String = param1;
         var callback:Function = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.exist(uid,callback);
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function validate(param1:String, param2:Function) : void
      {
         var i:int = 0;
         var m:UidCheckService = null;
         var uid:String = param1;
         var callback:Function = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.validate(uid,callback);
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

