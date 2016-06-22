#!/bin/sh

src_dir='DragonEnglish_mp3'
dist_dir='DragonEnglish_wav'

#cd $src_dir

for i in {1..99}; do
	name=$src_dir/$(printf %02d $i)
	#src_file=$(basename ${name}* | sed -e s/\ /_/g)
	#mv ${name}* $src_dir/$src_file
	src_file=$(basename ${name}*)
	dist_file=$(echo $src_file | sed -e s/mp3/wav/g)
	ffmpeg -i $src_dir/$src_file -ac 1 -ar 44100 -acodec pcm_s16le $dist_dir/$dist_file
done

