First, make sure the predict.py runs properly. Make sure torch is installed.
It worked for me with torch==1.11.0+cu102.

Then, create an index with:

```console
bash create_index.sh
```

This will look at all jpg, png, jpeg and gif files and try to find what is depicted
on them.

Then you can do:

```console
./ailocate sheep
```

(maybe you need to `chmod +x ./ailocate`.)

and you get

```
/usr/share/tuxpaint/templates/sheep.jpg -> sheep
/usr/share/scratch/Media/Backgrounds/Outdoors/hay_field.jpg -> sheep
```

This may help someone someday
