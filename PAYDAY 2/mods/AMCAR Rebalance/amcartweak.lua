local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

self.amcar.AMMO_MAX = 240
self.amcar.fire_mode_data = {fire_rate =  0.0833333}
self.amcar.stats.damage = 54
self.amcar.stats.spread = 13

end
