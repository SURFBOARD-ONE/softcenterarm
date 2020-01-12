# Softcenter for AARCH64

本软件中心是基于armv7l平台路由器的软件中心,适用于linux内核为2.6.36.4和3.14的armv7l架构的路由器！

## 兼容机型

支持的机型：
1. 华硕 `RT-AC56U` `RT-AC68U` `RT-AC66U-B1` `RT-AC1900P` `RT-AC87U` `RT-AC88U` `RT-AC3100` `RT-AC3200` `RT-AC5300` `RT-ACRH17`
2. 网件 `R6300V2` `R6400` `R6900` `R7000` `R8000` `R8500` `R8000`
3. 斐讯 `K3`

## 开发须知：

如果你是开发者，想要开发新的插件，并用离线包的方式进行传播，请了解以下内容：

1. 在程序方面：由于固件采用了版本为2.6.36.4/3.14的linux内核，和armv7的编译器，所以请确保你编译的程序是armv7架构的。个不同风格的UI，建议可以用css或者定制不同的asp文件，但是后台脚本而二进制保持一致。

**软件中心各架构列表：**

|  软件中心   |                        mips软件中心                        |                 arm软件中心                  |                      hnd/axhnd软件中心                       |                    armng软件中心                    |
| :---------: | :----------------------------------------------------------: | :---------------------------------------------: | :----------------------------------------------------------: | :-----------------------------------------------: |
|  项目名称   | [softcenter](https://github.com/paldier/softcenter) | [softcenterarm](https://github.com/paldier/softcenterarm) |       [softcenterarm64](https://github.com/paldier/softcenterarm64)        | [softcenterarmng](https://github.com/paldier/softcenterarmng) |
|  适用架构   |                            mips                            |                     armv7l                      |                       aarch64                     |                        armv7l                        |
|    平台     |                             mips                              |                       arm                       |                          hnd/axhnd                           |                     arm                      |
|  linux内核  |                          3.10.104                           |                    2.6.36.4/3.14                     |                        4.1.27/4.1.51                         |                       4.1.49/4.1.52                        |
|     CPU     |                          grx500                           |                    bcm4708/9/ipq4019                    |                          bcm4906/8                           |                     bcm6750/1/2/3/4/5                     |
|  固件版本   |                    MerlinR 5.0.0                     |              MerlinR 5.0.0              |                     MerlinR 5.0.0                      |                  MerlinR 5.0.0                    |
| 软件中心api |                          **1.1** 代                          |                   **1.1** 代                    |                          **1.1** 代                          |                    **1.1** 代                     |
| 代表机型-1  | [BLUECAVE](https://github.com/paldier/bluecave-merlin) |              [RT-AC68U](https://github.com/paldier/rtac68u)               | [RT-AC86U](https://github.com/paldier/86u-merlin) |                         TUF-AX3000                        |
| 代表机型-2  | [K3C](https://github.com/paldier/K3C-merlin) |              [K3](https://github.com/paldier/K3-merlin.ng)              | [GT-AC2900](https://github.com/paldier/gt-ac2900) |                         RT-AX58U                        |
| 代表机型-3  | [RAX40](https://github.com/paldier/rax40-merlin) |         [SBRAC1900P](https://github.com/paldier/sbrac1900p-merlin)                                        | [R8000P](https://github.com/paldier/r8000p-merlin) |                        RAX20                         |
| 代表机型-4  | DIR2680 |  [RT-ACRH17](https://github.com/paldier/acrh17-merlin)                              | RAX80 |                        RT-AX56U                         |


