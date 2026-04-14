package obfuscation.fafiqu
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.rofa.LightAnimation;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Genyku implements Vamobanoc
   {
      
      private var object:IGameObject;
      
      private var impl:Vamobanoc;
      
      public function Genyku(_arg_1:IGameObject, _arg_2:Vamobanoc)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function zazyra(sydi:IGameObject, ben:Tank, jamolu:LightAnimation) : void
      {
         var vypabugo:IGameObject = sydi;
         var nypekyz:Tank = ben;
         var myhupeti:LightAnimation = jamolu;
         try
         {
            Model.object = this.object;
            this.impl.zazyra(vypabugo,nypekyz,myhupeti);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

