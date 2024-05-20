sudo apt-get install git gh g++ cmake-curses-gui cppcheck vulkan-tools vulkan-validationlayers
sudo apt-get install libxcb1-dev libvulkan-dev libassimp-dev libfreetype-dev libcurl4-openssl-dev
sudo apt-get install glslang-dev glslang-tools
sudo apt-get install libgdal-dev libopenexr-dev
sudo apt-get install qtbase5-dev qt5-qmake qtcreator
sudo apt-get install git-lfs

# development setup
export DEV_DIR=~/dev
export DATA_DIR=~/data
export INSTALL_DIR=~/install
export VSG_FILE_PATH=${DEV_DIR}/vsgExamples/data
export VSG_FILE_CACHE=${DATA_DIR}/vsgFileCache

cd ~
mkdir ${DEV_DIR}
cd ${DEV_DIR}
git clone https://github.com/vsg-dev/VulkanSceneGraph.git
git clone https://github.com/vsg-dev/vsgXchange
git clone https://github.com/vsg-dev/vsgImGui
git clone https://github.com/vsg-dev/vsgExamples
git clone https://github.com/vsg-dev/MyFirstVsgApplication


cd ${DEV_DIR}
cd VulkanSceneGraph; cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; cmake --build . -t install -j 16; cd ..
cd vsgXchange; cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; cmake --build . -t install -j 16; cd ..
cd vsgImGui; cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; cmake --build . -t install -j 16; cd ..
cd vsgExamples; cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; cmake --build . -t install -j 16; cd ..
cd MyFirstVsgApplication; cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; cmake --build . -t install -j 16; cd ..



wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt update && sudo apt install firefox
