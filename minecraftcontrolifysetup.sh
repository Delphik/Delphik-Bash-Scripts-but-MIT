
#!/bin/bash

# Install PolyMC if not already installed
if ! flatpak list | grep -q org.polymc.PolyMC; then
    echo "Installing PolyMC..."
    flatpak install flathub org.polymc.PolyMC -y
fi

# Create a new Minecraft 1.20.4 instance with Fabric
instance_name="Minecraft_1.20.4_Modded"
echo "Creating Minecraft 1.20.4 instance with Fabric..."
flatpak run org.polymc.PolyMC --launch --server --profile $instance_name --version 1.20.4 --loader fabric

# Define the mods to install
mods=(
    "controllify"
    "cloth-config"
    "dynamic-fps"o
    "entityculling"
    "fabric-api"o
    "ferritecore"
    "memoryleakfix"
    "modmenu"
)

# Install mods
echo "Installing mods..."
for mod in "${mods[@]}"; do
    echo "Installing $mod..."
    flatpak run org.polymc.PolyMC --launch --server --profile $instance_name --install-mod $mod
done

echo "Minecraft 1.20.4 instance with mods has been created and set up successfully!"
