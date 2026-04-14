package obfuscation.kugoj
{
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Nur
   {
      
      private var dictionary:Dictionary = new Dictionary(true);
      
      public function Nur()
      {
         super();
      }
      
      public function put(_arg_1:IGameObject, _arg_2:IGameObject) : void
      {
         var _local_3:Vector.<IGameObject> = null;
         if(_arg_1 in this.dictionary)
         {
            this.dictionary[_arg_1].push(_arg_2);
         }
         else
         {
            _local_3 = new Vector.<IGameObject>();
            _local_3.push(_arg_2);
            this.dictionary[_arg_1] = _local_3;
         }
      }
      
      public function getValues(_arg_1:IGameObject) : Vector.<IGameObject>
      {
         if(_arg_1 in this.dictionary)
         {
            return this.dictionary[_arg_1];
         }
         return new Vector.<IGameObject>();
      }
      
      public function clear() : void
      {
         this.dictionary = new Dictionary();
      }
      
      public function remove(_arg_1:IGameObject, _arg_2:IGameObject) : void
      {
         var _local_3:Vector.<IGameObject> = null;
         var _local_4:Number = NaN;
         if(_arg_1 in this.dictionary)
         {
            _local_3 = this.dictionary[_arg_1];
            _local_4 = _local_3.indexOf(_arg_2);
            if(_local_4 != -1)
            {
               _local_3.splice(_local_4,1);
            }
         }
      }
   }
}

