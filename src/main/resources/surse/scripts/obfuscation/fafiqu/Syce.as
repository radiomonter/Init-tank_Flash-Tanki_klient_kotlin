package obfuscation.fafiqu
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.rofa.LightAnimation;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Syce implements Vamobanoc
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Vamobanoc>;
      
      public function Syce(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Vamobanoc>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function zazyra(sydi:IGameObject, ben:Tank, jamolu:LightAnimation) : void
      {
         var hutace:int = 0;
         var nyfusi:Vamobanoc = null;
         var vypabugo:IGameObject = sydi;
         var nypekyz:Tank = ben;
         var myhupeti:LightAnimation = jamolu;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.zazyra(vypabugo,nypekyz,myhupeti);
               hutace += 1;
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

