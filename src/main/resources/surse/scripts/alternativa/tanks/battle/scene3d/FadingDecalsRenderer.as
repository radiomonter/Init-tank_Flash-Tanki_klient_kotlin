package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.objects.Decal;
   import alternativa.tanks.battle.BattleService;
   import flash.utils.getTimer;
   
   public class FadingDecalsRenderer implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var fadeTime:int;
      
      private var entries:Vector.<DecalEntry> = new Vector.<DecalEntry>();
      
      private var tilotaron:int;
      
      public function FadingDecalsRenderer(_arg_1:int)
      {
         super();
         this.fadeTime = _arg_1;
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:DecalEntry = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_7:int = 0;
         var _local_6:int = this.tilotaron;
         while(_local_7 < _local_6)
         {
            _local_3 = this.entries[_local_7];
            _local_4 = _arg_1 - _local_3.startTime;
            if(_local_4 > this.fadeTime)
            {
               _local_5++;
               battleService.getBattleScene3D().vomuh(_local_3.tol);
               --this.tilotaron;
            }
            else
            {
               _local_3.tol.alpha = 1 - _local_4 / this.fadeTime;
               if(_local_5 > 0)
               {
                  this.entries[_local_7 - _local_5] = _local_3;
               }
            }
            _local_7++;
         }
         var _local_8:int = this.tilotaron;
         while(_local_8 < _local_6)
         {
            this.entries[_local_8] = null;
            _local_8++;
         }
      }
      
      public function add(_arg_1:Decal) : void
      {
         var _local_2:* = this.tilotaron++;
         this.entries[_local_2] = new DecalEntry(_arg_1,getTimer());
      }
   }
}

