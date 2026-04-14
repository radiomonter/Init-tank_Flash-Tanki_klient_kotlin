package alternativa.tanks.battle.scene3d
{
   import alternativa.tanks.battle.DeferredAction;
   
   public class RenderGroup
   {
      
      private const pijigiqa:Vector.<DeferredAction> = new Vector.<DeferredAction>();
      
      private var qaqidu:Vector.<Renderer> = new Vector.<Renderer>();
      
      private var size:int;
      
      private var huludyh:Boolean;
      
      public function RenderGroup()
      {
         super();
      }
      
      public function toqok(_arg_1:Renderer) : void
      {
         var _local_2:* = undefined;
         if(this.huludyh)
         {
            this.pijigiqa.push(new DeferredRendererAddition(this,_arg_1));
         }
         else if(this.qaqidu.indexOf(_arg_1) < 0)
         {
            _local_2 = this.size++;
            this.qaqidu[_local_2] = _arg_1;
         }
      }
      
      public function qahakuve(_arg_1:Renderer) : void
      {
         var _local_2:int = 0;
         if(this.huludyh)
         {
            this.pijigiqa.push(new DeferredRendererDeletion(this,_arg_1));
         }
         else
         {
            _local_2 = this.qaqidu.indexOf(_arg_1);
            if(_local_2 >= 0)
            {
               this.qaqidu[_local_2] = this.qaqidu[--this.size];
               this.qaqidu[this.size] = null;
            }
         }
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Renderer = null;
         var _local_4:int = 0;
         this.huludyh = true;
         while(_local_4 < this.size)
         {
            _local_3 = this.qaqidu[_local_4];
            _local_3.render(_arg_1,_arg_2);
            _local_4++;
         }
         this.huludyh = false;
         this.fypem();
      }
      
      private function fypem() : void
      {
         var _local_1:DeferredAction = null;
         while(true)
         {
            _local_1 = this.pijigiqa.pop();
            if(_local_1 == null)
            {
               break;
            }
            _local_1.execute();
         }
      }
   }
}

