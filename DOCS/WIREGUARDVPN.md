# Proton VPN WireGuard Setup (Arch Linux + iwd)

This guide covers the manual configuration of Proton VPN using WireGuard, bypassing the NetworkManager-dependent official client.

## 1. Prerequisites

Install the native WireGuard tools and iptables (for the Kill Switch):

```bash
sudo pacman -S wireguard-tools iptables
```

## 2. Obtain Proton VPN Configuration

1. Log in to your Proton VPN Dashboard.
2. Navigate to WireGuard configuration.
3. **Naming**: Enter a device name (e.g., `ArchLaptop`).
4. **Server Selection**:
   - Select United States.
   - Choose a specific server (e.g., `US-FREE#10`) for geographic consistency.
5. **Download**: Save the `.conf` file to your computer.

## 3. Local Configuration Setup

Move and Rename:

```bash
sudo mv ~/Downloads/US-FREE-10_WireGuard.conf /etc/wireguard/proton.conf
```

Edit the config:

```bash
sudo vim /etc/wireguard/proton.conf
```

Comment out the DNS line:

Locate `DNS = 10.2.0.1` and add a `#`:

```ini
# DNS = 10.2.0.1
```

## 4. Security: The Kill Switch (iptables)

A Kill Switch prevents your real IP from leaking if the VPN disconnects. We use `PostUp` and `PostDown` hooks in your WireGuard config to automate this.

Open your config again:

```bash
sudo nano /etc/wireguard/proton.conf
```

Under the `[Interface]` section (below your `PrivateKey`), paste these lines:

```ini
# Kill Switch: Allow traffic only through the VPN interface
PostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
PostDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
```

### 4.5. How to Test the Killswitch

To verify this works, we will "break" the tunnel while it's supposed to be active.

1. **Connect**: `sudo wg-quick up proton`

2. **Verify Internet**: `ping google.com` (Should work).

3. **Simulate Failure**: Manually delete the IP address from the VPN interface:

   ```bash
   sudo ip address del 10.2.0.2/32 dev proton
   ```

4. **The "Kill" Test**: Try to ping again: `ping google.com`
   - **Success**: You get an immediate `Destination Port Unreachable` or the ping just hangs. Your browser should fail to load anything.
   - **Fail**: If Google loads, your killswitch is not active.

5. **Restore**: Run `sudo wg-quick down proton` then `sudo wg-quick up proton` to reset.

6. **Reset if you get locked out**: If you get locked out of your own internet, run this to flush the rules: `sudo iptables -F`

## 5. Privacy: Testing for DNS Leaks

Since we commented out the VPN's internal DNS to avoid resolvconf errors, your laptop might still use your company's DNS servers.

### The Test:

1. Go to [dnsleaktest.com](https://dnsleaktest.com).
2. Run "Standard Test".
3. **Analyze Results**:
   - **Pass**: You only see servers labeled "Proton AG" or "M247".
   - **Fail (Leak)**: You see your Company Name or your ISP's name.
4. Check [whatismyipaddress.com](https://whatismyipaddress.com/).

**If you are leaking**: You should manually set a private DNS in your iwd or system settings (e.g., `1.1.1.1` for Cloudflare) to ensure your company cannot see your browsing history.

## 6. Usage Commands

| Action          | Command                          |
| --------------- | -------------------------------- |
| Start VPN       | `sudo wg-quick up proton`        |
| Stop VPN        | `sudo wg-quick down proton`      |
| Check Stats     | `wg show`                        |
| Emergency Reset | `sudo ip link delete dev proton` |

## 7. Verification

Run these commands to ensure your traffic is successfully masked:

- **Public IP**: `curl ifconfig.me` (Should show US IP)
- **Location**: `curl ipapi.co/country_name` (Should show "United States")

## 8. Optional: Automation (Systemd)

To make the VPN start automatically on boot:

```bash
sudo systemctl enable wg-quick@proton
```
