#!/bin/bash

docker run -d --name fedora_for_students -v fedora_for_students_home:/home -v fedora_for_students_root:/root -v fedora_for_students_etc:/etc vodolaz095/fedora_for_students
