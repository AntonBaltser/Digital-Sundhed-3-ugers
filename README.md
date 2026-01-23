# Digital-Sundhed-3-ugers


-IMPORTANT--------------------------------------------------------------------------------------------------------------------------------------------------- 

1) You will need to download this repository from BitBucket to your desktop:
BitBucket link: https://bitbucket.org/movesense/movesense-mobile-lib/downloads/

2) Put the repository inside the Movesense folder inside the ios folder, if there is no Movesense folder, you can just create one.
The path to the repository folder for should match this path: '/Desktop/Digital-Sundhed-3-ugers/digital_sundhed_3_ugers/ios/Movesense/movesense-mobile-lib'

3) run 'make build' in the terminal.

-------------------------------------------------------------------------------------------------------------------------------------------------------------


```
cd digital_sundhed_3_ugers
find lib -name "*.dart" -print0 \
| sort -z \
| xargs -0 -I{} sh -c 'echo "\n// ===== {} =====\n"; cat "{}"' \
> lib_dump.txt
```
