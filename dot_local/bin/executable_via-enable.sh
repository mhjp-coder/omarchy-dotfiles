#!/usr/bin/env bash
# Enables Keychron keyboard access for VIA, launches VIA in Chromium as a web app,
# then revokes access after the app closes.

set -euo pipefail

# List HID devices
for f in /dev/hidraw*; do
  FILE=${f##*/}
  if [[ -r "/sys/class/hidraw/${FILE}/device/uevent" ]]; then
    DEVICE=$(grep -m1 '^HID_NAME=' "/sys/class/hidraw/${FILE}/device/uevent" | cut -d '=' -f2- || true)
  else
    DEVICE="UNKNOWN"
  fi
  printf "%s\t%s\n" "$FILE" "${DEVICE:-UNKNOWN}"
done

echo
read -r -p "Please enter ID of your keyboard (Default: 1): " hidraw_id
hidraw_id="${hidraw_id:-1}"
hid_path="/dev/hidraw${hidraw_id}"

# Ensure we revoke permission on exit no matter what
cleanup() {
  sudo chmod go-rw "$hid_path" || true
}
trap cleanup EXIT

# Grant access
sudo chmod go+rw "$hid_path"

# Launch VIA and wait until it closes
if command -v chromium >/dev/null 2>&1; then
  # Launch Chromium in app mode and block until the window closes
  chromium --app=https://usevia.app
elif command -v omarchy-launch-webapp >/dev/null 2>&1; then
  # Fallback to omarchy launcher and wait
  omarchy-launch-webapp https://usevia.app &
  app_pid=$!
  if ps -p "$app_pid" >/dev/null 2>&1; then
    wait "$app_pid" || true
  fi
  # In case the launcher exits immediately, wait for Chromium processes to finish
  while pgrep -x chromium >/dev/null || pgrep -x chromium-browser >/dev/null; do
    sleep 1
  done
else
  echo "Neither chromium nor omarchy-launch-webapp found. Please install Chromium."
fi

# Permissions are revoked by the trap on exit
exit 0

