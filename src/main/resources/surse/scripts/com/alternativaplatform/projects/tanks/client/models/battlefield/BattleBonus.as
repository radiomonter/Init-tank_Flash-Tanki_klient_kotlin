package com.alternativaplatform.projects.tanks.client.models.battlefield
{
   import alternativa.types.Long;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleBonus
   {
      
      public var id:String;
      
      public var objectId:String;
      
      public var position:Vector3d;
      
      public var timeFromAppearing:int;
      
      public var timeLife:int;
      
      public var bonusResourceId:Long;
      
      public var lighting:Object;
      
      public var bonusObject:IGameObject;
      
      public function BattleBonus()
      {
         super();
      }
   }
}

