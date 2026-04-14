package alternativa.tanks.service.itempropertyparams
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ItemInfoPanelBitmaps;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Nijazote implements ItemPropertyParamsService
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logger:IClientLog;
      
      private static const vytejydad:Number = 180 / Math.PI;
      
      private var gacase:Object;
      
      public function Nijazote()
      {
         super();
      }
      
      public function getParams(_arg_1:ItemGarageProperty) : Bekipudi
      {
         var _local_2:Error = null;
         if(this.gacase == null)
         {
            this.zamacora();
         }
         var _local_3:Bekipudi = this.gacase[_arg_1];
         if(_local_3 == null)
         {
            _local_2 = new Error("Not found params for property " + _arg_1);
            logger.logError("error",_local_2.message);
            throw _local_2;
         }
         return _local_3;
      }
      
      public function zamacora() : void
      {
         this.gacase = {};
         this.gep(ItemGarageProperty.HULL_ARMOR,1,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_PROTECTION_PROPERTY,ItemProperty.HULL_ARMOR);
         this.gep(ItemGarageProperty.HULL_SPEED,2,ItemInfoPanelBitmaps.speed,TanksLocale.TEXT_GARAGE_MAX_SPEED_PROPERTY,ItemProperty.HULL_SPEED);
         this.gep(ItemGarageProperty.HULL_TURN_SPEED,3,ItemInfoPanelBitmaps.turnspeed,TanksLocale.TEXT_GARAGE_TURN_PROPERTY,ItemProperty.HULL_TURN_SPEED);
         this.gep(ItemGarageProperty.HULL_MASS,4,ItemInfoPanelBitmaps.hullMass,TanksLocale.TEXT_GARAGE_WEIGHT_PROPERTY,ItemProperty.HULL_MASS);
         this.gep(ItemGarageProperty.HULL_POWER,5,ItemInfoPanelBitmaps.hullPower,TanksLocale.TEXT_GARAGE_POWER_PROPERTY,ItemProperty.HULL_ACCELERATION,100);
         this.wymedar(ItemGarageProperty.DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,Sycykeqi.hysonifyg);
         this.gep(ItemGarageProperty.ISIS_HEALING_PER_SECOND,1,ItemInfoPanelBitmaps.healRate,TanksLocale.TEXT_GARAGE_HEAL_PROPERTY,ItemProperty.ISIS_HEALING_PER_PERIOD);
         this.gep(ItemGarageProperty.ISIS_DAMAGE,2,ItemInfoPanelBitmaps.vampireRate,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.gep(ItemGarageProperty.ISIS_SELF_HEALING_PERCENT,3,ItemInfoPanelBitmaps.selfMedicationPercent,TanksLocale.TEXT_GARAGE_SELF_HEAL_PROPERTY,ItemProperty.ISIS_SELF_HEALING_PERCENT);
         this.gep(ItemGarageProperty.ISIS_RADIUS,22,ItemInfoPanelBitmaps.healingRadius,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.ISIS_RADIUS);
         this.gep(ItemGarageProperty.DAMAGE_PER_SECOND,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.wymedar(ItemGarageProperty.WEAPON_COOLDOWN_TIME,5,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,ItemProperty.WEAPON_CHARGING_TIME,0.001);
         this.gep(ItemGarageProperty.WEAPON_CHARGE_RATE,4,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,1);
         this.gep(ItemGarageProperty.AIMING_MODE_DAMAGE,1,ItemInfoPanelBitmaps.shaftDamage,TanksLocale.TEXT_GARAGE_SNIPING_DAMAGE_PROPERTY,ItemProperty.SHAFT_AIMING_MODE_MAX_DAMAGE);
         this.gep(ItemGarageProperty.SHAFT_AIMED_SHOT_IMPACT,2,ItemInfoPanelBitmaps.aimingImpactForce,TanksLocale.TEXT_GARAGE_SNIPING_IMPACT_PROPERTY,ItemProperty.SHAFT_AIMED_SHOT_IMPACT);
         this.wymedar(ItemGarageProperty.SHAFT_ARCADE_DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_ARCADE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,Sycykeqi.hysonifyg);
         this.gep(ItemGarageProperty.TURRET_TURN_SPEED,7,ItemInfoPanelBitmaps.turretRotationRate,TanksLocale.TEXT_GARAGE_ROTATION_PROPERTY,ItemProperty.TURRET_TURN_SPEED);
         this.gep(ItemGarageProperty.SHOT_RANGE,9,ItemInfoPanelBitmaps.range,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_RADIUS);
         this.gep(ItemGarageProperty.WEAPON_MIN_DAMAGE_PERCENT,30,ItemInfoPanelBitmaps.minDamagePercent,TanksLocale.TEXT_GARAGE_DISTANT_DAMAGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_PERCENT);
         this.gep(ItemGarageProperty.SMOKY_RESISTANCE,13,ItemInfoPanelBitmaps.mechResistance,TanksLocale.TEXT_GARAGE_SMOKY_PROTECTION_PROPERTY,ItemProperty.SMOKY_RESISTANCE);
         this.gep(ItemGarageProperty.FIREBIRD_RESISTANCE,14,ItemInfoPanelBitmaps.fireResistance,TanksLocale.TEXT_GARAGE_FIREBIRD_PROTECTION_PROPERTY,ItemProperty.FIREBIRD_RESISTANCE);
         this.gep(ItemGarageProperty.TWINS_RESISTANCE,15,ItemInfoPanelBitmaps.plasmaResistance,TanksLocale.TEXT_GARAGE_TWINS_PROTECTION_PROPERTY,ItemProperty.TWINS_RESISTANCE);
         this.gep(ItemGarageProperty.RAILGUN_RESISTANCE,16,ItemInfoPanelBitmaps.railResistance,TanksLocale.TEXT_GARAGE_RAILGUN_PROTECTION_PROPERTY,ItemProperty.RAILGUN_RESISTANCE);
         this.gep(ItemGarageProperty.ISIS_RESISTANCE,17,ItemInfoPanelBitmaps.vampireResistance,TanksLocale.TEXT_GARAGE_ISIDA_PROTECTION_PROPERTY,ItemProperty.ISIS_RESISTANCE);
         this.gep(ItemGarageProperty.THUNDER_RESISTANCE,18,ItemInfoPanelBitmaps.thunderResistance,TanksLocale.TEXT_GARAGE_THUNDER_PROTECTION_PROPERTY,ItemProperty.THUNDER_RESISTANCE);
         this.gep(ItemGarageProperty.FREEZE_RESISTANCE,19,ItemInfoPanelBitmaps.freezeResistance,TanksLocale.TEXT_GARAGE_FREEZE_PROTECTION_PROPERTY,ItemProperty.FREEZE_RESISTANCE);
         this.gep(ItemGarageProperty.RICOCHET_RESISTANCE,20,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.RICOCHET_RESISTANCE);
         this.gep(ItemGarageProperty.SHAFT_RESISTANCE,21,ItemInfoPanelBitmaps.shaftResistance,TanksLocale.TEXT_GARAGE_SHAFT_PROTECTION_PROPERTY,ItemProperty.SHAFT_RESISTANCE);
         this.gep(ItemGarageProperty.ALL_RESISTANCE,25,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_ALL_PROTECTION_PROPERTY,ItemProperty.ALL_RESISTANCE);
         this.gep(ItemGarageProperty.WEAPON_IMPACT_FORCE,4,ItemInfoPanelBitmaps.impactForce,TanksLocale.TEXT_GARAGE_IMPACT_PROPERTY,ItemProperty.IMPACT_FORCE);
         this.gep(ItemGarageProperty.WEAPON_WEAKENING_COEFF,28,ItemInfoPanelBitmaps.piercingCoeff,TanksLocale.TEXT_GARAGE_PENETRATING_PROPERTY,ItemProperty.WEAPON_WEAKENING_COEFF);
         this.gep(ItemGarageProperty.CRITICAL_HIT_CHANCE,23,ItemInfoPanelBitmaps.percent,TanksLocale.TEXT_GARAGE_CRITICAL_CHANCE_PROPERTY,ItemProperty.CRITICAL_HIT_CHANCE);
         this.gep(ItemGarageProperty.CRITICAL_HIT_DAMAGE,24,ItemInfoPanelBitmaps.smokyCrit,TanksLocale.TEXT_GARAGE_CRITICAL_DAMAGE_PROPERTY,ItemProperty.CRITICAL_HIT_DAMAGE);
         this.gep(ItemGarageProperty.FIRE_DAMAGE,25,ItemInfoPanelBitmaps.firebird,TanksLocale.TEXT_GARAGE_BURN_PROPERTY,ItemProperty.FLAME_TEMPERATURE_LIMIT);
         this.gep(ItemGarageProperty.WEAPON_RETICLE_SPEED,26,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.WEAPON_RETICLE_SPEED);
      }
      
      private function gep(_arg_1:ItemGarageProperty, _arg_2:int, _arg_3:BitmapData, _arg_4:String, _arg_5:ItemProperty, _arg_6:Number = 1) : void
      {
         var _local_7:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _local_7.push(_arg_5);
         this.lywumy(_arg_1,_arg_2,_arg_3,localeService.getText(_arg_4),_local_7,Sycykeqi.cogij,_arg_6);
      }
      
      private function wymedar(_arg_1:ItemGarageProperty, _arg_2:int, _arg_3:BitmapData, _arg_4:String, _arg_5:ItemProperty, _arg_6:ItemProperty, _arg_7:Number = 1, _arg_8:Sycykeqi = null) : void
      {
         if(_arg_8 == null)
         {
            _arg_8 = Sycykeqi.cogij;
         }
         var _local_9:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _local_9.push(_arg_5);
         _local_9.push(_arg_6);
         this.lywumy(_arg_1,_arg_2,_arg_3,localeService.getText(_arg_4),_local_9,_arg_8,_arg_7);
      }
      
      private function lywumy(_arg_1:ItemGarageProperty, _arg_2:int, _arg_3:BitmapData, _arg_4:String, _arg_5:Vector.<ItemProperty>, _arg_6:Sycykeqi, _arg_7:Number = 1) : void
      {
         this.gacase[_arg_1] = new Bekipudi(_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7);
      }
   }
}

