#!/bin/bash

TARGET_DIR="${1:-$HOME}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory '$TARGET_DIR' does not exist"
    exit 1
fi

echo "Stowing all directories to target: $TARGET_DIR"
echo "Current directory: $(pwd)"
echo "-----------------------------------"

for dir in */; do
    if [ -d "$dir" ]; then
        dir=${dir%/}
        echo "Stowing $dir..."
        if stow -nv -t "$TARGET_DIR" "$dir" 2>&1 | grep -q "CONFLICT"; then
            echo "⚠️  Conflicts detected in $dir, skipping..."
            stow -nv -t "$TARGET_DIR" "$dir"
        else
            if stow -v -t "$TARGET_DIR" "$dir"; then
                echo "✓ Successfully stowed $dir"
            else
                echo "❌ Failed to stow $dir"
            fi
        fi
        echo "-----------------------------------"
    fi
done

echo "Stowing complete!"
