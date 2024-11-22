# Needs to be executed with sudo if installed in /usr
#mkdir /usr/local/blender && \
#curl -SL "http://mirror.cs.umn.edu/blender.org/release/Blender2.92/blender-2.92.0-linux64.tar.xz" -o blender.tar.xz && \
#tar -xvf blender.tar.xz -C /usr/local/blender --strip-components=1 && \
#rm blender.tar.xz && ln -s /usr/local/blender/blender /usr/local/bin/blender

# Or just install in current folder
mkdir blender && \
curl -SL "http://mirror.cs.umn.edu/blender.org/release/Blender2.92/blender-2.92.0-linux64.tar.xz" -o blender.tar.xz && \
tar -xvf blender.tar.xz -C ./blender --strip-components=1 && \
rm blender.tar.xz #&& ln -s /usr/local/blender/blender /usr/local/bin/blender