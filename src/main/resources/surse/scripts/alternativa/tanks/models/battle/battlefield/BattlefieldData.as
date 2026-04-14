package alternativa.tanks.models.battle.battlefield
{
   import alternativa.engine3d.objects.SkyBox;
   import alternativa.object.ClientObject;
   import alternativa.physics.PhysicsScene;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import flash.display.DisplayObjectContainer;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class BattlefieldData
   {
      
      public var bfObject:ClientObject;
      
      public var fyz:ClientObject;
      
      public var mazobek:DisplayObjectContainer;
      
      public var hihaf:BattleScene3D;
      
      public var tanks:Dictionary = new Dictionary();
      
      public var qup:Dictionary = new Dictionary();
      
      public var vyfatevy:Dictionary = new Dictionary();
      
      public var bonuses:Dictionary = new Dictionary();
      
      public var zesy:Sound;
      
      public var pyjume:Sound;
      
      public var ambientSound:Sound;
      
      public var vuji:SoundChannel;
      
      public var tyzej:Sound;
      
      public var physicsScene:PhysicsScene;
      
      public var collisionDetector:TanksCollisionDetector;
      
      public var physTime:int;
      
      public var time:int;
      
      public var skybox:SkyBox;
      
      public var tuhi:int;
      
      public var bafebyvyz:int;
      
      public function BattlefieldData()
      {
         super();
      }
   }
}

