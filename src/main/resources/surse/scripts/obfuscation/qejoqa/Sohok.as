package obfuscation.qejoqa
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapons.targeting.priority.Fylem;
   import obfuscation.megogi.Diz;
   import obfuscation.megogi.Jyzeqet;
   import obfuscation.reniril.Wit;
   
   public class Sohok implements Diz
   {
      
      private var paloz:Nogatomuz;
      
      private var jepab:Wit;
      
      public function Sohok(_arg_1:ClientObject, _arg_2:Number, _arg_3:Fylem)
      {
         super();
         this.paloz = new Nogatomuz(_arg_1,_arg_2);
         this.jepab = new Wit(_arg_3);
      }
      
      public function javacydel(_arg_1:AllGlobalGunParams) : Vector.<Jyzeqet>
      {
         var _local_2:Vector.<Lyd> = this.paloz.kiduzozik(_arg_1);
         return this.jepab.vuvesyli(_arg_1,_local_2);
      }
   }
}

