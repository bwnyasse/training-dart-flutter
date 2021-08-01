cmake_minimum_required(VERSION 3.4.1) 
add_library( 
            # The native lib
            nba 
            
            # Sets the library as a shared library.
            SHARED
            
            # Provides a relative path to your source file(s).
            ../../src/nba.c
)
