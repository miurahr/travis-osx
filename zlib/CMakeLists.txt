add_library(zlib OBJECT
    crc32.h deflate.h inffast.h inffixed.h inflate.h inftrees.h trees.h zconf.h zutil.h
    adler32.c compress.c crc32.c deflate.c gzio.c infback.c inffast.c inflate.c inftrees.c trees.c
    uncompr.c zutil.c)
target_sources(z PRIVATE $<TARGET_OBJECTS:zlib>)
