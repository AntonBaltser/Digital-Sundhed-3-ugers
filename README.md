# Digital-Sundhed-3-ugers

-VIGTIGT- 
Kør 'make build' i terminalen.



**Denne kode kan omdanne hele lib-filen til en text-fil som kan uploaded til AI-debugger. Indsæt det i terminalen**
```
cd digital_sundhed_3_ugers
find lib -name "*.dart" -print0 \
| sort -z \
| xargs -0 -I{} sh -c 'echo "\n// ===== {} =====\n"; cat "{}"' \
> lib_dump.txt
```
