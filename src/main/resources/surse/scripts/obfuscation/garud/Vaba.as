package obfuscation.garud
{
   import alternativa.math.Vector3;
   import alternativa.tanks.models.weapon.shaft.Sef;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import obfuscation.poluto.Fowu;
   import obfuscation.poluto.Wewewyjy;
   
   public class Vaba extends Hoqeg
   {
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      private var myhagegol:Boolean = false;
      
      private var qeqy:Fowu;
      
      private var kecy:Rorucozok;
      
      private var winypojo:Vector3 = new Vector3();
      
      private var josizanep:Sef;
      
      private var suzu:Wewewyjy;
      
      private var cykaqaby:Vazu;
      
      public function Vaba(_arg_1:Rib, _arg_2:Sef, _arg_3:Number)
      {
         super(_arg_1);
         this.qeqy = new Fowu(_arg_1,_arg_3);
         this.suzu = new Wewewyjy(_arg_1);
         this.kecy = new Rorucozok(_arg_2);
         this.josizanep = _arg_2;
      }
      
      public function bared() : void
      {
         var _local_1:int = 0;
         if(!this.myhagegol)
         {
            this.myhagegol = true;
            _local_1 = pulat.visefi();
            pulat.jykec();
            switch(_local_1)
            {
               case Sudyhuma.cuwycagin:
                  changeState(this.qeqy);
                  this.cykaqaby = this.qeqy;
                  return;
               case Sudyhuma.pobyhevam:
                  changeState(this.suzu);
                  this.cykaqaby = this.suzu;
            }
         }
      }
      
      public function gudowel() : void
      {
         if(this.myhagegol)
         {
            this.myhagegol = false;
            pulat.fygywocy();
            changeState(pug(pulat.visefi()));
         }
      }
      
      public function zosibukyk() : void
      {
         murafi();
      }
      
      override public function tick(_arg_1:Number) : void
      {
         super.tick(_arg_1);
         if(this.myhagegol)
         {
            this.cykaqaby.buwo(this.winypojo);
            this.kecy.update(this.winypojo);
         }
      }
      
      public function sew(_arg_1:Number) : void
      {
         this.qeqy.sew(_arg_1);
      }
      
      public function buwo(_arg_1:Vector3) : void
      {
         this.cykaqaby.buwo(_arg_1);
      }
      
      public function ruj() : Sef
      {
         return this.josizanep;
      }
   }
}

