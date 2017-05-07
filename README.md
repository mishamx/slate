This is fork from [lord/slate](https://github.com/lord/slate)

Run
===
`docker run -v /path_to_docs/source:/usr/src/app/source -v /path_to_docs/build:/usr/src/app/build -p 4567:4567 mishamx/slate <command>`

Use ENV
=======

`.env-slate` use in project and tools `slate.sh`

Download
`curl -O https://raw.githubusercontent.com/mishamx/slate/master/slate.sh && chmod +x slate.sh`

Create ENV file
---------------

Run
`./slate.sh env`

and update path for your project

Run webserver
-------------
`./slate.sh run`

Build docs
----------
`./slate.sh run`

Use compose
===========

```
docs:
  image: mishamx/slate:latest
  ports:
    - 4567:4567
  volumes:
    - ./source:/usr/src/app/source
    - ./build:/usr/src/app/build
```

Init command line
-----------------
```
docker exec -it <project_name>_docs_1 bash
```

Start Up
--------
```
./startup.sh
```

