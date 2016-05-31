# ParticleSystemDemo
iOS自带粒子系统实现的下雪动画

此demo中的下雪动画为了营造更逼真的景深效果，设置了前后2层粒子，前景雪的粒子数量较少，较大，背面的粒子数量较多，颗粒较小。

大家可以作为参考，在此基础上做参数调整，达到自己满意效果。


需要的framework：
QuartzCore.framework

注意：如果是用UIEffectDesigner导出的ped文件，
注意设置self.transform = CGAffineTransformMake(1, 0, 0, -1, 0, self.bounds.size.height);

如果使用中有疑问，可以联系我一起讨论。

QQ：181212425
