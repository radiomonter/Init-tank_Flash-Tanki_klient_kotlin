package obfuscation.garud
{
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   
   public class Tesik
   {
      
      public static var cusaj:Tesik = new Tesik(GameActionEnum.ROTATE_TURRET_LEFT,GameActionEnum.ROTATE_TURRET_RIGHT,GameActionEnum.CENTER_TURRET);
      
      public var demezuvog:GameActionEnum;
      
      public var mih:GameActionEnum;
      
      public var pezojywuc:GameActionEnum;
      
      public var hacose:GameActionEnum;
      
      public var tiqat:GameActionEnum;
      
      public function Tesik(_arg_1:GameActionEnum, _arg_2:GameActionEnum, _arg_3:GameActionEnum, _arg_4:GameActionEnum = null, _arg_5:GameActionEnum = null)
      {
         super();
         this.demezuvog = _arg_1;
         this.mih = _arg_2;
         this.pezojywuc = _arg_3;
         this.hacose = _arg_4;
         this.tiqat = _arg_5;
      }
   }
}

