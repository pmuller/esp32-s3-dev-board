#!/bin/bash -eux
#
# This script downloads and updates KiCad libraries based on JLCPCB data.
#
# Requirements:
# - JLC2KiCad_lib: https://github.com/TousstNicolas/JLC2KiCad_lib

JLCPCB_PARTS=()

# ESP32-S3R8
JLCPCB_PARTS+=(C2913194)

# 1x16 pins header
JLCPCB_PARTS+=(C2894939)

# Antenna
JLCPCB_PARTS+=(
    # 50V 3pF C0G 0603 Multilayer Ceramic Capacitor
    C46219
    # 400mA 2.7nH 200mΩ 0603 Inductor
    C83929
)

# MCU Power
JLCPCB_PARTS+=(
    # 6.3V 10uF X7R ±10% 0805 Multilayer Ceramic Capacitor
    C386019
    # 50V 1uF X5R ±10% 0603 Multilayer Ceramic Capacitor
    C15849
    # 25V 100nF X5R ±10% 0402 Multilayer Ceramic Capacitor
    C880603
    # 50V 10nF X7R ±5% 0805 Multilayer Ceramic Capacitor
    C58456
    # 50V Bi-Directional 5V 0603 Electrostatic and Surge Protection (TVS/ESD)
    C316054
)

# Crystal
JLCPCB_PARTS+=(
    # 24nH ±5% 0603 Inductor
    C139271
    # 250V 10pF NP0 ±5% 0603 Multilayer Ceramic Capacitor
    C726617
    # 40MHz 10pF ±10ppm SMD3225-4P Crystal
    C426988
)

# Buttons
JLCPCB_PARTS+=(
    # 50mA 100MΩ 12V 160gf 3mm 2mm Tactile Switch
    C720477
    # 125mW Thick Film Resistors 150V ±100ppm/℃ ±1% 10kΩ 0805
    C17414
)

# Flash
JLCPCB_PARTS+=(
    # 100mW Thick Film Resistors 75V ±100ppm/℃ ±1% 100kΩ 0603
    C25803
    # 100mW Thick Film Resistors 75V ±5% 0Ω 0603
    C103196
    # 128Mbit SOIC-8-208mil NOR FLASH
    C97521
)

# Voltage regulator
JLCPCB_PARTS+=(
    # 40V 500mV 2A SOD-123FL Schottky Barrier Diode
    C383230
    # 16V 22uF X6S ±10% 1206 Multilayer Ceramic Capacitor
    C435410
    # 1A Fixed 3.3V Positive electrode SOT-223-3 Linear Voltage Regulator
    C6186
)

# USB
JLCPCB_PARTS+=(
    # 100mW Thick Film Resistors 75V ±100ppm/℃ ±1% 5.1kΩ 0603
    C23186
    # Type-C USB Connector
    C2982555
    # SOT-666-6 Electrostatic and Surge Protection
    C2682291
    # 100mW Thick Film Resistors 75V ±100ppm/℃ ±1% 2.2kΩ 0603
    C4190
    # 1mA White 130° 95mW 0402 LED
    C397046
)

JLC2KiCadLib \
    -dir ./libraries \
    -footprint_lib jlcpcb.pretty \
    -symbol_lib jlcpcb \
    -symbol_lib_dir . \
    --skip_existing \
    ${JLCPCB_PARTS[@]}
