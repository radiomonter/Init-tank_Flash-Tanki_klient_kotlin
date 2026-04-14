package alternativa.tanks.services.initialeffects
{
   import flash.utils.getTimer;
   
   public class Vudopybyc implements IInitialEffectsService
   {
      
      private var hiryfi:Vector.<Fymydacog>;
      
      public function Vudopybyc()
      {
         super();
      }
      
      public function pes(_arg_1:String) : Vector.<Fymydacog>
      {
         var _local_2:Vector.<Fymydacog> = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:Fymydacog = null;
         var _local_6:* = undefined;
         if(this.hiryfi != null)
         {
            _local_3 = int(this.hiryfi.length);
            _local_4 = 0;
            while(_local_4 < _local_3)
            {
               _local_5 = this.hiryfi[_local_4];
               if(_local_5.userId == _arg_1)
               {
                  if(_local_2 == null)
                  {
                     _local_2 = new Vector.<Fymydacog>();
                  }
                  _local_2.push(_local_5);
                  _local_6 = _local_4--;
                  this.hiryfi[_local_6] = this.hiryfi[--_local_3];
                  this.hiryfi.length = _local_3;
               }
               _local_4++;
            }
            if(_local_3 == 0)
            {
               this.hiryfi = null;
            }
         }
         return _local_2;
      }
      
      public function addInitialEffect(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         if(this.hiryfi == null)
         {
            this.hiryfi = new Vector.<Fymydacog>();
         }
         this.hiryfi.push(new Fymydacog(getTimer(),_arg_1,_arg_2,_arg_3,_arg_4));
      }
      
      public function pewy(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:int = 0;
         var _local_4:int = this.mucyqy(_arg_1,_arg_2);
         if(_local_4 >= 0)
         {
            _local_3 = int(this.hiryfi.length);
            this.hiryfi[_local_4] = this.hiryfi[--_local_3];
            this.hiryfi.length = _local_3;
         }
      }
      
      private function mucyqy(_arg_1:String, _arg_2:int) : int
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:Fymydacog = null;
         if(this.hiryfi != null)
         {
            _local_3 = int(this.hiryfi.length);
            _local_4 = 0;
            while(_local_4 < _local_3)
            {
               _local_5 = this.hiryfi[_local_4];
               if(_local_5.userId == _arg_1 && _local_5.effectId == _arg_2)
               {
                  return _local_4;
               }
               _local_4++;
            }
         }
         return -1;
      }
   }
}

