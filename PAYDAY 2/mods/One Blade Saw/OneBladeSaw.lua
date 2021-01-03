local old_init = WeaponTweakData.init

function WeaponTweakData:init(tweak_data)
    old_init(self, tweak_data)

self.saw.CLIP_AMMO_MAX = 1500
end