package obfuscation.jewyti
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import obfuscation.bude.BattleTeam;
   import platform.client.fp10.core.type.AutoClosable;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class Feb implements Gonatedog, BattleEventListener, AutoClosable
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var derys:TankUsersRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private var ledetyles:Tank;
      
      private var vepezi:Duso;
      
      public function Feb(_arg_1:Duso)
      {
         super();
         this.vepezi = _arg_1;
         battleEventDispatcher.pugu(Tujat,this);
         contextMenuService.addEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.gerelemuw);
      }
      
      private function gerelemuw(_arg_1:ContextMenuServiceEvent) : void
      {
         var _local_2:ClientObject = derys.bebosaca(_arg_1.userId);
         this.juli(this.wybejazav(_local_2));
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Tank = Tujat(_arg_1).tank;
         if(this.ledetyles == _local_2)
         {
            this.syrekimuz();
         }
      }
      
      public function mokuby(_arg_1:KeyboardEvent) : void
      {
      }
      
      public function tabuduhy(_arg_1:KeyboardEvent) : void
      {
         this.onKey(_arg_1);
      }
      
      private function onKey(_arg_1:KeyboardEvent) : void
      {
         var _local_2:Tank = null;
         if(_arg_1.ctrlKey)
         {
            switch(_arg_1.keyCode)
            {
               case Keyboard.F:
                  _local_2 = this.sob(null);
                  break;
               case Keyboard.R:
                  _local_2 = this.sob(BattleTeam.BLUE);
                  break;
               case Keyboard.B:
                  _local_2 = this.sob(BattleTeam.RED);
                  break;
               case Keyboard.U:
                  this.syrekimuz();
            }
            if(Boolean(_local_2))
            {
               this.juli(_local_2);
            }
         }
         else if(Boolean(this.ledetyles))
         {
            switch(_arg_1.keyCode)
            {
               case Keyboard.RIGHT:
                  this.saso();
                  return;
               case Keyboard.LEFT:
                  this.fytotyne();
            }
         }
      }
      
      private function sob(_arg_1:BattleTeam) : Tank
      {
         var _local_2:ClientObject = null;
         var _local_3:Tank = null;
         var _local_5:Tank = null;
         var _local_4:Number = NaN;
         var _local_6:Number = 100000000000000000000;
         var _local_7:GameCamera = this.juvyba().cewubu();
         var _local_8:Vector3 = new Vector3(_local_7.x,_local_7.y,_local_7.z);
         for each(_local_2 in derys.wakosibi())
         {
            _local_3 = this.wybejazav(_local_2);
            if(_local_3.teamType != _arg_1 && _local_3.state == ClientTankState.neqahi)
            {
               _local_4 = _local_3.qiniwu().state.position.distanceTo(_local_8);
               if(_local_4 < _local_6)
               {
                  _local_6 = _local_4;
                  _local_5 = _local_3;
               }
            }
         }
         return _local_5;
      }
      
      private function juli(_arg_1:Tank) : void
      {
         if(_arg_1 == null)
         {
            return;
         }
         if(_arg_1.state != ClientTankState.neqahi)
         {
            return;
         }
         if(this.ledetyles == null)
         {
            battleService.bofoh();
         }
         else
         {
            this.hopymefuq();
         }
         this.ledetyles = _arg_1;
         battleService.zoru(_arg_1);
      }
      
      public function syrekimuz() : void
      {
         if(Boolean(this.ledetyles))
         {
            this.hopymefuq();
            this.ledetyles = null;
            this.vepezi.activate();
            this.vepezi.jazuhunum();
         }
      }
      
      private function hopymefuq() : void
      {
      }
      
      private function saso() : void
      {
         this.juli(this.gujusybod(1));
      }
      
      private function fytotyne() : void
      {
         this.juli(this.gujusybod(-1));
      }
      
      private function gujusybod(_arg_1:int) : Tank
      {
         var _local_2:Tank = null;
         var _local_3:Vector.<ClientObject> = derys.wakosibi();
         var _local_4:int = _local_3.indexOf(this.ledetyles.bebosaca());
         if(_local_4 == -1)
         {
            return null;
         }
         var _local_5:int = _local_4;
         while(true)
         {
            _local_5 += _arg_1;
            if(_local_5 == -1)
            {
               _local_5 = _local_3.length - 1;
            }
            else if(_local_5 == _local_3.length)
            {
               _local_5 = 0;
            }
            _local_2 = this.wybejazav(_local_3[_local_5]);
            if(_local_2.teamType == this.ledetyles.teamType && _local_2.state == ClientTankState.neqahi)
            {
               break;
            }
            if(_local_4 == _local_5)
            {
               return null;
            }
         }
         return _local_2;
      }
      
      private function wybejazav(_arg_1:ClientObject) : Tank
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         return _local_2.getTankData(_arg_1).tank;
      }
      
      private function juvyba() : BattleScene3D
      {
         return battleService.getBattleScene3D();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleEventDispatcher.kujo(Tujat,this);
         contextMenuService.removeEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.gerelemuw);
      }
   }
}

