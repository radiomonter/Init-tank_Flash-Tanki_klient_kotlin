package obfuscation.lysu
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.sfx.GraphicEffect;
   import flash.utils.Dictionary;
   
   public class Soja
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var effects:Dictionary = new Dictionary();
      
      public function Soja()
      {
         super();
      }
      
      public function vakydiqip(_arg_1:Tank, _arg_2:GraphicEffect) : void
      {
         this.effects[_arg_1] = _arg_2;
         battleService.getBattleScene3D().addGraphicEffect(_arg_2);
      }
      
      public function zolycoz(_arg_1:Tank) : void
      {
         var _local_2:GraphicEffect = this.effects[_arg_1];
         if(_local_2 != null)
         {
            _local_2.kill();
            delete this.effects[_arg_1];
         }
      }
   }
}

