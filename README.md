# IBM JavaCard Shell

Check if PC/SC and attached USB reader works:
```sh
java -Dsun.security.smartcardio.library=/usr/lib/x86_64-linux-gnu/libpcsclite.so -jar gp.jar --list
```

Launch base interactive shell:
```sh
./jcshell.sh
```

Launch interactive shell with custom functions folder:
```sh
./jcshell.sh scripts/card-applets/
```

The presence of `jcshell.rc` in the custom functions folder allows for
further customizations.

# Mifare DESFire EV2

```sh
./jcshell.sh scripts/desfire/
/atr
GetApplicationIDs
CreateApplication 0102030F0E
GetApplicationIDs
SelectApplication 010203
```
