# Dell XPS 9530 (2023) Configs

## Battery Life and DGPU Shutdown

1. Make sure tlp and cronie is installed
2. Enable tlp using `sudo systemctl enable --now tlp.service`
3. Check using `sudo tlp-stat` or `sudo tlp-stat -s`
4. Enable cronie using `sudo systemctl enable --now cronie.service`
5. Edit the root user crontab using `sudo crontab -e`
6. Add this line to the crontab (this will kick off the ARC A370M from the PCI bus drastically decreasing the discharge rate)

```bash
@reboot /usr/bin/sleep 5 && /usr/bin/echo '1' > '/sys/bus/pci/devices/0000:03:00.0/remove'
```

7. Reboot and you should be getting a way lower discharge rate
8. Check if it has been kicked off by using `sudo tlp-stat` or using something like `fastfetch`

## Speakers

1. Ensure pipewire is installed and the service is enable and in use
2. You can use something like pavucontrol to control your audio stuff
3. Stow the pipewire config 1. this contains the equalizer file
4. Restart pipewire service

```bash
systemctl --user restart pipewire
```

5. Use `wpctl status` to find ID for the "xps-speakers" node
6. User `wpctl set-default <xps-speakers ID>` **ONCE** to enable the changes to the speakers 1. Usually tab-completing after `set-default` will show which to use
